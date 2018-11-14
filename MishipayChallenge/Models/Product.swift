//
//  Product.swift
//  MishipayChallenge
//
//  Created by apple on 14/11/18.
//  Copyright © 2018 Praveen. All rights reserved.
//

import Foundation

class Product: Codable {
    var barcode_number: String?
    var title: String?
    var description: String?
    var quantity: Int?
    var images: [String]?
    var stores: [Store]?
    
    init(title: String, description: String, quantity: Int, images: [String], stores: [Store]) {
        self.title = title
        self.description = description
        self.quantity = quantity
        self.stores = stores
        self.images = images
    }
    
}
