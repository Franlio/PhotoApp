//
//  CameraViewController.swift
//  PhotoApp
//
//  Created by 廖翊淳 on 2020/4/22.
//  Copyright © 2020 Yi-Chun Liao. All rights reserved.
//

import UIKit
import UICircularProgressRing

class CameraViewController: UIViewController {
    
    @IBOutlet weak var progressRing: UICircularProgressRing!
    
    @IBOutlet weak var doneLable: UILabel!
    
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Hide and configure the progress ring
        progressRing.alpha = 0
        progressRing.value = 0
        progressRing.maxValue = 100
        progressRing.innerRingColor = .green
        
        // Hide the label and the button
        doneLable.alpha = 0
        doneButton.alpha = 0
        
    }
    
    func savePhoto(image:UIImage) {
        
        // percentage => pct
        PhotoService.savePhoto(image: image) { (pct) in
            
            // Update the progress ring
            self.progressRing.alpha = 1
            self.progressRing.startProgress(to: CGFloat(pct), duration: 1)
            
            if pct == 100 {
                
                self.doneButton.alpha = 1
                self.doneLable.alpha = 1
                
            }
            
        }
        
    }
    
    @IBAction func doneTapped(_ sender: UIButton) {
        
        // TODO: Go to photos tab
        let tabBarVC = self.tabBarController as? MainTabBarController
        
        if let tabBarVC = tabBarVC {
            
            // Call the goToFeed method
            tabBarVC.goToFeed()
            
        }
        
    }
    
}
