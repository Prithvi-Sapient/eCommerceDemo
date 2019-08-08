//
//  AllProductsViewController.swift
//  eCommerceDemo
//
//  Created by Prithviraj Patil on 11/07/19.
//  Copyright © 2019 Prithviraj Patil. All rights reserved.
//

import UIKit
/// This class is used to show all the products from json Data
class AllProductsViewController: UIViewController {

    @IBOutlet weak var allProductsTableView: UITableView!

    private var allProducts = [Product]()
    private var filteredProducts: [Product]?
    public var allProductsModel = CategoryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiData()
        allProductsTableView.delegate = self
        allProductsTableView.dataSource = self
        customRowHeight()
    }
    
    /// set custom row height for auto resiging the row
    private func customRowHeight() {
        allProductsTableView.estimatedRowHeight = 100.0
        allProductsTableView.rowHeight = UITableView.automaticDimension
        allProductsTableView.reloadData()
    }
    
    private func apiData() {
        allProductsModel.fetchProducts { (recievedItems)  in
            for allItem in recievedItems {
                for products in allItem.products {
                    self.allProducts.append(products)
                    self.filteredProducts = self.allProducts.filter { $0.authRequired == true }
                }
            }
        }
    }
}

extension AllProductsViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: -  TableView Delegate methods
    /// TableView Delegate methods
    /// - Parameters:
    ///   - tableView: Tableview shows the list of products.
    ///   - section: number of rows in section returns the count depending on either user is logged in or not.
    /// - Returns: cell returns items which includes name, price, description and image.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if UserDefaults.standard.value(forKey: "isLoggedIn") != nil{
            return allProducts.count
        } else {
            // filter the allProducts array & returns items which authrequired true
            return filteredProducts!.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = allProductsTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? AllProductsTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        if UserDefaults.standard.value(forKey: "isLoggedIn") != nil{
            let Product = allProducts[indexPath.row]
            cell.productName.text = Product.name
            cell.productPrice.text = String(Product.price)
            cell.productDescription.text = Product.productDescription
            cell.productImage.image = UIImage(named: Product.imageURL)
        }else{
            // filter the allProducts array & add items to filteredProducts
            let filteredProductsArray = filteredProducts?[indexPath.row]
            cell.productName.text = filteredProductsArray?.name
            cell.productPrice.text = String(filteredProductsArray!.price)
            cell.productDescription.text = filteredProductsArray!.productDescription
            cell.productImage.image = UIImage(named: filteredProductsArray!.imageURL)
        }
        return cell
    }
    // MARK: - Delegate method for getting cell data
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedProductCell = allProducts[indexPath.row]
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ProductDescription") as? ProductDescriptionViewController else { return }
        vc.ProductCellData = selectedProductCell
        vc.CellImage = UIImage(named: selectedProductCell.imageURL)!
        self.present(vc, animated: true, completion: nil)
    }
}
