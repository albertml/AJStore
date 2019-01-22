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

class ListItemViewController: UIViewController {

    // Outlets
    
    @IBOutlet weak var tblListItems: UITableView!
    
    
    // MARK: Properties
    
    var presentor: ListItemViewToPresenterProtocol?
    let searchController = UISearchController(searchResultsController: nil)
    var popUpView: PopupView!
    
    // MARK: VC Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presentor?.setTitle()
        
        tblListItems.tableFooterView = UIView(frame: CGRect.zero)
        let headerCell = UINib(nibName: NibName.ListItemHeader, bundle: nil)
        tblListItems.register(headerCell, forCellReuseIdentifier: NibName.ListItemHeader)
        let contentCell = UINib(nibName: NibName.ListItemContent, bundle: nil)
        tblListItems.register(contentCell, forCellReuseIdentifier: CellIdentifier.ListItem)
 
        presentor?.getItem()
        
        var refreshColor: UIColor!
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
            refreshColor = UIColor.init(hex: 0x009051)
        } else {
            refreshColor = UIColor.gray
        }
        
        let refreshControls = UIRefreshControl()
        let attr = NSAttributedString(string: "", attributes: [NSAttributedString.Key.foregroundColor: refreshColor])
        refreshControls.attributedTitle = NSAttributedString(attributedString: attr)
        refreshControls.tintColor = refreshColor
        refreshControls.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tblListItems.refreshControl = refreshControls
        
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Product"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    // MARK: - Methods
    
    @objc func refresh() {
        presentor?.getItem()
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
    
    @available(iOS 11.0, *)
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action =  UIContextualAction(style: .normal, title: "", handler: { (action,view,completionHandler ) in
            if let nnpresenter = self.presentor {
                if nnpresenter.isFiltering() {
                    nnpresenter.deleteItem(item: nnpresenter.filteredProductItems[indexPath.row])
                    nnpresenter.filteredProductItems.remove(at: indexPath.row)
                } else {
                    nnpresenter.deleteItem(item: nnpresenter.productItems[indexPath.row])
                    nnpresenter.productItems.remove(at: indexPath.row)
                }
            }
            self.tblListItems.reloadData()
            completionHandler(true)
        })
        action.image = #imageLiteral(resourceName: "ic_trash")
        action.backgroundColor = UIColor.init(hex: 0xff0000)
        let confrigation = UISwipeActionsConfiguration(actions: [action])
        
        return confrigation
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
}

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
