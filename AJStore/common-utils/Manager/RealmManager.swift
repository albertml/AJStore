//
//  RealmManager.swift
//  AJStore
//
//  Created by Albert on 21/01/2019.
//  Copyright © 2019 Albert. All rights reserved.
//

import Foundation
import RealmSwift

struct RealmManager {
    
    let realm = try! Realm()

    func saveDataToRealm(object: Object) {
        try! realm.write {
            realm.add(object, update: true)
        }
    }
    
    func getAllItems() -> [ProductItem] {
        let items = realm.objects(ProductItem.self)
        return Array(items)
    }
    
    func deleteItem(product: ProductItem) {
        let queryItem = realm.objects(ProductItem.self).filter("id == \(product.id)").first
        guard let nnproductItem = queryItem else {
            return
        }
        try! realm.write {
            realm.delete(nnproductItem)
        }
    }
    
    func updateItem(product: ProductItem) {
        let queryItem = realm.objects(ProductItem.self).filter("id == \(product.id)").first
    
        try! realm.write {
            guard let item = queryItem else { return }
            item.name = product.name
            item.wholeSalePrice = product.wholeSalePrice
            item.retailPrice = product.retailPrice
            item.quantity = product.quantity
            realm.add(item, update: true)
        }
    }
}
