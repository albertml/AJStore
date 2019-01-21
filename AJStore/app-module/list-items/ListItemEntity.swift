//
//  ListItemEntity.swift
//  AJStore
//
//  Created by Albert on 21/01/2019.
//  Copyright © 2019 Albert. All rights reserved.
//

import Foundation
import RealmSwift

struct ProductItem {
    let name: String
    let wholeSalePrice: Double
    let retailPrice: Double
    let quantity: Int
}


class ProductItemInDB: Object {
    @objc dynamic var id = 0
    @objc dynamic var name: String = ""
    @objc dynamic var wholeSalePrice: Double = 0.0
    @objc dynamic var retailPrice: Double = 0.0
    @objc dynamic var quantity: Int = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

struct ProductItems {
    
    private var realmManager = RealmManager()
    let realm = try! Realm()
    
    init() {}
    
    init(item: ProductItem) {
        let id = generateRandomId()
        let queryPackage = realm.objects(ProductItemInDB.self).filter("id == \(id)").first
        
        let productItem = ProductItemInDB()
        productItem.id = id
        productItem.name = item.name
        productItem.wholeSalePrice = item.wholeSalePrice
        productItem.retailPrice = item.retailPrice
        productItem.quantity = item.quantity
        
        if let _ = queryPackage {
            realmManager.saveDataToRealm(object: productItem)
        } else {
            try! realm.write {
                realm.add(productItem)
            }
        }
    }
    
    func generateRandomId() -> Int {
        return Int(arc4random_uniform(10000))
    }
}
