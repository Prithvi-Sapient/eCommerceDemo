//
//  ProductDescriptionViewController.swift
//  eCommerceDemo
//
//  Created by Prithviraj Patil on 13/07/19.
//  Copyright © 2019 Prithviraj Patil. All rights reserved.
//

import UIKit
// MARK: - This class shows the product Description
class ProductDescriptionViewController: UIViewController {

    open var ProductCellData: Product!
    open var CellImage = UIImage()

    @IBOutlet open weak var productName: UILabel!
    @IBOutlet open weak var productProce: UILabel!
    @IBOutlet open weak var productDescription: UILabel!
    @IBOutlet open weak var singleProductImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - Assigning data to Labels
        DispatchQueue.main.async {
            self.productName.text = self.ProductCellData.name
            self.productProce.text = String(self.ProductCellData.price)
            self.productDescription.text = self.ProductCellData.productDescription
            self.singleProductImage.image = self.CellImage
        }
    }
    
    /// This button dismiss the current ViewController
    /// - Parameter sender: cancelButton
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

