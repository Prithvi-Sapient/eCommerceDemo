//
//  Products.swift
//  eCommerceDemo
//
//  Created by Prithviraj Patil on 04/07/19.
//  Copyright © 2019 Prithviraj Patil. All rights reserved.
//

import Foundation

struct ProductsCategory: Codable {
    let id: Int
    let name: String
    let imageURL: String
    let authRequired: Bool
    let products: [Product]
}

// MARK: - Product
struct Product: Codable {
    let id: Int
    let authRequired: Bool
    let name, imageURL: String
    let price: Double
    let productDescription: String
    
    enum CodingKeys: String, CodingKey {
        case id, authRequired, name, imageURL, price
        case productDescription = "description"
    }
}
