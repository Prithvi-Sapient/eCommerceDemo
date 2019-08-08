//
//  Extensions.swift
//  eCommerceDemo
//
//  Created by Prithviraj Patil on 25/07/19.
//  Copyright © 2019 Prithviraj Patil. All rights reserved.
//

import Foundation
import UIKit

// Checks if the `String` is a valid email address.
extension String {
   public func isValidEmailAddress() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES[c] %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}
// MARK: - Custom UITextField method when set the single line textField
extension UITextField {
    public func setBottomBorder() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}
