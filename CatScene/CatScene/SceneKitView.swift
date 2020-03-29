//
//  SceneKitView.swift
//  CatScene
//
//  Created by Ezra Bathini on 29/03/20.
//  Copyright © 2020 Ezra Bathini. All rights reserved.
//

import SwiftUI
import SceneKit

struct SceneKitView: UIViewRepresentable {

    let scene = SCNScene(named: "cat.scn")!
    
    func makeUIView(context: Context) -> SCNView {
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        scene.rootNode.addChildNode(cameraNode)

        
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 15)

        
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = .omni
        lightNode.light!.color = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1.0)
        lightNode.position = SCNVector3(x: 0, y: 50, z: 50)
        scene.rootNode.addChildNode(lightNode)

        
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = .ambient
        ambientLightNode.light!.color = UIColor.darkGray
        scene.rootNode.addChildNode(ambientLightNode)

        
        let scnView = SCNView()
        return scnView
    }
    
    func updateUIView(_ scnView: SCNView, context: Context) {
        scnView.scene = scene

        scnView.allowsCameraControl = true
       
        scnView.showsStatistics = false

        scnView.backgroundColor = UIColor.white

    }
}

struct SceneKitView_Previews: PreviewProvider {
    static var previews: some View {
        SceneKitView()
    }
}
