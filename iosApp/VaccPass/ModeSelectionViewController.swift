//
//  ModeSelectionViewController.swift
//  VaccPass
//
//  Created by Jonathan Ho on 2021-01-23.
//  Copyright © 2021 Jonathan Ho. All rights reserved.
//

import UIKit
import AVFoundation

class ModeSelectionViewController: UIViewController {
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var authenticate: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        registerButton.layer.cornerRadius = 10;
        authenticate.layer.cornerRadius = 10;
        switch AVCaptureDevice.authorizationStatus(for: .video) {
            case .authorized: // The user has previously granted access to the camera.
                print("ask for permission")
            
            case .notDetermined: // The user has not yet been asked for camera access.
                AVCaptureDevice.requestAccess(for: .video) { granted in
                
                print("access grander")}
            
            case .denied: // The user has previously denied access.
                return

            case .restricted: // The user can't grant access due to restrictions.
                return
        }
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func authicateSomeone(_ sender: Any) {
        //self.performSegue(withIdentifier: "goToAuthenticate", sender: sender)
    }
    @IBAction func registerForVaccine(_ sender: Any) {
        //self.performSegue(withIdentifier: "goToRegister", sender: sender)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
