//
//  Constants.swift
//  eCommerceDemo
//
//  Created by Prithviraj Patil on 24/07/19.
//  Copyright © 2019 Prithviraj Patil. All rights reserved.
//

import Foundation
import UIKit

// Global peoperties
let userDefault = UserDefaults.standard
var isLoggedIn: Bool? = false

// Data Service Instance
let dataService = NetworkServices()

//CollectionView Custom properties
public var collectionViewRowEstimatedWidth: CGFloat = 160.0
public var collectionCellMarginSize = 0
public let padding = 2
