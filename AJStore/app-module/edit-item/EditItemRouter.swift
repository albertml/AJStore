//
//  EditItemRouter.swift
//  AJStore
//
//  Created by Albert on 28/01/2019.
//  Copyright © 2019 Albert. All rights reserved.
//

import UIKit

struct EditItemRouter: EditItemPresenterToRouterProtocol {
    
    static func createEditItemModule(item: ProductItem) -> EditItemViewController {
        let editItemVC = EditItemViewController.instantiate(fromAppStoryboard: .EditItem)
        
        let presenter: EditItemViewToPresenterProtocol & EditItemInteractorToPresenterProtocol = EditItemPresenter()
        var interactor: EditItemPresenterToInteractorProtocol = EditItemInteractor()
        let router: EditItemPresenterToRouterProtocol = EditItemRouter()
        presenter.item = item
        editItemVC.presenter = presenter
        presenter.view = editItemVC
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return editItemVC
    }
    
    func pushToMovieScreen(navigationConroller navigationController: UINavigationController) {
        //
    }

}
