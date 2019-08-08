//
//  LoginViewController.swift
//  eCommerceDemo
//
//  Created by Prithviraj Patil on 19/07/19.
//  Copyright © 2019 Prithviraj Patil. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet private weak var stackView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet private weak var cancelButton: UIButton!
    
    private let dataService = NetworkServices()
    private var loginDetail: [LoginModel]?
    var tabBar = DashboardTabBarController()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        emailTextField.setBottomBorder()
        /// Login Data service call
        loginData()
    }
    
    func loginData() {
        let dataService = NetworkServices()
        dataService.LoginDetails { (loginApiData) in
            self.loginDetail = loginApiData
        }
    }
    
    @IBAction func cancelButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /// This is login Button
    /// Login button validates the textFields weather the entered details are valid ot not
    /// - Parameter sender: LoginButtonClicked
    @IBAction func loginButtonClicked(_ sender: Any) {
        //If Textfields empty show alert
        if emailTextField.text!.isEmpty || passwordTextField.text!.isEmpty {
            let alert = UIAlertController(title: "Alert!!", message: "Please enter the Details.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            if (emailTextField.text?.isValidEmailAddress())! {
                for items in loginDetail! {
                    if emailTextField.text == items.username , (emailTextField.text?.isValidEmailAddress())! && passwordTextField.text == items.password {
                        // If login success change set to true
                        isLoggedIn = true
                        // Save Logged In state in user Defaults
                        userDefault.set(true, forKey: "isLoggedIn")
                        //self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
                        let alert = UIAlertController(title: "Congratulations", message: "Login Successful", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction!) in
                            self.dismiss(animated: true, completion: nil)
                        }))
                        self.present(alert, animated: true, completion: nil)
                    }
                }
            } else {
                let alert = UIAlertController(title: "Alert!!", message: "Invalid email Id.", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Re-enter", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            /// Login Failed show alert message
            let alert = UIAlertController(title: "Alert!!", message: "Invalid Details.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

