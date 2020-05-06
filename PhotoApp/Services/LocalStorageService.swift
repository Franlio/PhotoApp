//
//  LocalStorageService.swift
//  PhotoApp
//
//  Created by 廖翊淳 on 2020/4/24.
//  Copyright © 2020 Yi-Chun Liao. All rights reserved.
//

import Foundation

class LocalStorageService {
    
    static func saveCurrentUser(user:PhotoUser) {
        
        // Get standard user default
        let defaults = UserDefaults.standard
        
        defaults.set(user.userId, forKey: Constants.LocalStorage.storedUserId)
        defaults.set(user.username, forKey: Constants.LocalStorage.storedUsername)
        
    }
    
    static func loadCurrentUser() -> PhotoUser? {
        
        // Get standard user defaults
        let defaults = UserDefaults.standard
        
        let username = defaults.value(forKey: Constants.LocalStorage.storedUsername) as? String
        let userId = defaults.value(forKey: Constants.LocalStorage.storedUserId) as? String
        
        // Couldn't get a user, return nil
        guard username != nil || userId != nil else {
            
            return nil
            
        }
        
        // Rerurn the user
        let u = PhotoUser(username: username!, userId: userId!)
        return u
        
    }
    
    static func clearCurrentUser() {
        
        // Get standard user defaults
        let defaults = UserDefaults.standard
        
        defaults.set(nil, forKey: Constants.LocalStorage.storedUserId)
        defaults.set(nil, forKey: Constants.LocalStorage.storedUsername)
        
    }
    
}
