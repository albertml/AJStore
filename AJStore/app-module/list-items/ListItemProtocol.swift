//
//  ListItemProtocol.swift
//  AJStore
//
//  Created by Albert on 21/01/2019.
//  Copyright © 2019 Albert. All rights reserved.
//

import Foundation

protocol ListItemPresenterToViewProtocol: class {
    func setTitle(pageTitle: String)
    func displayUser(user: String)
    func failedToFetchUser(errorMsg: String)
    func getAllProduct()
}

protocol ListItemViewToPresenterProtocol: class {
    var router: ListItemPresenterToRouterProtocol? { get set }
    var view: ListItemViewController! { get set }
    var interactor: ListItemPresenterToInteractorProtocol! { get set }
    var productItems: [ProductItem] { get set }
    var filteredProductItems: [ProductItem] { get set }
    func isFiltering() -> Bool
    func setTitle()
    func fetchUser()
    func goToProfileDetail()
    func getItem()
}

protocol ListItemInteractorToPresenterProtocol: class {
    func successFetchUser(user: String)
    func failedToFetchUser(errorMsg: String)
}

protocol ListItemPresenterToRouterProtocol: class {
    static func createListItemModule() -> ListItemViewController
    func pushToProfileDetailScreen(viewController: ListItemViewController, user: String)
}

protocol ListItemPresenterToInteractorProtocol: class {
    var presenter: ListItemInteractorToPresenterProtocol? { get set }
    func fetchRandomUser()
}
