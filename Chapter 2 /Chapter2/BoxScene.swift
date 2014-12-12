//
//  BoxScene.swift
//  Chapter2
//
//  Created by Christopher on 12/12/2014.
//  Copyright (c) 2014 Christopher Bell. All rights reserved.
//

import UIKit
import SceneKit

class BoxScene: SCNScene {
    
    let useOmniLight: Bool = false
    let useSpotLight: Bool = true
    let useAmbientLight: Bool = true
    let useTwoBoxes: Bool = false
    let useMultipleMaterials: Bool = true
    
    override init() {
        super.init()
        
        // Square box
        let boxSide: CGFloat = 10.0
        let box = SCNBox(width: boxSide, height: boxSide, length: boxSide, chamferRadius: 0.0)
        
        let boxNode = SCNNode(geometry: box)
        
        self.rootNode.addChildNode(boxNode)
        
        boxNode.rotation = SCNVector4Make(0, 1, 0, Float(M_PI) / 5.0)
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3Make(0, 10, 20)
        cameraNode.rotation = SCNVector4Make(1, 0, 0, -sin(10.0/20.0))
        
        self.rootNode.addChildNode(cameraNode)
        
        // Light blue light
        let lightBlueColor = UIColor(red: 4.0/255.0, green: 120.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        
        // Blue box with white lights
        box.firstMaterial?.diffuse.contents = lightBlueColor
        box.firstMaterial?.locksAmbientWithDiffuse = true
        
        let lightColor = UIColor.whiteColor()
        
        // Omni light
        if (useOmniLight) {
            
            let omniLight = SCNLight()
            omniLight.type = SCNLightTypeOmni
            omniLight.color = lightColor
            
            omniLight.attenuationStartDistance = 15
            omniLight.attenuationEndDistance = 20
            
            let omniLightNode = SCNNode()
            omniLightNode.light = omniLight
            
            cameraNode.addChildNode(omniLightNode)
        }
        
        // Spot light
        if (useSpotLight) {
            
            let spotLight = SCNLight()
            spotLight.type = SCNLightTypeSpot
            spotLight.color = lightColor
            
            spotLight.spotInnerAngle = 25
            spotLight.spotOuterAngle = 30
            
            let spotLightNode = SCNNode()
            spotLightNode.light = spotLight
            
            cameraNode.addChildNode(spotLightNode)
        }
        
        // Ambient light
        if (useAmbientLight) {
            
            let ambientLight = SCNLight()
            ambientLight.type = SCNLightTypeAmbient
            
            ambientLight.color = UIColor(white: 0.25, alpha: 1.0)
            
            let ambientLightNode = SCNNode()
            ambientLightNode.light = ambientLight
            
            self.rootNode.addChildNode(ambientLightNode)
        }
        
        // Multiple materials
        if (useMultipleMaterials) {
            
            let greenMaterial = SCNMaterial()
            greenMaterial.diffuse.contents = UIColor.greenColor()
            greenMaterial.locksAmbientWithDiffuse = true
            
            let redMaterial = SCNMaterial()
            redMaterial.diffuse.contents = UIColor.redColor()
            redMaterial.locksAmbientWithDiffuse = true
            
            let blueMaterial = SCNMaterial()
            blueMaterial.diffuse.contents = UIColor.blueColor()
            blueMaterial.locksAmbientWithDiffuse = true
            
            let yellowMaterial = SCNMaterial()
            yellowMaterial.diffuse.contents = UIColor.yellowColor()
            yellowMaterial.locksAmbientWithDiffuse = true
            
            let purpleMaterial = SCNMaterial()
            purpleMaterial.diffuse.contents = UIColor.purpleColor()
            purpleMaterial.locksAmbientWithDiffuse = true
            
            let magentaMaterial = SCNMaterial()
            magentaMaterial.diffuse.contents = UIColor.magentaColor()
            magentaMaterial.locksAmbientWithDiffuse = true
            
            box.materials = [greenMaterial, redMaterial, blueMaterial, yellowMaterial, purpleMaterial, magentaMaterial]
        }
        
        // Two boxes
        if (useTwoBoxes) {
            
            cameraNode.position = SCNVector3Make(0, 0, 20)
            
            let noRotation = SCNVector4Make(1, 0, 0, 0)
            
            cameraNode.rotation = noRotation
            boxNode.rotation = noRotation
            
            let anotherBox = SCNBox(width: boxSide, height: boxSide, length: boxSide, chamferRadius: 0.0)
            
            anotherBox.firstMaterial?.diffuse.contents = lightBlueColor
            anotherBox.firstMaterial?.locksAmbientWithDiffuse = true
            anotherBox.firstMaterial?.specular.contents = UIColor.whiteColor()
            
            let anotherBoxNode = SCNNode(geometry: anotherBox)
            
            self.rootNode.addChildNode(anotherBoxNode)
            
            let boxMargin: CGFloat = 1.0
            let boxPositionX = (boxSide + boxMargin) / 2.0
            boxNode.position = SCNVector3Make(Float(boxPositionX), 0, 0)
            anotherBoxNode.position = SCNVector3Make(Float(-boxPositionX), 0, 0)
        }
    }
    
    

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
}
