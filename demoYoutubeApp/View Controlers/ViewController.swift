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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Confirm that a video was selected
        guard tableView.indexPathForSelectedRow != nil else {
            return
        }
        
        // Get a reference to the video that was tapped on
        let selectedVideo = videos[tableView.indexPathForSelectedRow!.row]
        
        // Get a reference to the detail view contriller
        let detailVC = segue.destination as! DetailViewController
        
        // Set the video property of the detail view controller
        detailVC.video = selectedVideo
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELLID, for: indexPath) as! VideoTableViewCell
        
        // Configure the cell with the data
        let video = self.videos[indexPath.row]
        
        cell.setCell(video)
        
        // Return the cell
        return cell
    }
    
    // Function for when user taps on a row (What happens now)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }

}
