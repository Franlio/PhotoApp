//
//  LoginViewController.swift
//  PhotoApp
//
//  Created by 廖翊淳 on 2020/4/22.
//  Copyright © 2020 Yi-Chun Liao. All rights reserved.
//

import UIKit
import FirebaseUI

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        
        // Create a firebase auth UI object
        let authUI = FUIAuth.defaultAuthUI()
        
        // Check that isn't  nil
        if let authUI = authUI {
            
            // Create a firebase auth pre build UI View Controller
            let authViewController = authUI.authViewController()
            // Set the login view controller as the delegate
            authUI.delegate = self
            
            // Present it
            present(authViewController, animated: true, completion: nil)
            
        }
    }
}

extension LoginViewController: FUIAuthDelegate {
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        
        let user = authDataResult?.user
        
    }
    
}
