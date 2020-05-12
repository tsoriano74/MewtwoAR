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


protocol arDelegate {
    func arRetour()
}
class ARViewController: UIViewController, UIGestureRecognizerDelegate {
    
    
    // MARK: - Properties
    var delegate:arDelegate?
    var mewtwoAnchor:Experience.Mewtwo!
    var evoliAnchor:Experience.Evoli!
    var leviatorAnchor:Experience.Léviator!
    var taupiqueurAnchor:Experience.Taupiqueur!
    
    
    // MARK: - IBOutlets
    @IBOutlet var arView: ARView!
    @IBOutlet var AnimationOutlet: UIButton!
    @IBOutlet var retourOutlet: UIButton!
    
    
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //Styling
        AnimationOutlet.layer.cornerRadius = 20
        AnimationOutlet.isHidden = true
        
        //AR
        mewtwoAnchor = try! Experience.loadMewtwo()
        evoliAnchor = try! Experience.loadEvoli()
        leviatorAnchor = try! Experience.loadLéviator()
        taupiqueurAnchor = try! Experience.loadTaupiqueur()
//        le.generateCollisionShapes(recursive: true)
//        arView.scene.anchors.append(boxAnchor)
        arView.scene.anchors.append(mewtwoAnchor)
        arView.scene.anchors.append(evoliAnchor)
        arView.scene.anchors.append(leviatorAnchor)
        arView.scene.anchors.append(taupiqueurAnchor)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapped(gestureRecognizer:)))
        arView.addGestureRecognizer(tapRecognizer)
        tapRecognizer.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //        let configuration = ARWorldTrackingConfiguration()
        //        configuration.maximumNumberOfTrackedImages = 2
        //        configuration.environmentTexturing = .automatic
        //        arView.session.run(configuration)
    }
    
    // MARK: - Set Up
    @objc func tapped(gestureRecognizer: UITapGestureRecognizer) {
       mewtwoAnchor.notifications.start.post()
       evoliAnchor.notifications.start2.post()
    }
    
    // MARK: - IBActions
    @IBAction func tap(_ sender: UIButton) {
        mewtwoAnchor.notifications.start.post()
        evoliAnchor.notifications.start2.post()
    }
    @IBAction func retour(_ sender: UIButton) {
        delegate?.arRetour()
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Navigation
    
    
    // MARK: - Network Manager calls
    
    
    // MARK: - Extensions
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if touch.view!.superview!.superclass! .isSubclass(of: UIButton.self) {
            return false
        }
        return true
    }
    
}
