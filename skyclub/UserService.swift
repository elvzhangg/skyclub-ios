//
//  UserServices.swift
//  skyclub
//
//  Created by Louis on 2017/7/25.
//  Copyright © 2017年 Elvis Zhang. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth.FIRUser
import FirebaseDatabase
import FirebaseStorage

struct UserService {
    
    
    static func create(withUID uid: String, name: String, sex: String, age: String, image: UIImage, completion: @escaping (User?) -> Void) {
        
        let storageRef = Storage.storage().reference().child(Constants.UserDefaults.imageURL).child(uid)
        StorageService.uploadImage(image, at: storageRef, completion: { url in
            guard let imageURL = url?.absoluteString else { return }
            let dict = [Constants.UserDefaults.name: name,
                        Constants.UserDefaults.sex: sex,
                        Constants.UserDefaults.age: age,
                        Constants.UserDefaults.imageURL: imageURL]
            let ref = Database.database().reference().child("users").child(uid)
            ref.setValue(dict) { (error, ref) in
                if let error = error {
                    // If no connection then return error to caller
                    assertionFailure(error.localizedDescription)
                    return completion(nil)
                }
                // Create user from user input
                let user = User(uid: uid, name: name, sex: sex, age: age, imageURL: imageURL)
                // Return created user to caller
                completion(user)
            }
        })
    }
}


