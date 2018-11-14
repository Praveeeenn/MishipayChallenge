//
//  CartDataSource.swift
//  MishipayChallenge
//
//  Created by apple on 13/11/18.
//  Copyright © 2018 Praveen. All rights reserved.
//

import UIKit

class CartDataSource: NSObject {

    let cartCellId = "CartTableViewCell"
    
    var products: [RootProduct]?
    
    var cartViewController: CartViewController?
    
    var tableView: UITableView? {
        didSet {
            self.tableView?.dataSource = self
            self.tableView?.delegate = self
            self.tableView?.register(UINib(nibName: cartCellId, bundle: nil), forCellReuseIdentifier: cartCellId)
        }
    }
}

extension CartDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.products?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = self.tableView?.dequeueReusableCell(withIdentifier: cartCellId, for: indexPath) as? CartTableViewCell {
            guard let product = self.products?[indexPath.row].products else { return cell }
            cell.index = indexPath
            cell.delegate = self
            cell.productImageView.fetchImage(product.first?.images?.first ?? "")
            cell.titleLabel.text = product.first?.title ?? "No Title"
            cell.subTitleLabel.text = product.first?.description ?? ""
            cell.priceLabel.text = "\(product.first?.stores?.first?.currency_symbol ?? "") \(product.first?.stores?.first?.store_price ?? "")"
            cell.quantityLabel.text = String(product.first?.quantity ?? 0)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension CartDataSource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Item clicked")
            let navigationController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProductViewController") as! UINavigationController
            let viewController: ProductViewController = navigationController.viewControllers[0] as! ProductViewController
        guard let product = self.products?[indexPath.row] else { return }
            viewController.product = product
            self.cartViewController?.present(navigationController, animated: true, completion: nil)
        self.tableView?.deselectRow(at: indexPath, animated: false)
    }
}



extension CartDataSource: CartItemTableViewCellDelegate {
    
    func decreaseQty(index: IndexPath, newQty: Int) {
        if  newQty <= 0{
            deleteItem(index: index)
        } else {
            let qty:Int? = newQty
            self.products?[index.row].products?.first?.quantity = qty
            self.cartViewController?.products[index.row].products?.first?.quantity = qty
        }
        self.tableView?.reloadData()
        self.cartViewController?.setupTotal()
    }
    
    func increaseQty(index: IndexPath, newQty: Int) {
        let qty:Int? = newQty
        self.products?[index.row].products?.first?.quantity = qty
        self.cartViewController?.products[index.row].products?.first?.quantity = qty
        self.tableView?.reloadData()
        self.cartViewController?.setupTotal()
    }
    
    func deleteItem(index: IndexPath) {
        self.cartViewController?.products.remove(at: index.row)
        self.products?.remove(at: index.row)
        tableView?.deleteRows(at: [index], with: UITableView.RowAnimation.automatic)
        self.tableView?.reloadData()
        self.cartViewController?.setupTotal()
    }
    
    
}
