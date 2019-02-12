//
//  ListItemViewController+Extensions.swift
//  AJStore
//
//  Created by Albert on 28/01/2019.
//  Copyright © 2019 Albert. All rights reserved.
//

import UIKit

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
}

extension ListItemViewController: AddItemProtocol {
    func doneAddItem() {
        popUpView.dismissPresentingPopup()
        presentor?.getItem()
    }
}

extension ListItemViewController: EditItemUpdatedProtocol {
    func reloadUpdatedItem() {
        tblListItems.reloadData()
    }
}
