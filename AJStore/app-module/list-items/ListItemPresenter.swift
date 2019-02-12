//
//  ListItemPresenter.swift
//  AJStore
//
//  Created by Albert on 21/01/2019.
//  Copyright © 2019 Albert. All rights reserved.
//

import UIKit

class ListItemPresenter: ListItemViewToPresenterProtocol {
    
    private var refreshControl: UIRefreshControl {
        var refreshColor: UIColor!
        if #available(iOS 11.0, *) {
            refreshColor = R.color.flat_refresh_gray()
        } else {
            refreshColor = R.color.flat_gray()
        }
        
        let refreshControls = UIRefreshControl()
        let attr = NSAttributedString(string: "", attributes: [NSAttributedString.Key.foregroundColor: refreshColor])
        refreshControls.attributedTitle = NSAttributedString(attributedString: attr)
        refreshControls.tintColor = refreshColor
        
        return refreshControls
    }

    var router: ListItemPresenterToRouterProtocol?
    var view: ListItemViewController!
    var interactor: ListItemPresenterToInteractorProtocol!
    var productItems: [ProductItem] = []
    var filteredProductItems: [ProductItem] = []
    
    func setTitle() {
        view.setTitle(pageTitle: "A&J Store")
    }
    
    func getItem() {
        interactor.getItem()
    }
    
    func isFiltering() -> Bool {
        return view.searchController.isActive && !view.searchController.searchBar.text!.isEmpty
    }

    func deleteItem(item: ProductItem) {
        interactor.deleteItem(item: item)
    }
    
    func goToItemDetail(item: ProductItem) {
        router?.pushToEditItemScreen(viewController: view, item: item)
    }
    
    func setupSearchController(vc: UIViewController) {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = vc as? UISearchResultsUpdating
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Product"
        
        view.setupSearchController(searchController: searchController)
    }
    
    func setupRefreshControl() {
        view.setupRefreshControl(refreshControl: refreshControl)
    }
    
    func setupTableViewCells() {
        view.setupTableViewCells()
    }
}

extension ListItemPresenter: ListItemInteractorToPresenterProtocol {
    func successGettingItem(items: [ProductItem]) {
        productItems = items
        view.getAllProduct()
    }
}
