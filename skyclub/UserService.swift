//
//  UserServices.swift
//  skyclub
//
//  Created by Louis on 2017/7/25.
//  Copyright © 2017年 Elvis Zhang. All rights reserved.
//

import Foundation
import FirebaseAuth.FIRUser
import FirebaseDatabase

struct UserService {
    
    
    static func create(withUID uid: String, name: String, sex: String, age: String, completion: @escaping (User?) -> Void) {
        let dict = [Constants.UserDefaults.name: name,
                    Constants.UserDefaults.sex: sex,
                    Constants.UserDefaults.age: age]
        
        // Write user attributes to database
        let ref = Database.database().reference().child("users").child(uid)
        ref.setValue(dict) { (error, ref) in
            if let error = error {
                // If no connection then return error to caller
                assertionFailure(error.localizedDescription)
                return completion(nil)
            }
            // Create user from user input
            let user = User(uid: uid, name: name, sex: sex, age: age)
            // Return created user to caller
            completion(user)
        }
    }
    
    /* static func posts(for user: User, completion: @escaping ([FlightInfo]) -> Void) {
        let ref = Database.database().reference().child("users").child(user.uid)
        
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            guard let snapshot = snapshot.children.allObjects as? [DataSnapshot] else {
                return completion([])
            }
            
            let posts = snapshot.reversed().flatMap(FlightInfo.init)
            completion(posts)
        })
    } */
}


