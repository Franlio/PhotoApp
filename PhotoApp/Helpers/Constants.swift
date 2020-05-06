//
//  Constants.swift
//  PhotoApp
//
//  Created by 廖翊淳 on 2020/4/24.
//  Copyright © 2020 Yi-Chun Liao. All rights reserved.
//

import Foundation

struct Constants {
    
    struct Storyboard {
        
        static let tabBarController = "MainTabBarController"
        static let loginNavController = "LoginNavController"
        static let feedPhotoTableCellId = "PhotoCell"
        
    }
    
    struct Segue {
        
        static let profileViewController = "goToCreateProfile"
        
    }
    
    struct LocalStorage {
        
        static let storedUsername = "storedUsername"
        static let storedUserId = "storedUserId"
        
    }
    
}
