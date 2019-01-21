//
//  AlertPresenter.swift
//  AJStore
//
//  Created by Albert on 21/01/2019.
//  Copyright © 2019 Albert. All rights reserved.
//

import UIKit

protocol AlertPresenterProtocol {
    func showDialog(vc: UIViewController, message: String)
    func showDialogInView(vc: UIView, message: String)
    func showDialogInViewWithAction(vc: UIView, message: String, callBack: @escaping (Bool) -> (Void))
}

extension AlertPresenterProtocol {
    func showDialog(vc: UIViewController, message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
    
    func showDialogInView(vc: UIView, message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        alert.showDialogInView()
    }
    
    func showDialogInViewWithAction(vc: UIView, message: String, callBack: @escaping (Bool) -> (Void)) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { _ in
            callBack(false)
        }))
        alert.addAction(UIAlertAction(title: "Add More", style: .cancel, handler: { _ in
            callBack(true)
        }))
        
        alert.showDialogInView()
    }
}


public extension UIAlertController {
    func showDialogInView() {
        let win = UIWindow(frame: UIScreen.main.bounds)
        let vc = UIViewController()
        vc.view.backgroundColor = .clear
        win.rootViewController = vc
        win.windowLevel = UIWindow.Level.alert + 1
        win.makeKeyAndVisible()
        vc.present(self, animated: true, completion: nil)
    }
}
