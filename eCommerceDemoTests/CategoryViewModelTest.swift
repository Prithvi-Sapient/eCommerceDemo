//
//  CategoryViewModelTest.swift
//  eCommerceDemoTests
//
//  Created by Prithviraj Patil on 29/07/19.
//  Copyright © 2019 Prithviraj Patil. All rights reserved.
//

import XCTest

class CategoryViewModelTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchData() {
        guard let path = Bundle.main.path(forResource: "document", ofType: "json") else { fatalError() }
        XCTAssertNotNil(path)
        do {
            if let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedRead) {
            print(data)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode([ProductsCategory].self, from: data)
            XCTAssertNotNil(jsonData, "Should not be nil")
            XCTAssertGreaterThan(jsonData.count, 0, "Should have data")
            } else {
                XCTFail()
            }
        } catch {
            XCTAssertNil(error, "Error should be nil")
        }
    }

}
