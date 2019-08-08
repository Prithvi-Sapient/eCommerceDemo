//
//  NetworkServices.swift
//  eCommerceDemo
//
//  Created by Prithviraj Patil on 05/07/19.
//  Copyright © 2019 Prithviraj Patil. All rights reserved.
//

import Foundation

public class NetworkServices {
    func LoginDetails(completion: @escaping ([LoginModel]) -> Void) {
        guard let loginPath = Bundle.main.path(forResource: "loginData", ofType: "json") else { return }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: loginPath), options: .mappedRead)
            let decoder = JSONDecoder()
            let loginData = try decoder.decode([LoginModel].self, from: data)
           completion(loginData)
        } catch {
            print(error)
        }
    }
}

