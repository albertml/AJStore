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

class AddItemDialog: UIView {

    // MARK: Properties
    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfWholeSalePrice: UITextField!
    @IBOutlet weak var tfRetailPrice: UITextField!
    @IBOutlet weak var tfQuantity: UITextField!
    
    weak var delegate: AddItemProtocol?
    var presentor: UIViewController!
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }

    // MARK: Actions
    
    @IBAction func btnAdd(_ sender: LGButton) {
        if tfName.text!.isEmpty || tfWholeSalePrice.text!.isEmpty || tfRetailPrice.text!.isEmpty || tfQuantity.text!.isEmpty {
            showDialogInView(vc: self, message: "Please input all fields")
            return
        } else {
            
            let productItem = ProductItem(name: self.tfName.text!, wholeSalePrice: Double(self.tfWholeSalePrice.text!)!, retailPrice: Double(self.tfRetailPrice.text!)!, quantity: Int(self.tfQuantity.text!)!)
            _ = ProductItems(item: productItem)
            
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
}

extension AddItemDialog: AlertPresenterProtocol {}
