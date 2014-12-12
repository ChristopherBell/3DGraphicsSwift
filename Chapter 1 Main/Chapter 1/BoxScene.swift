//
//  BoxScene.swift
//  Chapter 1
//
//  Created by Christopher on 12/12/2014.
//  Copyright (c) 2014 Christopher Bell. All rights reserved.
//

import UIKit
import SceneKit

class BoxScene: SCNScene {
    
    override init() {
        super.init()
        
        let boxSide: CGFloat = 10.0
        let box = SCNBox(width: boxSide, height: boxSide, length: boxSide, chamferRadius: 0.0)
        
        let boxNode = SCNNode(geometry: box)
        
        self.rootNode.addChildNode(boxNode)
        
        boxNode.rotation = SCNVector4Make(0, 1, 0, Float(M_PI) / 5.0)
        
        // Camera
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3Make(0, 10, 20)
        cameraNode.rotation = SCNVector4Make(1, 0, 0, -atan2(10.0, 20.0))
        
        self.rootNode.addChildNode(cameraNode)
        
        // Light blue directional light
        let lightBlueColor = UIColor(red: 4.0/255.0, green: 120.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        
        let light = SCNLight()
        light.type = SCNLightTypeDirectional
        light.color = lightBlueColor
        
        let lightNode = SCNNode()
        lightNode.light = light
        
        cameraNode.addChildNode(lightNode)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
