//
//  ListItemViewController.swift
//  AJStore
//
//  Created by Albert on 21/01/2019.
//  Copyright © 2019 Albert. All rights reserved.
//

import UIKit

class ListItemViewController: UIViewController {

    // Outlets
    
    @IBOutlet weak var tblListItems: UITableView!
    
    
    // MARK: Properties
    
    var presentor: ListItemViewToPresenterProtocol?
    let searchController = UISearchController(searchResultsController: nil)
    
    
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
        
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        }
        
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Product"
        navigationItem.searchController = searchController
        definesPresentationContext = true

    }
}

extension ListItemViewController: ListItemPresenterToViewProtocol {
    func setTitle(pageTitle: String) {
        self.title = pageTitle
    }
    
    func displayUser(user: String) {
        
    }
    
    func failedToFetchUser(errorMsg: String) {
        
    }
    
    func getAllProduct() {
        tblListItems.reloadData()
    }
    
}

extension ListItemViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let _presenter = presentor {
            if _presenter.isFiltering() {
                return _presenter.filteredProductItems.count
            }
            return _presenter.productItems.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let _presenter = presentor {
            let listItemCell: ListItemTableViewCell = tableView.dequeueReusableCell(indexPath: indexPath)
            if _presenter.isFiltering() {
                listItemCell.product = _presenter.filteredProductItems[indexPath.row]
            } else {
               listItemCell.product = _presenter.productItems[indexPath.row]
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
}

extension ListItemViewController: UISearchResultsUpdating {
    
    // MARK: - Private instance methods
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        if let _presenter = presentor {
            _presenter.filteredProductItems = _presenter.productItems.filter({( product : ProductItem) -> Bool in
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
