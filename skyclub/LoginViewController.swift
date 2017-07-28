//
//  LoginViewController.swift
//  skyclub
//
//  Created by Louis on 2017/7/24.
//  Copyright © 2017年 Elvis Zhang. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseAuthUI
import FirebaseFacebookAuthUI
import FirebaseDatabase

typealias FIRUser = FirebaseAuth.User

class LoginViewController: UIViewController, FUIAuthDelegate {
    
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
    @IBAction func loginFacebook(_ sender: UIButton) {
        
        guard let authUI = FUIAuth.defaultAuthUI()
            else { return }
        
        authUI.delegate = self
        authUI.isSignInWithEmailHidden = true
        
        // configure Auth UI for Facebook login
        let providers: [FUIAuthProvider] = [FUIFacebookAuth()]
        authUI.providers = providers
        
        let authViewController = authUI.authViewController()
        present(authViewController, animated: true)
    }
    
    
    func authUI(_ authUI: FUIAuth, didSignInWith user: FIRUser?, error: Error?) {
        guard let firuser = user, error == nil else {
            print("Sign in error")
            return
        }
        
        let ref = Database.database().reference().child("users").child(firuser.uid)
        ref.observeSingleEvent(of: .value, with: { snapshot in
            guard let user = User(snapshot: snapshot) else {
                self.performSegue(withIdentifier: "toCreateProfile", sender: nil)
                return
            }
            User.setCurrent(user, writeToUserDefaults: true)
            let mainVC = UIStoryboard.initialViewController(for: .main)
            self.view.window?.rootViewController = mainVC
            self.view.window?.makeKeyAndVisible()
        }, withCancel: { error in
            self.performSegue(withIdentifier: "toCreateProfile", sender: nil)
        })
    }
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
