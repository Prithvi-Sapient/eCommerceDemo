//
//  ProductsViewController.swift
//  eCommerceDemo
//
//  Created by Prithviraj Patil on 05/07/19.
//  Copyright © 2019 Prithviraj Patil. All rights reserved.
//

import UIKit
// MARK : - This class shows the list of Products of Particular Category
class ProductsViewController: UIViewController {
    
    open var category: ProductsCategory!
    
    @IBOutlet weak private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // set custom row height for auto resiging the row
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableView.automaticDimension
        self.tabBarController?.tabBar.isHidden = false
    }
}
extension ProductsViewController: UITableViewDataSource, UITableViewDelegate {
    // MARK: - ProductsViewController TableView Delegate Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cells", for: indexPath) as? ProductsTableViewCell else { return UITableViewCell() }
        // custom cell selection style
        cell.selectionStyle = .none
        let product = category.products[indexPath.row]
        cell.productName.text = product.name
        cell.productDesc.text = product.productDescription
        cell.productPrice.text = String(product.price)
        cell.productImage.image = UIImage(named: product.imageURL)
        return cell
    }
    // MARK: - Delegate method get selected row data
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ProductDescription = category.products[indexPath.row]
        guard let ProductData = storyboard?.instantiateViewController(withIdentifier: "ProductDescription") as? ProductDescriptionViewController else { return }
        ProductData.ProductCellData = ProductDescription
        ProductData.CellImage = UIImage(named: ProductDescription.imageURL)!
        self.present(ProductData, animated: true, completion: nil)
        print("cell tapped")
    }
    // UITableViewAutomaticDimension calculates height of label contents/text
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
