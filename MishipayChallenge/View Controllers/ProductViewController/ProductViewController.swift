//
//  ProductViewController.swift
//  MishipayChallenge
//
//  Created by apple on 14/11/18.
//  Copyright © 2018 Praveen. All rights reserved.
//

import UIKit

let cartNotificationKey = "com.mishipay.notificationKey"

class ProductViewController: UIViewController {
    
    @IBOutlet var productImageView: UIImageView!
    @IBOutlet var productTitleLabel: UILabel!
    @IBOutlet var productDescriptionLabel: UILabel!
    @IBOutlet var buyButton: UIButton!
    
    var product: RootProduct?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setData()
    }
    
    @IBAction func buyButtonAction(_ sender: UIButton) {
        print("BuyButtoAction")
        self.product?.products?.first?.quantity = 1
        NotificationCenter.default.post(name: Notification.Name(rawValue: cartNotificationKey), object: self.product)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setData() {
        guard let product = self.product else { return }
        if let title = product.products?.first?.title {
            self.productTitleLabel.text =  title
        }
        if let description = product.products?.first?.description {
            self.productDescriptionLabel.text = description
        }
        if let imageURL = product.products?.first?.images?.first {
            self.productImageView.fetchImage(imageURL)
        }
        if let price = product.products?.first?.stores?.first?.store_price, let symbol = product.products?.first?.stores?.first?.currency_symbol {
            self.buyButton.setTitle("\(symbol) \(price) / BUY NOW", for: .normal)
        }
    }
}
