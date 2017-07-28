//
//  ProfileViewController.swift
//  skyclub
//
//  Created by Louis on 2017/7/28.
//  Copyright © 2017年 Elvis Zhang. All rights reserved.
//

import UIKit
import Kingfisher

class ProfileViewController: UIViewController {

    var user: User!
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameTextField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL.init(string: user.imageURL) else {
            return
        }
        // Do any additional setup after loading the view.
        profileImageView?.kf.setImage(with: url)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
