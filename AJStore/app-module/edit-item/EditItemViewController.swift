//
//  EditItemViewController.swift
//  AJStore
//
//  Created by Albert on 28/01/2019.
//  Copyright © 2019 Albert. All rights reserved.
//

import UIKit
import LGButton

class EditItemViewController: UIViewController, AlertPresenterProtocol {

    // MARK: Properties
    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfWholesalePrice: UITextField!
    @IBOutlet weak var tfRetailPrice: UITextField!
    @IBOutlet weak var tfQuantity: UITextField!
    
    var presenter: EditItemViewToPresenterProtocol?
    var delegate: EditItemUpdatedProtocol?
    
    // MARK: VC Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.setTitle()
        presenter?.getItemDetail()
    }
    

    // MARK: Actions
    
    @IBAction func btnEditItem(_ sender: LGButton) {
        guard let _presenter = presenter else { return }
        
        let updatedItem = ProductItem()
        updatedItem.id = _presenter.item.id
        updatedItem.name = tfName.text!
        updatedItem.wholeSalePrice = Double(tfWholesalePrice.text!)!
        updatedItem.retailPrice = Double(tfRetailPrice.text!)!
        updatedItem.quantity = Int(tfQuantity.text!)!
        
        _presenter.updateItem(item: updatedItem)
    }
    
}

extension EditItemViewController: EditItemPresenterToViewProtocol {
    func setTitle(pageTitle: String) {
        self.title = pageTitle
    }
    
    func displayItem(item: ProductItem) {
        tfName.text = item.name
        tfWholesalePrice.text = String(format: "%.2f", item.wholeSalePrice)
        tfRetailPrice.text = String(format: "%.2f", item.retailPrice)
        tfQuantity.text = "\(item.quantity)"
    }
    
    func successUpdatingItem() {
        showDialogInViewWithOkAction(vc: self, message: "Item updated successfully.") { _ -> (Void) in
            self.delegate?.reloadUpdatedItem()
            self.navigationController?.popViewController(animated: true)
        }
    }
}
