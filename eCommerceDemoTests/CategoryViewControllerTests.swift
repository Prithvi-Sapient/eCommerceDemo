//
//  CategoryViewControllerTests.swift
//  eCommerceDemoTests
//
//  Created by Prithviraj Patil on 29/07/19.
//  Copyright © 2019 Prithviraj Patil. All rights reserved.
//

import XCTest
@testable import eCommerceDemo

class CategoryViewControllerTests: XCTestCase {

    var viewController: CategoryViewController!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewController = CategoryViewController()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCategoryData() {
        let dataService = CategoryViewModel()
        dataService.fetchProducts(completion: { (productData) in
            XCTAssertNotNil(productData, "Items should not be nil")
            XCTAssert(productData.count > 0, "Products data should not be empty")
        })
    }
}
