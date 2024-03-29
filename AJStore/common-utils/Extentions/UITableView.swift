//
//  UITableView.swift
//  AJStore
//
//  Created by Albert on 21/01/2019.
//  Copyright © 2019 Albert. All rights reserved.
//

import UIKit

public extension UITableView {
    
    func register<T: UITableViewCell>(_: T.Type) {
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
        self.rowHeight = UITableView.automaticDimension
        self.tableFooterView = UIView()
    }
    
    func dequeueReusableCell<T: UITableViewCell>(indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
    
    func dequeueReusableNoIndexCell<T: UITableViewCell>() -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
    
}


extension UITableViewCell: ReusableView {}
