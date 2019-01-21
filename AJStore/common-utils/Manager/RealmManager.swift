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
    
    func getAllItems() -> [ProductItemInDB] {
        let items = realm.objects(ProductItemInDB.self)
        return Array(items)
    }
    
    func deleteItem(product: ProductItemInDB) {
        let queryItem = realm.objects(ProductItemInDB.self).filter("id == \(product.id)").first
        guard let nnproductItem = queryItem else {
            return
        }
        try! realm.write {
            realm.delete(nnproductItem)
        }
    }
}
