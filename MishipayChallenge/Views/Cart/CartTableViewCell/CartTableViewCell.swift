//
//  CartTableViewCell.swift
//  MishipayChallenge
//
//  Created by apple on 13/11/18.
//  Copyright © 2018 Praveen. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    
    @IBOutlet var productImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var quantityLabel: UILabel!
    @IBOutlet var minusButton: UIButton!
    @IBOutlet var plusButton: UIButton!
    
    var index: IndexPath?
    
    var delegate: CartItemTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupView()
    }

    @IBAction func deleteButtonAction(_ sender: Any) {
        print("DeleteButton")
        delegate?.deleteItem(index: index!)
    }
    
    @IBAction func plusButtonAction(_ sender: Any) {
        print("plusButton")
        delegate?.increaseQty(index: index!, newQty: Int(quantityLabel.text!)! + 1)
    }
    
    @IBAction func minusButtonAction(_ sender: Any) {
        print("minusButton")
        delegate?.decreaseQty(index: index!, newQty: Int(quantityLabel.text!)! - 1)
    }
    
    func setupView() {
        self.minusButton.layer.cornerRadius = minusButton.frame.width / 2
        self.plusButton.layer.cornerRadius = plusButton.frame.width / 2
        self.minusButton.clipsToBounds = true
        self.minusButton.clipsToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
