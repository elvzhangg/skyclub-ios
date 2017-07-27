//
//  FlightService.swift
//  skyclub
//
//  Created by Louis on 2017/7/26.
//  Copyright © 2017年 Elvis Zhang. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct FlightService {
    static func create(date: String, flightNumber: String, completion: @escaping (Bool) -> Void) {
        let ref = Database.database().reference().child("flights").child(date).child(flightNumber).child(User.current.uid)
        ref.updateChildValues(User.current.dictValue, withCompletionBlock: { error, reference in
            guard error == nil else {
                return completion(false)
            }
            completion(true)
        })
    }
    
}
