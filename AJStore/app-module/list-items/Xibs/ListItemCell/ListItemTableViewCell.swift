//
//  ListItemTableViewCell.swift
//  AJStore
//
//  Created by Albert on 21/01/2019.
//  Copyright © 2019 Albert. All rights reserved.
//

import UIKit
import SwipeCellKit

class ListItemTableViewCell: SwipeTableViewCell {

    // MARK: Properties
    
    @IBOutlet weak var imgBarCode: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblQuantity: UILabel!
    
    
    // MARK: Properties
    
    var product: ProductItem? {
        didSet {
            if let nnproduct = product {
                lblName.text = nnproduct.name
                lblPrice.text = "W: \(String(format: "%.2f", nnproduct.wholeSalePrice))\nR: \(String(format: "%.2f", nnproduct.retailPrice))"
                lblQuantity.text = "\(nnproduct.quantity)"
                imgBarCode.isHidden = nnproduct.barCode.isEmpty
            }
        }
    }
    
    // TVC - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
