//
//  EditItemPresenter.swift
//  AJStore
//
//  Created by Albert on 28/01/2019.
//  Copyright © 2019 Albert. All rights reserved.
//

import Foundation

class EditItemPresenter: EditItemViewToPresenterProtocol {
    
    var item: ProductItem!
    var router: EditItemPresenterToRouterProtocol?
    var view: EditItemViewController!
    var interactor: EditItemPresenterToInteractorProtocol?
    
    func setTitle() {
        guard let item = item else { return }
        view.setTitle(pageTitle: item.name)
    }
    
    func getItemDetail() {
        view.displayItem(item: item)
    }
    
    func updateItem(item: ProductItem) {
        interactor?.updateItem(item: item)
    }
}

extension EditItemPresenter: EditItemInteractorToPresenterProtocol {
    func successUpdatingItem() {
        view.successUpdatingItem()
    }
}
