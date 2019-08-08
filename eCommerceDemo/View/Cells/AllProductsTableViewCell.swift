//
//  AllProductsTableViewCell.swift
//  eCommerceDemo
//
//  Created by Prithviraj Patil on 11/07/19.
//  Copyright © 2019 Prithviraj Patil. All rights reserved.
//

import UIKit

class AllProductsTableViewCell: UITableViewCell {
    @IBOutlet public weak var productsView: UIView!
    @IBOutlet public weak var productImage: UIImageView!
    @IBOutlet public weak var productName: UILabel!
    @IBOutlet public weak var productPrice: UILabel!
    @IBOutlet public weak var productDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Setting Custom properties to ProductsView
        productsView.layer.borderWidth = 0.3
        productsView.layer.borderColor = UIColor.lightGray.cgColor
    }
}
