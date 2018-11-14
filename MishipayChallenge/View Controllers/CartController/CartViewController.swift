//
//  CartViewController.swift
//  MishipayChallenge
//
//  Created by apple on 13/11/18.
//  Copyright © 2018 Praveen. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {

    var cartDataSource: CartDataSource = CartDataSource()
    
    var products: [RootProduct] = [RootProduct]()
    
    @IBOutlet var cartTableView: UITableView!
    @IBOutlet var payButton: UIButton!
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: cartNotificationKey), object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCartTableView()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(doSomethingAfterNotified(notification:)),
                                               name: NSNotification.Name(rawValue: cartNotificationKey),
                                               object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupCartTableView()
    }
    
    @objc func doSomethingAfterNotified(notification: Notification) {
        print("I've been notified")
        var found: Bool = true
        if let recievedProduct = notification.object as? RootProduct {
            if let id = recievedProduct.products?.first?.barcode_number {
                print(id)
                for index in 0..<self.products.count {
                    print(index)
                    if id == self.products[index].products?.first?.barcode_number {
                        if var qty = self.products[index].products?.first?.quantity {
                            qty += 1
                            self.products[index].products?.first?.quantity = qty
                        }
                        found = true
                    } else {
                        found = false
                    }
                }
                if self.products.count == 0 || found == false {
                    self.products.append(recievedProduct)
                }
            }
        }
    }

    func setupCartTableView() {
        self.cartDataSource.tableView = self.cartTableView
        self.cartDataSource.products = self.products
        self.cartDataSource.cartViewController = self
        self.cartDataSource.tableView?.reloadData()
        self.setupTotal()
    }
    
    func setupTotal() {
        let total: Double = self.products.reduce(0.0) { (result, product) -> Double in
            let price: Double = (Double((product.products?.first?.stores?.first?.store_price ?? "0.0")) ?? 0.0) * (Double((product.products?.first?.quantity ?? 0)))
            return result + price
        }
        self.payButton.setTitle("PAY NOW \(self.products.first?.products?.first?.stores?.first?.currency_symbol ?? "") \(total.rounded(.toNearestOrAwayFromZero))", for: .normal)
    }
    
    
    @IBAction func payButtonAction(_ sender: UIButton) {
        print("Pay Button Action")
    }
    
    @IBAction func applyCouponCodeAction(_ sender: UIButton) {
        print("ApplyCouponCode Action")
    }
    
}
