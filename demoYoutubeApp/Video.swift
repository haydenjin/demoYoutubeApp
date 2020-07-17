//
//  Video.swift
//  demoYoutubeApp
//
//  Created by Hayden jin on 2020-07-11.
//  Copyright © 2020 Hayden jin. All rights reserved.
//

import Foundation

// Decodable means it conforms to the Decodable class
struct Video : Decodable {
    
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    
    // Coding key means it conforms to the coding key class so you are able to use it in later steps
    enum CodingKeys: String, CodingKey {
        
        // If the variable name matches the name in the JSON file, you do not need to have the = "", if they dont match, then you
        //  need to = the variable to the name in the JSON file
        
        case snippet
        case thumbnails
        case high
        case resourceId
        
        // For example, our variable is called "published" so we need to = it to "publishedAt" as it is different from our variable
        
        case published = "publishedAt"
        case title
        case description
        case thumbnail = "url"
        case videoId
    }
    
    // initalizing function to translate from FSON to our own variables
    init (from decoder:Decoder) throws {
        
        // Gets one whole item from the JSON file
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Gets the snippet object from the container object
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        // Getting data that is in this object
        
        // equaling the title variable to the value in the JSON code
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        
        self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
        
    }
}
