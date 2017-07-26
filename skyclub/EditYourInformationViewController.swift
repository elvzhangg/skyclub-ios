//
//  EditYourInformationViewController.swift
//  skyclub
//
//  Created by Louis on 2017/7/25.
//  Copyright © 2017年 Elvis Zhang. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase


class EditYourInformationViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var sexTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.layer.cornerRadius=6
        
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        guard let firUser = Auth.auth().currentUser,
        let name = nameTextField.text,
        let age = ageTextField.text,
        let sex = sexTextField.text,
        !name.isEmpty,
        !age.isEmpty,
        !sex.isEmpty
            else { return }
        
        UserService.create(withUID: firUser.uid, name: name, sex: sex , age: age) { (user) in
            guard let user = user else {
                // handle error
                // TODO
                print("Not Connected")
                return
            }
            
            User.setCurrent(user, writeToUserDefaults: true)
            
            let initialViewController = UIStoryboard.initialViewController(for: .main)
            self.view.window?.rootViewController = initialViewController
            self.view.window?.makeKeyAndVisible()
        }
}
}
