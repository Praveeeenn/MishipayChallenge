//
//  CartItemTableViewCellDelegate.swift
//  MishipayChallenge
//
//  Created by apple on 14/11/18.
//  Copyright © 2018 Praveen. All rights reserved.
//

import Foundation

protocol CartItemTableViewCellDelegate {
    func decreaseQty(index: IndexPath, newQty: Int)
    func increaseQty(index: IndexPath, newQty: Int)
    func deleteItem(index: IndexPath)
}
