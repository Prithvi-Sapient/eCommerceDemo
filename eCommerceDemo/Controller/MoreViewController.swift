//
//  MoreViewController.swift
//  eCommerceDemo
//
//  Created by Prithviraj Patil on 19/07/19.
//  Copyright © 2019 Prithviraj Patil. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {
    
    @IBOutlet weak var loginLogoutButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        if UserDefaults.standard.value(forKey: "isLoggedIn") != nil {
            loginLogoutButton.isHidden = true
        }else{
            loginLogoutButton.isHidden = false
        }
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        let nextViewController = storyboard?.instantiateViewController(withIdentifier: "login") as! LoginViewController
            self.present(nextViewController, animated:true, completion:nil)
    }
}
