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

typealias FIRUser = FirebaseAuth.User

class LoginViewController: UIViewController, FUIAuthDelegate {

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
        
        UserService.show(forUID: user.uid) { (user) in
            if let user = user {
                // handle existing user
                User.setCurrent(user, writeToUserDefaults: true)
                
                let initialViewController = UIStoryboard.initialViewController(for: .main)
                self.view.window?.rootViewController = initialViewController
                self.view.window?.makeKeyAndVisible()
            } else {
                // handle new user
        
        performSegue(withIdentifier: "toCreateProfile", sender: nil)
    }
}
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
