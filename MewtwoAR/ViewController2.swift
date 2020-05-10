//
//  ViewController2.swift
//  MewtwoAR
//
//  Created by Naomi Baudoin on 09.05.20.
//  Copyright © 2020 Abrège. All rights reserved.
//

import UIKit
import RealityKit
import ARKit

class ViewController2: UIViewController {
    
    @IBOutlet var arView: ARView!
    var boxAnchor:Experience.Box!
    var boxAnchor2:Experience.Box2!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        boxAnchor = try! Experience.loadBox()
        boxAnchor2 = try! Experience.loadBox2()
        
        boxAnchor.generateCollisionShapes(recursive: true)
        arView.scene.anchors.append(boxAnchor)
        arView.scene.anchors.append(boxAnchor2)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      
//        let configuration = ARWorldTrackingConfiguration()
//        configuration.maximumNumberOfTrackedImages = 2
//        configuration.environmentTexturing = .automatic
//        arView.session.run(configuration)
    }
    
    
    @IBAction func tap(_ sender: UIButton) {
        boxAnchor.notifications.start.post()
        boxAnchor2.notifications.start2.post()
    }
    

   
        
        
}
