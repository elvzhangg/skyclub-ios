//
//  User.swift
//  skyclub
//
//  Created by Louis on 2017/7/25.
//  Copyright © 2017年 Elvis Zhang. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
import UIKit
    
class User: NSObject {
    
    // MARK: - Singleton
    
    
    
    // 1
    private static var _current: User?
    
    // 2
    static var current: User {
        // 3
        guard let currentUser = _current else {
            fatalError("Error: current user doesn't exist")
        }
        
        // 4
        return currentUser
    }
    
    // MARK: - Class Methods
    
    // 5
    class func setCurrent(_ user: User, writeToUserDefaults: Bool = false) {
        
        if writeToUserDefaults{
            let data = NSKeyedArchiver.archivedData(withRootObject: user)
            
            UserDefaults.standard.set(data, forKey: Constants.UserDefaults.currentUser)
        }
        
        _current = user
    }
    // MARK: - Properties
    
    let uid: String
    let username: String
    let age: String
    let sex: String
    
    var dictValue: [String: String] {
        let dict = ["username": username,
                    "age": age,
                    "sex": sex]
        return dict
    }
    
    
    // MARK: - Init
    
    init(uid: String, username: String, sex: String, age: String) {
        self.uid = uid
        self.username = username
        self.age = age
        self.sex = sex
        super.init()
    }
    
    // init with aCoder
    
    required init?(coder aDecoder: NSCoder){
        guard let uid = aDecoder.decodeObject(forKey: Constants.UserDefaults.uid) as? String,
            let username = aDecoder.decodeObject(forKey: Constants.UserDefaults.username) as? String,
            let _ = aDecoder.decodeObject(forKey: Constants.UserDefaults.age) as? String,
            let _ = aDecoder.decodeObject(forKey: Constants.UserDefaults.sex) as? String
            else {return nil}
        self.uid = uid
        self.username = username
        self.age = age
        self.sex = sex

        super.init()
    }

    
    // func to encode User
    
    
    // failable init from DataSnapshot
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot as? [String: String],
        let age = dict["age"] else {
            return nil
        }
        self.uid = snapshot.key
        self.age = age
    }
    
}

