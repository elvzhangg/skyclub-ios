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

class LoginViewController: UIViewController, FUIAuthDelegate {

    @IBAction func loginFacebook(_ sender: UIButton) {
        guard let authUI = FUIAuth.defaultAuthUI()
            else { return }
        
        authUI.delegate = self
        
        // configure Auth UI for Facebook login
        let providers: [FUIAuthProvider] = [FUIFacebookAuth()]
        authUI.providers = providers
        
        let authViewController = authUI.authViewController()
        present(authViewController, animated: true)
    }
    
    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
        performSegue(withIdentifier: "didSignIn", sender: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
