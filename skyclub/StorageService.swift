//
//  StorageService.swift
//  skyclub
//
//  Created by Louis on 2017/7/28.
//  Copyright © 2017年 Elvis Zhang. All rights reserved.
//

import Foundation
import UIKit
import FirebaseStorage

struct StorageService {
    static func uploadImage(_ image: UIImage, at reference: StorageReference, completion: @escaping (URL?) -> Void) {
        guard let imageData = UIImageJPEGRepresentation(image, 0.1)
            else {
                return completion(nil)
        }
        reference.putData(imageData, metadata: nil, completion: {
            (metadata, error) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return completion (nil)
            }
            completion(metadata?.downloadURL() )
        })
    }
}
