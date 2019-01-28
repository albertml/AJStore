//
//  ListItemViewController+Extensions.swift
//  AJStore
//
//  Created by Albert on 28/01/2019.
//  Copyright © 2019 Albert. All rights reserved.
//

import Foundation


extension ListItemViewController: EditItemUpdatedProtocol {
    func reloadUpdatedItem() {
        tblListItems.reloadData()
    }
}
