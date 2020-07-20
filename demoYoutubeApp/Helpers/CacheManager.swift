//
//  CacheManager.swift
//  demoYoutubeApp
//
//  Created by Hayden jin on 2020-07-19.
//  Copyright © 2020 Hayden jin. All rights reserved.
//

import Foundation


class CacheManager {
    
    static var cache = [String:Data]()
    
    
    static func setVideoCache(_ url:String, _ data:Data?) {
        
        // Store the image data and use url as the key
        cache[url] = data
    }
    
    static func getVideoChache(_ url:String) -> Data? {
        
        // Try to get the data for the url
        return cache[url]
    }
}
