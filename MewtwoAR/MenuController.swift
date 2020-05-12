//
//  MenuController.swift
//  MewtwoAR
//
//  Created by Naomi Baudoin on 10.05.20.
//  Copyright © 2020 Abrège. All rights reserved.
//

import UIKit

class MenuController: UIViewController, arDelegate, vrDelegate {
    
    
    
    
    // MARK: - Properties
    
    
    // MARK: - IBOutlets
    @IBOutlet var ARModeOutlet: UIButton!
    @IBOutlet var VRModeOutlet: UIButton!

    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //Styling
        ARModeOutlet.layer.cornerRadius = 20
        VRModeOutlet.layer.cornerRadius = 20
       
        
    }
    
    // MARK: - Set Up
    
    
    // MARK: - IBActions
    @IBAction func ARMode(_ sender: UIButton) {
        performSegue(withIdentifier: "toAR", sender: self)
        
    }
    
    @IBAction func VRMode(_ sender: UIButton) {
        performSegue(withIdentifier: "toVR", sender: self)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if segue.identifier == "toAR" {
                    let destinationVC = segue.destination as! ARViewController
                    destinationVC.delegate = self
                }
        
    }
    
    
    // MARK: - Network Manager calls
    
    
    // MARK: - Extensions
    func arRetour() {
       
    }
    
    func vrRetour() {
        //
    }
    
    
    
}
