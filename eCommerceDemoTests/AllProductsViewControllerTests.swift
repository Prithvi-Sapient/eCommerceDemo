//
//  AllProductsViewControllerTests.swift
//  eCommerceDemoTests
//
//  Created by Prithviraj Patil on 29/07/19.
//  Copyright © 2019 Prithviraj Patil. All rights reserved.
//

import XCTest
@testable import eCommerceDemo

class AllProductsViewControllerTests: XCTestCase {

    var viewControllers: AllProductsViewController!
    var allProducts = [Product]()
    var filteredProducts: [Product]?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewControllers = AllProductsViewController()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchAllProducts() {
        let dataService = CategoryViewModel()
        dataService.fetchProducts { (recievedProducts) in
            for allItem in recievedProducts {
                for products in allItem.products {
                    self.allProducts.append(products)
                    self.filteredProducts = self.allProducts.filter { $0.authRequired == true }
                    XCTAssertNotNil(self.filteredProducts, "Items should not be nil")
                    XCTAssert(self.filteredProducts!.count > 0, "Products data should not be empty")
                }
            }
        }
    }
}
