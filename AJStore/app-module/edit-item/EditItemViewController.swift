//
//  EditItemViewController.swift
//  AJStore
//
//  Created by Albert on 28/01/2019.
//  Copyright © 2019 Albert. All rights reserved.
//

import UIKit
import LGButton
import BarcodeScanner

class EditItemViewController: UIViewController, AlertPresenterProtocol {

    // MARK: Properties
    
    @IBOutlet weak var lblBarCode: UILabel!
    @IBOutlet weak var btnBarCode: UIButton! {
        didSet {
            btnBarCode.layer.cornerRadius = 3
            btnBarCode.layer.borderColor = UIColor.black.cgColor
            btnBarCode.layer.borderWidth = 2
            btnBarCode.layer.masksToBounds = true
        }
    }
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
        updatedItem.barCode = lblBarCode.text == nil ? "" : lblBarCode.text!
        
        _presenter.updateItem(item: updatedItem)
    }
    
    @IBAction func btnScanBarCode(_ sender: UIButton) {
        let viewController = BarcodeScannerViewController()
        viewController.headerViewController.titleLabel.text = "Scan Barcode"
        viewController.headerViewController.closeButton.tintColor = .red
        viewController.cameraViewController.barCodeFocusViewType = .animated
        viewController.cameraViewController.showsCameraButton = true
        let title = NSAttributedString(
            string: "Settings",
            attributes: [.font: UIFont.boldSystemFont(ofSize: 17), .foregroundColor : UIColor.white]
        )
        viewController.cameraViewController.settingsButton.setAttributedTitle(title, for: UIControl.State())
        viewController.codeDelegate = self
        viewController.errorDelegate = self
        viewController.dismissalDelegate = self
        
        present(viewController, animated: true, completion: nil)
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
        lblBarCode.text = item.barCode
    }
    
    func successUpdatingItem() {
        showDialogInViewWithOkAction(vc: self, message: "Item updated successfully.") { _ -> (Void) in
            self.delegate?.reloadUpdatedItem()
            self.navigationController?.popViewController(animated: true)
        }
    }
}

extension EditItemViewController: BarcodeScannerCodeDelegate {
    func scanner(_ controller: BarcodeScannerViewController, didCaptureCode code: String, type: String) {
        print(code)
        lblBarCode.text = code
        controller.dismiss(animated: true, completion: nil)
    }
}

extension EditItemViewController: BarcodeScannerErrorDelegate {
    func scanner(_ controller: BarcodeScannerViewController, didReceiveError error: Error) {
        print(error)
    }
}

extension EditItemViewController: BarcodeScannerDismissalDelegate {
    func scannerDidDismiss(_ controller: BarcodeScannerViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
