//
//  CollectionViewCell.swift
//  eCommerceDemo
//
//  Created by Prithviraj Patil on 04/07/19.
//  Copyright © 2019 Prithviraj Patil. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet public weak var innerView: UIView!
    @IBOutlet public weak var categoryImage: UIImageView!
    @IBOutlet public weak var categoryName: UILabel!
    
    override func awakeFromNib() {
        super .awakeFromNib()
    }
    
    func configureCell(model: ProductsCategory) {
        categoryName.text = model.name
        categoryImage.image = UIImage(named: model.imageURL)
        print(model.name)
    }
}
