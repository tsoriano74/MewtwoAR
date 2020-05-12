//
//  VRViewController.swift
//  MewtwoAR
//
//  Created by Naomi Baudoin on 10.05.20.
//  Copyright © 2020 Abrège. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

protocol vrDelegate {
    func vrRetour()
}
class VRViewController: UIViewController, ARSCNViewDelegate, SCNPhysicsContactDelegate {
    

    @IBOutlet var retourOutlet: UIButton!
    @IBOutlet var scene1: ARSCNView!
    @IBOutlet var scene2: ARSCNView!
    
    
    var delegate:vrDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the view's delegate
        scene1.delegate = self
        scene1.scene.physicsWorld.contactDelegate = self
        scene2.delegate = self
        
        
        // Show statistics such as fps and timing information
        
        scene1.scene = scene2.scene
        
        scene1.autoenablesDefaultLighting = true
        scene2.autoenablesDefaultLighting = true
        scene1.showsStatistics = false
        scene2.showsStatistics = false
        scene2.isPlaying = true
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        if let imageToTrack = ARReferenceImage.referenceImages(inGroupNamed: "Cartes Pokemon", bundle: Bundle.main){
            configuration.detectionImages = imageToTrack
            configuration.maximumNumberOfTrackedImages = 2
            print("Les cartes sont bien ajoutées")
        }
        
        
        
        // Run the view's session
        scene1.session.run(configuration)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        scene1.session.pause()
    }
    
    // MARK: - ARSCNViewDelegate
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
        
        if let imageAnchor = anchor as? ARImageAnchor {
            
            let plane = SCNPlane(width:  imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
            
            plane.firstMaterial?.diffuse.contents = UIColor(white: 1.0, alpha: 0.8)
            let planeNode = SCNNode(geometry: plane)
            
            planeNode.eulerAngles.x = -.pi / 2
            
            node.addChildNode(planeNode)
//
            if imageAnchor.referenceImage.name == "Mewtwo"{
                if let pokeScene = SCNScene(named: "art.scnassets/Mewtwo/Mewtwo.scn"){

                    if let pokeNode = pokeScene.rootNode.childNodes.first{
                        pokeNode.eulerAngles.x = .pi / 2
                        planeNode.addChildNode(pokeNode)
                    }
                }
            }
            
            
        }
        return node
    }
    
    func physicsWorld(_ world: SCNPhysicsWorld, didBegin contact: SCNPhysicsContact) {
        print("CONACT")
        
    }
    
    
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        DispatchQueue.main.async {
            self.updateFrame()
        }
    }
    
    func updateFrame() {
        
        // Clone pointOfView for Second View
        let pointOfView : SCNNode = (scene1.pointOfView?.clone())!
        
        // Add calculations for right-eye position ...
        // Determine Adjusted Position for Right Eye
        let orientation : SCNQuaternion = pointOfView.orientation
        let orientationQuaternion : GLKQuaternion = GLKQuaternionMake(orientation.x, orientation.y, orientation.z, orientation.w)
        let eyePos : GLKVector3 = GLKVector3Make(1.0, 0.0, 0.0)
        let rotatedEyePos : GLKVector3 = GLKQuaternionRotateVector3(orientationQuaternion, eyePos)
        let rotatedEyePosSCNV : SCNVector3 = SCNVector3Make(rotatedEyePos.x, rotatedEyePos.y, rotatedEyePos.z)
        
        let mag : Float = 0.000// This is the value for the distance between two pupils (in metres). The Interpupilary Distance (IPD).
        pointOfView.position.x += rotatedEyePosSCNV.x * mag
        pointOfView.position.y += rotatedEyePosSCNV.y * mag
        pointOfView.position.z += rotatedEyePosSCNV.z * mag
        scene2.pointOfView = pointOfView
        
    }
    
    @IBAction func retour(_ sender: UIButton) {
        delegate?.vrRetour()
        dismiss(animated: true, completion: nil)
    }
}
