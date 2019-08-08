//
//  loginViewControllerTest.swift
//  eCommerceDemoTests
//
//  Created by Prithviraj Patil on 29/07/19.
//  Copyright © 2019 Prithviraj Patil. All rights reserved.
//

import XCTest
@testable import eCommerceDemo

class loginViewControllerTest: XCTestCase {

    var viewController: LoginViewController!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewController = LoginViewController()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLoginDetails() {
        let dataService = NetworkServices()
        dataService.LoginDetails { (loginApiData) in
            XCTAssertNotNil(loginApiData, "Items should not be nil")
            XCTAssert(loginApiData.count > 0, "Products data should not be empty")
        }
    }
}
