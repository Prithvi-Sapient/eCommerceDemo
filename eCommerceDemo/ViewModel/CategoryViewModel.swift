//
//  CategoryViewModel.swift
//  eCommerceDemo
//
//  Created by Prithviraj Patil on 24/07/19.
//  Copyright © 2019 Prithviraj Patil. All rights reserved.
//

import Foundation
import UIKit

class CategoryViewModel {
    func fetchProducts(completion: @escaping ([ProductsCategory]) -> Void) {
        guard let path = Bundle.main.path(forResource: "document", ofType: "json") else { fatalError() }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedRead)
            print(data)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode([ProductsCategory].self, from: data)
            completion(jsonData)
        } catch {
            print("error:\(error)")
            print("error")
        }
    }
}
