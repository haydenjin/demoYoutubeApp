//
//  ViewController.swift
//  demoYoutubeApp
//
//  Created by Hayden jin on 2020-07-09.
//  Copyright © 2020 Hayden jin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getVideos()
    }


}
