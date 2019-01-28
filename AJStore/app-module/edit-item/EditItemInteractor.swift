//
//  EditItemInteractor.swift
//  AJStore
//
//  Created by Albert on 28/01/2019.
//  Copyright © 2019 Albert. All rights reserved.
//

import Foundation

class EditItemInteractor: EditItemPresenterToInteractorProtocol {
    
    // MARK: Properties
    
    var presenter: EditItemInteractorToPresenterProtocol?
    private var realmManager = RealmManager()
    
    // MARK: Methods
    
    func updateItem(item: ProductItem) {
        realmManager.updateItem(product: item)
        presenter?.successUpdatingItem()
    }
}
