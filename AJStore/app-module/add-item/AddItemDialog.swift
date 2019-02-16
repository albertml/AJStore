//
//  AddItemDialog.swift
//  AJStore
//
//  Created by Albert on 21/01/2019.
//  Copyright © 2019 Albert. All rights reserved.
//

import UIKit
import LGButton

protocol AddItemProtocol: class {
    func doneAddItem()
}

protocol ViewItemProtocol: class {
    func closeViewItemDialog()
}

class AddItemDialog: UIView {

    // MARK: Properties
    
    @IBOutlet weak var lblScanItem: UILabel!
    @IBOutlet weak var btnAddItemOutlet: LGButton!
    @IBOutlet weak var btnCloseOutlet: LGButton!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfWholeSalePrice: UITextField!
    @IBOutlet weak var tfRetailPrice: UITextField!
    @IBOutlet weak var tfQuantity: UITextField!
    
    weak var delegate: AddItemProtocol?
    weak var delegateViewItem: ViewItemProtocol?
    var presentor: UIViewController!
    var isViewing = false
    var productItem: ProductItem!
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        viewItem()
    }

    // MARK: Actions
    
    @IBAction func btnAdd(_ sender: LGButton) {
        if tfName.text!.isEmpty || tfWholeSalePrice.text!.isEmpty || tfRetailPrice.text!.isEmpty || tfQuantity.text!.isEmpty {
            showDialogInView(vc: self, message: "Please input all fields")
            return
        } else {
            
            _ = ProductItems(name: self.tfName.text!, wholeSalePrice: Double(self.tfWholeSalePrice.text!)!, retailPrice: Double(self.tfRetailPrice.text!)!, qty: Int(self.tfQuantity.text!)!, barCode: "")
            
            showDialogInViewWithAction(vc: self, message: "Item Added") { isAddMore -> (Void) in
                if isAddMore == true {
                    self.tfName.text = ""
                    self.tfWholeSalePrice.text = ""
                    self.tfRetailPrice.text = ""
                    self.tfQuantity.text = ""
                    return
                }
                self.delegate?.doneAddItem()
            }
        }
    }
    
    @IBAction func btnClose(_ sender: LGButton) {
        delegateViewItem?.closeViewItemDialog()
    }
    
    
    // MARK: Methods
    
    func viewItem() {
        btnCloseOutlet.isHidden = isViewing == false
        btnAddItemOutlet.isHidden = isViewing == true
        
        if isViewing == true {
            lblScanItem.text = "SCANNED ITEM"
            tfName.text = productItem.name
            tfWholeSalePrice.text = String(format: "%.2f", productItem.wholeSalePrice)
            tfRetailPrice.text = String(format: "%.2f", productItem.retailPrice)
            tfQuantity.text = "\(productItem.quantity)"
        }
    }
}

extension AddItemDialog: AlertPresenterProtocol {}
