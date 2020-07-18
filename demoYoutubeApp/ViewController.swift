//
//  ViewController.swift
//  demoYoutubeApp
//
//  Created by Hayden jin on 2020-07-09.
//  Copyright © 2020 Hayden jin. All rights reserved.
//

import UIKit


// Added "UITableViewDataSource" which means that the ViewController conforms or follows the protocal of the table view
// this is required for displaying the data to the screen
// We also did the same for the "UITableViewDelegate"
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var model = Model()
    
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Assigns the ViewController which is "self" to the datasource for the tableview
        tableView.dataSource = self
        
        // Assigns the ViewController which is "self" to the delegate for the tableview
        tableView.delegate = self
        
        // Assigns the ViewController which is "self" to the delegate for the model
        model.delegate = self
        
        model.getVideos()
    }
    // MARK: - Model Delegate Methods
    
    func videosFetched(_ videos: [Video]) {
        
        // Set the returned videos to our video property
        self.videos = videos
        
        // Refresh the tableView
        tableView.reloadData()
    }
    
    
    // MARK: - TableView Methods
    
    // Asks how many rows to display
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    // Calls this function for every row that needs to be displayed
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Creating a cell to be displayed
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELLID, for: indexPath)
        
        // Configure the cell with the data
        let title = self.videos[indexPath.row].title
        
        cell.textLabel?.text = title
        
        // Return the cell
        return cell
    }
    
    // Function for when user taps on a row (What happens now)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }

}
