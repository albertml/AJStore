//
//  ListItemInteractor.swift
//  AJStore
//
//  Created by Albert on 21/01/2019.
//  Copyright © 2019 Albert. All rights reserved.
//

import Foundation

class ListItemInteractor: ListItemPresenterToInteractorProtocol {
    var presenter: ListItemInteractorToPresenterProtocol?
    private var realmManager = RealmManager()
    
    func getItem() {
        let items = realmManager.getAllItems().sorted { $0.name > $1.name }
        presenter?.successGettingItem(items: items)
    }
    
    func deleteItem(item: ProductItem) {
        realmManager.deleteItem(product: item)
    }
}
