//
//  DashboardTabBarController.swift
//  eCommerceDemo
//
//  Created by Prithviraj Patil on 16/07/19.
//  Copyright © 2019 Prithviraj Patil. All rights reserved.
//

import UIKit

class DashboardTabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
   
    // MARK: - Delegate method to get selected item data
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let tabBarIndex = tabBarController.selectedIndex
        if tabBarIndex == 0 {
            let savedData = userDefault.bool(forKey: "isLoggedIn")
            if(savedData) {
                print("User is logged In")
            }else{
                print("user is not logged in")
            }
        } else if tabBarIndex == 1 {
            let savedData = userDefault.bool(forKey: "isLoggedIn")
            if(savedData){
            print("User is logged In")
            }else{
                print("user logged out")
            }
        } else if tabBarIndex == 2 {
            print("selected third")
            let savedData = userDefault.bool(forKey: "isLoggedIn")
            if(savedData){
                print("User is logged In screen 2")
            }else{
                print("user logged out 3rd screen")
            }
        }
    }
}

