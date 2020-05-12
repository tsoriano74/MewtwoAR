//
//  VRViewController.swift
//  MewtwoAR
//
//  Created by Naomi Baudoin on 10.05.20.
//  Copyright © 2020 Abrège. All rights reserved.
//

import UIKit

class VRViewController: UIViewController {
    
    var mewtwoAnchor:Experience.Mewtwo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mewtwoAnchor = try! Experience.loadMewtwo()
        arView.scene.anchors.append(mewtwoAnchor)
    }
    
}
