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
        
        // Create default Auth UI
        let authUI = FUIAuth.defaultAuthUI()
        
        // Check that it isn't nil
        guard authUI != nil else {
            
            return
            
        }
        
        // Set delegate and specify sign in options
        authUI?.delegate = self
        authUI?.providers = [FUIEmailAuth()]
        
        // Get the auth view controller and present it
        let authViewController = authUI!.authViewController()
        present(authViewController, animated: true, completion: nil)
        
    }
}

extension LoginViewController: FUIAuthDelegate {
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        
        // Check if an error occurred
        guard error == nil else {
            
            print("An error has happened")
            return
            
        }
        
        // Get the user
        let user = authDataResult?.user
        
        // Check if user is nil
        if let user = user {
            
            // This means that we have a user, now check if they have a profile
            UserService.getUserProfile(userId: user.uid) { (u) in
                
                if u == nil {
                    
                    // No profile, go to profile controller
                    self.performSegue(withIdentifier: Constants.Segue.profileViewController, sender: self)
                    
                }
                else {
                    
                    // Save the logged in user to local storage
                    LocalStorageService.saveCurrentUser(user: u!)
                    
                    // This user has a profile, go to tab controller
                    let tabBarVC = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.tabBarController)
                    
                    self.view.window?.rootViewController = tabBarVC
                    self.view.window?.makeKeyAndVisible()
                    
                }
                
            }
            
        }
        
    }
    
}
