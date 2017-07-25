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
    
    @IBAction func unwindToListNotesViewController(_ segue: UIStoryboardSegue) {
        
        // for now, simply defining the method is sufficient.
        // we'll add code later
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let identifier = segue.identifier {
        if identifier == "back" {
            print("back button tapped")
        } else {
            print ("back button wasn't tapped")
        }
    }
    
    }
}
