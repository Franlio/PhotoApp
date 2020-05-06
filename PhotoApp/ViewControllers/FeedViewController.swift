//
//  FeedViewController.swift
//  PhotoApp
//
//  Created by 廖翊淳 on 2020/4/22.
//  Copyright © 2020 Yi-Chun Liao. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var photos = [Photo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Configure the tableview
        tableView.dataSource = self
        tableView.delegate = self
        
        // Create and add the refresh control
        addRefreshControl()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Retrieve and display the photos
        PhotoService.getPhoto { (photos) in
            
            self.photos = photos
            self.tableView.reloadData()
            
        }
        
    }
    
    func addRefreshControl() {
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshInitiated(refreshControl:)), for: .valueChanged)
        
        tableView.addSubview(refreshControl)
        
    }
    
    @objc func refreshInitiated(refreshControl:UIRefreshControl) {
        
        // Call the photo service retrieve photos
        PhotoService.getPhoto { (photos) in
            
            self.photos = photos
            self.tableView.reloadData()
            refreshControl.endRefreshing()
            
        }
        
    }
    
}

extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        photos.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Get a photo cell
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Storyboard.feedPhotoTableCellId, for: indexPath) as! PhotoCell
        
        // Get the photo for this row
        let photo = photos[indexPath.row]
        
        // Set the details for the cell
        cell.setPhoto(photo)
        
        return cell
        
    }
}
