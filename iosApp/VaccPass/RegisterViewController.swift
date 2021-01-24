//
//  RegisterViewController.swift
//  VaccPass
//
//  Created by Jonathan Ho on 2021-01-23.
//  Copyright © 2021 Jonathan Ho. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var promptLabel: UILabel!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var dateOfBirthField: UITextField!
    let datePicker = UIDatePicker()
    
    @IBOutlet weak var healthcardField: UITextField!
    
    @IBOutlet weak var addressField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: false);
        datePicker.datePickerMode = UIDatePicker.Mode.date;
        dateOfBirthField.inputView = datePicker;
        navigationController?.navigationBar.prefersLargeTitles = true;
        datePicker.addTarget(self, action: #selector(self.handleDatePicker), for: UIControl.Event.valueChanged);
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.signUp) )        // Do any additional setup after loading the view.
    }
   @objc func handleDatePicker() {
        
        dateOfBirthField.text =  DateFormatter.localizedString(from: datePicker.date, dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.none)
    
    }
    @objc func signUp() {
        self.performSegue(withIdentifier: "goToFirstBooking", sender: self)
        // network fucntion here
        
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
