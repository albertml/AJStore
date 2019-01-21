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
    var productItems: [ProductItemInDB] = []
    var filteredProductItems: [ProductItemInDB] = []
    private var realmManager = RealmManager()
    
    func setTitle() {
        view.setTitle(pageTitle: "A&J Store")
    }
    
    func getItem() {
        self.productItems = realmManager.getAllItems().sorted { $0.name > $1.name }
        view.getAllProduct()
    }
    
    func isFiltering() -> Bool {
        return view.searchController.isActive && !view.searchController.searchBar.text!.isEmpty
    }

    func deleteItem(item: ProductItemInDB) {
        realmManager.deleteItem(product: item)
    }
}

extension ListItemPresenter: ListItemInteractorToPresenterProtocol {
    func successFetchUser(user: String) {
        //
    }
    
    func failedToFetchUser(errorMsg: String) {
        //
    }
    
    
}
