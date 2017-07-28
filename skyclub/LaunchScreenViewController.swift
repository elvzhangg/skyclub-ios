//
//  LaunchScreenViewController.swift
//  skyclub
//
//  Created by Elvis  on 7/28/17.
//  Copyright © 2017 Elvis Zhang. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseAuthUI
import FirebaseFacebookAuthUI

class LaunchScreenViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let topColor = UIColor(red: 66/225.0, green: 72/225.0, blue: 248/225.0, alpha: 1)
        let bottomColor = UIColor(red: 206/225.0, green: 102/225.0, blue: 240/225.0, alpha: 1)
        
        let gradientColors: [CGColor] = [topColor.cgColor, bottomColor.cgColor]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        
        
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
