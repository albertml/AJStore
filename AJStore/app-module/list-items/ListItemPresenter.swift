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
    
    func fetchUser() {
        
    }
    
    func goToProfileDetail() {
        
    }
    
    func getItem() {
        let item: [ProductItem] = [
            ProductItem(name: "Kopiko Blanca Twin", wholeSalePrice: 120.00, retailPrice: 10.00, quantity: 12),
            ProductItem(name: "Kopiko Blanca Single", wholeSalePrice: 84.00, retailPrice: 10.00, quantity: 12)
        ]
        
        self.productItems = item
        view.getAllProduct()
    }
    
    func isFiltering() -> Bool {
        return view.searchController.isActive && !view.searchController.searchBar.text!.isEmpty
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
