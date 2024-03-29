//
//  ListItemProtocol.swift
//  AJStore
//
//  Created by Albert on 21/01/2019.
//  Copyright © 2019 Albert. All rights reserved.
//

import UIKit

protocol ListItemPresenterToViewProtocol: class {
    func setTitle(pageTitle: String)
    func getAllProduct()
    func setupRefreshControl(refreshControl: UIRefreshControl)
    func setupTableViewCells()
    func setupSearchController(searchController: UISearchController)
    func addRightBarButton()
    func scanItem()
    func getSingleItem(productItem: ProductItem?)
}

protocol ListItemViewToPresenterProtocol: class {
    var router: ListItemPresenterToRouterProtocol? { get set }
    var view: ListItemViewController! { get set }
    var interactor: ListItemPresenterToInteractorProtocol! { get set }
    var productItems: [ProductItem] { get set }
    var filteredProductItems: [ProductItem] { get set }
    func isFiltering() -> Bool
    func setTitle()
    func getItem()
    func deleteItem(item: ProductItem)
    func goToItemDetail(item: ProductItem)
    func setupRefreshControl()
    func setupSearchController(vc: UIViewController)
    func setupTableViewCells()
    func addRightBarButton()
    func scanItem()
    func getSingleItem(barCode: String)
}

protocol ListItemInteractorToPresenterProtocol: class {
    func successGettingItem(items: [ProductItem])
}

protocol ListItemPresenterToRouterProtocol: class {
    static func createListItemModule() -> ListItemViewController
    func pushToEditItemScreen(viewController: ListItemViewController, item: ProductItem)
}

protocol ListItemPresenterToInteractorProtocol: class {
    var presenter: ListItemInteractorToPresenterProtocol? { get set }
    func getItem()
    func deleteItem(item: ProductItem)
}
