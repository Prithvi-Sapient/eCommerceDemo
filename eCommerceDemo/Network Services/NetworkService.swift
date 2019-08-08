//
//  NetworkService.swift
//  eCommerceDemo
//
//  Created by Prithviraj Patil on 05/07/19.
//  Copyright © 2019 Prithviraj Patil. All rights reserved.
//

import Foundation

class NetworkService {
    
    func loadJson(completion: @escaping ([Products]) -> Void) {
   
        guard let path = Bundle.main.path(forResource: "document", ofType: "json") else { return }
        
        let url = URL(fileURLWithPath: path)
        
        do {
            let data1 = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(Products.self, from: data1)
            //   print(jsonData)
            
            for item in jsonData.category {
              let cat = Category(id: item.id, name: item.name, imageURL: item.imageURL, products: item.products)

                for i in item.products {
                  let pro = Product(id: i.id, name: i.name, imageURL: i.imageURL, price: i.price, productDescription: i.productDescription)

                }
            }
            
            completion(complete)
            
        } catch {
            print("error:\(error)")
        }
        
    }
}
