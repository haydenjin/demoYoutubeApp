//
//  Model.swift
//  demoYoutubeApp
//
//  Created by Hayden jin on 2020-07-11.
//  Copyright © 2020 Hayden jin. All rights reserved.
//

import Foundation

protocol ModelDelegate {
    func videosFetched(_ videos:[Video])
}

class Model {
    
    var delegate:ModelDelegate?
    
    
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
            
            do {
                // Parsing the data into video objects
                let decoder = JSONDecoder()
                
                // Tells the decoder what to do when it finds date objects
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                
                if response.items != nil {
                    
                    // Makes this run in the main thread
                    DispatchQueue.main.async {
                        // Call the videos returned method of the delegate
                        self.delegate?.videosFetched(response.items!)
                    }
                }
                // dump(response)
            }
            catch {
                
            }

        }
        // kick off the task
        dataTask.resume()
    }
}
