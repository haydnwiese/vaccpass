//
//  RegisterViewController.swift
//  VaccPass
//
//  Created by Jonathan Ho on 2021-01-23.
//  Copyright © 2021 Jonathan Ho. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var myText: UITextField!
    @IBOutlet weak var myButton: UIButton!

    @IBAction func goNext(_ sender: Any) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        myText.text = "hello"
        myButton.setTitle("hello", for: UIControl.State.focused)

        // Do any additional setup after loading the view.
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
