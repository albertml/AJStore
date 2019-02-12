//
//  ListItemRouter.swift
//  AJStore
//
//  Created by Albert on 21/01/2019.
//  Copyright © 2019 Albert. All rights reserved.
//

import Foundation
import UIKit

class ListItemRouter: ListItemPresenterToRouterProtocol {
    
    static func createListItemModule() -> ListItemViewController {
        
        let listItemVC = ListItemViewController.instantiate(fromAppStoryboard: .ListItem)
        
        let presenter: ListItemViewToPresenterProtocol & ListItemInteractorToPresenterProtocol = ListItemPresenter()
        let interactor: ListItemPresenterToInteractorProtocol = ListItemInteractor()
        let router: ListItemPresenterToRouterProtocol = ListItemRouter()
        
        listItemVC.presentor = presenter
        presenter.view = listItemVC
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return listItemVC
    }
    
    func pushToEditItemScreen(viewController: ListItemViewController, item: ProductItem) {
        var editItemModule = R.storyboard.editItem.editItemViewControllerID()! //EditItemViewController.instantiate(fromAppStoryboard: .EditItem)
        editItemModule.delegate = viewController
        editItemModule = EditItemRouter.createEditItemModule(item: item)
        viewController.navigationController?.pushViewController(editItemModule,animated: true)
    }
    
}
