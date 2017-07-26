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
        
    }
    
    @IBAction func searchFlightFriends(_ sender: Any) {
        FlightService.create(date: dateTextField.text!, flightNumber: flightNumberTextField.text!, completion: { success in
            if success {
                self.performSegue(withIdentifier: "toFindFriends", sender: nil)
            }
        })
    }
    
  
}
