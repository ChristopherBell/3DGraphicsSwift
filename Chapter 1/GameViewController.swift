//
//  GameViewController.swift
//  Chapter 1
//
//  Created by Christopher on 12/12/2014.
//  Copyright (c) 2014 Christopher Bell. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scnView = self.view as SCNView
        let scene = BoxScene()
        scnView.scene = scene
        
        scnView.backgroundColor = UIColor.whiteColor()
        
        scnView.allowsCameraControl = true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

}
