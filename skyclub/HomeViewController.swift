//
//  HomeViewController.swift
//  skyclub
//
//  Created by Elvis  on 7/27/17.
//  Copyright © 2017 Elvis Zhang. All rights reserved.
//

import Foundation
import UIKit


class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var flightNumber: String!
    var date: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
