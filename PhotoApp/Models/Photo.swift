//
//  Photo.swift
//  PhotoApp
//
//  Created by 廖翊淳 on 2020/4/27.
//  Copyright © 2020 Yi-Chun Liao. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct Photo {
    
    var photoId:String?
    var byId:String?
    var byUsername:String?
    var date:String?
    var url:String?
    
    init?(snapshot:DataSnapshot) {
        
        // Photo data
        let photoData = snapshot.value as? [String:String]
        
        if let photoData = photoData {
            
            let photoId = snapshot.key
            let byId = photoData["byId"]
            let byUsername = photoData["byUsername"]
            let date = photoData["date"]
            let url = photoData["url"]
            
            guard byId != nil && byUsername != nil && date != nil && url != nil else {
                
                return nil
                
            }
            
            self.photoId = photoId
            self.byId = byId
            self.byUsername = byUsername
            self.date = date
            self.url = url
            
        }
        
    }
    
}
