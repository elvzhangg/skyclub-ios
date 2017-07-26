//
//  FlightInfoController.swift
//  skyclub
//
//  Created by Elvis  on 7/25/17.
//  Copyright © 2017 Elvis Zhang. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseAuthUI
import FirebaseFacebookAuthUI

class FlightInfoController: UIViewController {
    
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var flightNumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let datePicker = UIDatePicker()
        
        datePicker.datePickerMode = UIDatePickerMode.date
        
        datePicker.addTarget(self, action: #selector(FlightInfoController.datePickerValueChanged(sender:)), for: UIControlEvents.valueChanged)
        
        
        dateTextField.inputView = datePicker
        
    }
    
    func datePickerValueChanged(sender: UIDatePicker) {
       
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        dateTextField.text = dateFormatter.string(from: sender.date)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func searchFlightFriends(_ sender: Any) {
        FlightService.create(date: dateTextField.text!, flightNumber: flightNumberTextField.text!, completion: { success in
            if success {
                self.performSegue(withIdentifier: "toFindFriends", sender: nil)
            }
        })
    }
    
  
}
