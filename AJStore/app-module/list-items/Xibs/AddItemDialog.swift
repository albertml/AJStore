//
//  AddItemDialog.swift
//  AJStore
//
//  Created by Albert on 21/01/2019.
//  Copyright © 2019 Albert. All rights reserved.
//

import UIKit
import LGButton

protocol AddItemProtocol {
    func didAddItem()
}

class AddItemDialog: UIView {

    // MARK: Properties
    
    var delegate: AddItemProtocol?
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }

    // MARK: Actions
    
    @IBAction func btnAdd(_ sender: LGButton) {
        self.delegate?.didAddItem()
    }
    
}
