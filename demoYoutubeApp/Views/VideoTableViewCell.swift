//
//  VideoTableViewCell.swift
//  demoYoutubeApp
//
//  Created by Hayden jin on 2020-07-19.
//  Copyright © 2020 Hayden jin. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    // empty variable for the video this cell will be displaying
    var video:Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // function that sets the cell
    func setCell(_ v:Video) {
        
        // set itself to the video
        self.video = v
        
        // Makes sure we have a video
        guard self.video != nil else {
            return
        }
        
        // setting the title text
        self.titleLabel.text = video?.title
        
        
        // setting the date text
        let df = DateFormatter()
        df.dateFormat = "EEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        // Set the thumbnail
        guard self.video!.thumbnail != "" else {
            return
        }
        
        // Check cache before downloading data
        if let cachedData = CacheManager.getVideoChache(self.video!.thumbnail) {
            
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
        }
        
        // download the thumbnail data
        let url = URL(string: self.video!.thumbnail)
        
        // Get the shared url session object
        let session = URLSession.shared
        
        // Create a data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
                
                // Save the data in the cache
                CacheManager.setVideoCache(url!.absoluteString, data)
                
                
                // Check that the downloaded url == cell that is being displayed
                if url!.absoluteString != self.video?.thumbnail {
                    return
                }
                // create the image object
                let image = UIImage(data: data!)
                
                // set the imageview
                DispatchQueue.main.async {
                    
                    self.thumbnailImageView.image = image
                }
            }
        }
        // Start data task
        dataTask.resume()
    }
}
