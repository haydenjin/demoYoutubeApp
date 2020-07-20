//
//  Response.swift
//  demoYoutubeApp
//
//  Created by Hayden jin on 2020-07-17.
//  Copyright © 2020 Hayden jin. All rights reserved.
//

import Foundation


struct Response: Decodable {
    
    // Creating an array of empty video objects
    var items: [Video]?
    
    enum CodingKeys: String, CodingKey {
        
        case items
    }
    
    init (from decoder: Decoder) throws {
        
        // Getting the whole JSON file in order to access the items array later on
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try container.decode([Video].self, forKey: .items)
        
        
    }
}
