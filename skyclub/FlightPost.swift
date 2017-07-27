//
//  FlightPost.swift
//  skyclub
//
//  Created by Louis on 2017/7/27.
//  Copyright © 2017年 Elvis Zhang. All rights reserved.
//

import UIKit
import FirebaseStorage

class FlightPost {
    static func uploadImage(_ image: UIImage, at reference: StorageReference, completion: @escaping (URL?) -> Void) {
    // 2
    reference.putData(imageData, metadata: nil, completion: { (metadata, error) in
        // 3
        if let error = error {
            assertionFailure(error.localizedDescription)
            return completion(nil)
        }
        
        // 4
        completion(metadata?.downloadURL())
    })
}
}
