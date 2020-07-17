//
//  Model.swift
//  demoYoutubeApp
//
//  Created by Hayden jin on 2020-07-11.
//  Copyright © 2020 Hayden jin. All rights reserved.
//

import Foundation


class Model {
    
    func getVideos() {
        
        // Create a url object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        // Get a URLSession object
        let session = URLSession.shared
        
        // Get a data task from the URLSession object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // Check if there were any errors
            if error != nil || data == nil {
                return
            }
            
            // Parsing the data into video objects 
        }
        // kick off the task
    }
}
