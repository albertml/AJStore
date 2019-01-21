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
    
    func pushToProfileDetailScreen(viewController: ListItemViewController, user: String) {
//        var profileDetailModule = ProfileDetailViewController.instantiate(fromAppStoryboard: .Main)
//        profileDetailModule = ProfileDetailRouter.createProfileDetailModule(user: user)
//        viewController.navigationController?.pushViewController(profileDetailModule,animated: true)
    }
    
}
