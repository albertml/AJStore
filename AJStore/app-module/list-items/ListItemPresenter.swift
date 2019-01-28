//
//  ListItemPresenter.swift
//  AJStore
//
//  Created by Albert on 21/01/2019.
//  Copyright © 2019 Albert. All rights reserved.
//

import Foundation

class ListItemPresenter: ListItemViewToPresenterProtocol {
    
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
}

extension ListItemPresenter: ListItemInteractorToPresenterProtocol {
    func successGettingItem(items: [ProductItem]) {
        productItems = items
        view.getAllProduct()
    }
}
