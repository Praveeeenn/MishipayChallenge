//
//  Store.swift
//  MishipayChallenge
//
//  Created by apple on 14/11/18.
//  Copyright © 2018 Praveen. All rights reserved.
//

import Foundation

class Store: Codable {
    var store_price: String?
    var currency_symbol: String?
    
    init(storePrice: String, currencySymbol: String) {
        self.store_price = storePrice
        self.currency_symbol = currencySymbol
    }
}
