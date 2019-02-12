//
//  ListItemViewController.swift
//  AJStore
//
//  Created by Albert on 21/01/2019.
//  Copyright © 2019 Albert. All rights reserved.
//

import UIKit
import LGButton
import PopupKit
import ViewAnimator
import SwipeCellKit

class ListItemViewController: UIViewController {

    // Outlets
    
    @IBOutlet weak var tblListItems: UITableView!
    
    
    // MARK: Properties
    
    var presentor: ListItemViewToPresenterProtocol?
    var searchController: UISearchController!
    var popUpView: PopupView!
    
    // MARK: VC Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        }
        
        presentor?.setupRefreshControl()
        presentor?.setupSearchController(vc: self)
        presentor?.setTitle()
        presentor?.setupTableViewCells()
        presentor?.getItem()
        tableViewAnimations()
    }
    
    // MARK: - Methods
    
    @objc func refresh() {
        presentor?.getItem()
    }
    
    private func tableViewAnimations() {
        let animation = [AnimationType.from(direction: .right, offset: 30.0)]
        //        let fromAnimation = AnimationType.from(direction: .right, offset: 30.0)
        //        let zoomAnimation = AnimationType.zoom(scale: 0.2)
        UIView.animate(views: tblListItems.visibleCells, animations: animation, completion: nil)
    }
    
    // MARK: - Actions
    
    @IBAction func btnAdd(_ sender: LGButton) {
        let addItemView: AddItemDialog = UIView.fromNib()
        addItemView.delegate = self
        addItemView.presentor = self
        popUpView = PopupView(contentView: addItemView, showType: PopupView.ShowType.bounceInFromTop, dismissType: PopupView.DismissType.fadeOut, maskType: PopupView.MaskType.dimmed, shouldDismissOnBackgroundTouch: true, shouldDismissOnContentTouch: false)
        popUpView.show()
    }
}

extension ListItemViewController: ListItemPresenterToViewProtocol {
    func setTitle(pageTitle: String) {
        self.title = pageTitle
    }
    
    func getAllProduct() {
        tblListItems.refreshControl?.endRefreshing()
        tblListItems.reloadData()
    }
    
    func setupRefreshControl(refreshControl: UIRefreshControl) {
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tblListItems.refreshControl = refreshControl
    }
    
    func setupTableViewCells() {
        tblListItems.tableFooterView = UIView(frame: CGRect.zero)
        let headerCell = UINib(nibName: NibName.ListItemHeader, bundle: nil)
        tblListItems.register(headerCell, forCellReuseIdentifier: NibName.ListItemHeader)
        let contentCell = UINib(nibName: NibName.ListItemContent, bundle: nil)
        tblListItems.register(contentCell, forCellReuseIdentifier: CellIdentifier.ListItem)
    }
    
    func setupSearchController(searchController: UISearchController) {
        self.searchController = searchController
        navigationItem.searchController = self.searchController
        definesPresentationContext = true
    }
}

extension ListItemViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let nnpresenter = presentor {
            if nnpresenter.isFiltering() {
                return nnpresenter.filteredProductItems.count
            }
            return nnpresenter.productItems.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let nnpresenter = presentor {
            let listItemCell: ListItemTableViewCell = tableView.dequeueReusableCell(indexPath: indexPath)
            listItemCell.delegate = self
            if nnpresenter.isFiltering() {
                listItemCell.product = nnpresenter.filteredProductItems[indexPath.row]
            } else {
                listItemCell.product = nnpresenter.productItems[indexPath.row]
            }
            return listItemCell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55.0
    }
}

extension ListItemViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerListItem = tableView.dequeueReusableCell(withIdentifier: NibName.ListItemHeader)
        return headerListItem
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let nnpresenter = presentor {
            if nnpresenter.isFiltering() {
                nnpresenter.goToItemDetail(item: nnpresenter.filteredProductItems[indexPath.row])
            } else {
                nnpresenter.goToItemDetail(item: nnpresenter.productItems[indexPath.row])
            }
        }
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
