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
    
    var dateString: String!
    var flightNumber: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let datePicker = UIDatePicker()
        
        datePicker.datePickerMode = UIDatePickerMode.date
        
        datePicker.addTarget(self, action: #selector(FlightInfoController.datePickerValueChanged(sender:)), for: UIControlEvents.valueChanged)
        
        
        dateTextField.inputView = datePicker
        
    }
    
    func datePickerValueChanged(sender: UIDatePicker) {
       
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeStyle = DateFormatter.Style.none
        dateString = dateFormatter.string(from: sender.date)
        dateTextField.text = dateString
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func searchFlightFriends(_ sender: Any) {
        guard let date = dateString,
        !date.isEmpty,
        let flightNumber = flightNumberTextField.text,
        !flightNumber.isEmpty else {
            return
        }
        self.flightNumber = flightNumber
        FlightService.create(date: dateString, flightNumber: flightNumber, completion: { success in
            if success {
                self.performSegue(withIdentifier: "toFindFriends", sender: nil)
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFindFriends" {
            let homeVC = segue.destination as! HomeViewController
            homeVC.flightNumber = self.flightNumber
            homeVC.date = self.dateString
        }
    }
  
}
