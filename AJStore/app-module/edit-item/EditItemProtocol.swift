//
//  EditItemProtocol.swift
//  AJStore
//
//  Created by Albert on 28/01/2019.
//  Copyright © 2019 Albert. All rights reserved.
//


import UIKit

protocol EditItemPresenterToViewProtocol: class {
    func setTitle(pageTitle: String)
    func displayItem(item: ProductItem)
    func successUpdatingItem()
}

protocol EditItemViewToPresenterProtocol: class {
    var router: EditItemPresenterToRouterProtocol? { get set }
    var view: EditItemViewController! { get set }
    var interactor: EditItemPresenterToInteractorProtocol? { get set }
    var item: ProductItem! { get set }
    func setTitle()
    func getItemDetail()
    func updateItem(item: ProductItem)
}

protocol EditItemInteractorToPresenterProtocol {
    func successUpdatingItem()
}

protocol EditItemPresenterToRouterProtocol {
    static func createEditItemModule(item: ProductItem) -> EditItemViewController
//    func pushToMovieScreen(navigationConroller navigationController: UINavigationController)
}

protocol EditItemPresenterToInteractorProtocol {
    var presenter: EditItemInteractorToPresenterProtocol? { get set }
    func updateItem(item: ProductItem)
}

protocol EditItemUpdatedProtocol {
    func reloadUpdatedItem()
}
