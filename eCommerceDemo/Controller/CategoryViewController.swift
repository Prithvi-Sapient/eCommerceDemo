//
//  ViewController.swift
//  eCommerceDemo
//
//  Created by Prithviraj Patil on 04/07/19.
//  Copyright © 2019 Prithviraj Patil. All rights reserved.
//

import UIKit
// MARK: - This Class shows this list of Categories in CollectionView

class CategoryViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak private var tableBarItem: UIBarButtonItem!
    
    private var selectedCatagory: ProductsCategory?
    private var categories: [ProductsCategory]!
    private var filterdData: [ProductsCategory]!
    private var categoryModel = CategoryViewModel()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Show/Hide barButton Items based on user is logged in or nt
        collectionView.delegate = self
        collectionView.dataSource = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        isTabBarEnable()
        fetchData()
        self.collectionView.reloadData()
    }
    
    /// Enable or disable tabbar item
    private func isTabBarEnable() {
        if UserDefaults.standard.value(forKey: "isLoggedIn") != nil {
            tableBarItem.isEnabled = true
        } else {
            // Filter categories data to get items which are authRequired true
            tableBarItem.isEnabled = false
        }
    }

    /// Fetch Data from categoryModel and append to local array
    public func fetchData() {
        categoryModel.fetchProducts { (apiData)  in
            self.categories = apiData
            self.filterdData = self.categories.filter{ $0.authRequired == true }
        }
    }
    
    @IBAction func logoutButtonPressed(_ sender: Any) {
        // AlertViewController
        let alert = UIAlertController(title: "Alert!!", message: "Are you Sure You want to logout?", preferredStyle: UIAlertController.Style.alert)
        // Alert Action
        alert.addAction(UIAlertAction(title: "Logout", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction!) in
        // UserDefaults removes saved key
            UserDefaults.standard.removeObject(forKey: "isLoggedIn")
            self.navigationItem.rightBarButtonItem?.isEnabled = false
            self.collectionView.reloadData()
        }))
        // Alert Action
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension CategoryViewController : UICollectionViewDelegate, UICollectionViewDataSource {
        // MARK: - CollectionView Delegate Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Check if user defaults contains stored values or not
        if UserDefaults.standard.value(forKey: "isLoggedIn") != nil {
            return categories.count
        } else {
        // Filter categories data to get items which are authRequired true
            return filterdData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        if UserDefaults.standard.value(forKey: "isLoggedIn") != nil{
            cell.categoryName.text = categories[indexPath.row].name
            cell.categoryImage.image = UIImage(named: categories[indexPath.row].imageURL)
        } else {
            // Filter categories data to get items which are authRequired true
            cell.categoryName.text = filterdData[indexPath.row].name
            cell.categoryImage.image = UIImage(named: filterdData[indexPath.row].imageURL)
        }
        // Custom border color for cell
        cell.layer.borderColor = UIColor.lightGray.cgColor
        return cell
    }
    
    // MARK: - Delegate method to get selected cell data
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedCatagory = categories[indexPath.row]
        guard let productListingViewController = storyboard?.instantiateViewController(withIdentifier: "identifier") as? ProductsViewController else { return }
        productListingViewController.category = selectedCatagory
        self.navigationController?.pushViewController(productListingViewController, animated: true)
    }
}

// MARK: - CollectionView Flow layout delegate method
extension CategoryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = self.calculateCellSize()
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(collectionCellMarginSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(collectionCellMarginSize)
    }
    // Custom Function to set CollectionView cell size
    private func calculateCellSize() -> CGFloat {
        let cellCount = floor(CGFloat(self.view.frame.size.width / collectionViewRowEstimatedWidth))
        let margin = CGFloat(collectionCellMarginSize * padding)
        let width = (self.view.frame.size.width - CGFloat(collectionCellMarginSize) * (cellCount - 3) - margin) / cellCount
        return width
    }
}



