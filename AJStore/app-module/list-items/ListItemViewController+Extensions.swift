//
//  ListItemViewController+Extensions.swift
//  AJStore
//
//  Created by Albert on 28/01/2019.
//  Copyright © 2019 Albert. All rights reserved.
//

import UIKit
import BarcodeScanner
import SwipeCellKit
import PopupKit

extension ListItemViewController: UISearchResultsUpdating {
    
    // MARK: - Private instance methods
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        if let nnpresenter = presentor {
            nnpresenter.filteredProductItems = nnpresenter.productItems.filter({( product : ProductItem) -> Bool in
                return product.name.lowercased().contains(searchText.lowercased())
            })
            tblListItems.reloadData()
        }
    }
    
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
        
    }
    
    func getSingleItem(productItem: ProductItem?) {
        if let nnproductItem = productItem {
            let viewItemView: AddItemDialog = UIView.fromNib()
            viewItemView.delegateViewItem = self
            viewItemView.presentor = self
            viewItemView.isViewing = true
            viewItemView.productItem = nnproductItem
            popUpView = PopupView(contentView: viewItemView, showType: PopupView.ShowType.bounceInFromTop, dismissType: PopupView.DismissType.fadeOut, maskType: PopupView.MaskType.dimmed, shouldDismissOnBackgroundTouch: true, shouldDismissOnContentTouch: false)
            popUpView.show()
        }
    }
}

extension ListItemViewController: AddItemProtocol {
    func doneAddItem() {
        popUpView.dismissPresentingPopup()
        presentor?.getItem()
    }
}

extension ListItemViewController: ViewItemProtocol {
    func closeViewItemDialog() {
        popUpView.dismissPresentingPopup()
    }
}

extension ListItemViewController: EditItemUpdatedProtocol {
    func reloadUpdatedItem() {
        tblListItems.reloadData()
    }
}

extension ListItemViewController: SwipeTableViewCellDelegate {
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        
        let deleteAction = SwipeAction(style: .destructive, title: nil) { action, indexPath in
            if let nnpresenter = self.presentor {
                if nnpresenter.isFiltering() {
                    nnpresenter.deleteItem(item: nnpresenter.filteredProductItems[indexPath.row])
                    nnpresenter.filteredProductItems.remove(at: indexPath.row)
                } else {
                    nnpresenter.deleteItem(item: nnpresenter.productItems[indexPath.row])
                    nnpresenter.productItems.remove(at: indexPath.row)
                }
            }
        }
        
        // customize the action appearance
        deleteAction.image = R.image.ic_trash()
        
        return [deleteAction]
    }
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        options.transitionStyle = .border
        return options
    }
}


extension ListItemViewController: BarcodeScannerCodeDelegate {
    func scanner(_ controller: BarcodeScannerViewController, didCaptureCode code: String, type: String) {
        presentor?.getSingleItem(barCode: code)
        controller.dismiss(animated: true, completion: nil)
    }
}

extension ListItemViewController: BarcodeScannerErrorDelegate {
    func scanner(_ controller: BarcodeScannerViewController, didReceiveError error: Error) {
        print(error)
    }
}

extension ListItemViewController: BarcodeScannerDismissalDelegate {
    func scannerDidDismiss(_ controller: BarcodeScannerViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
