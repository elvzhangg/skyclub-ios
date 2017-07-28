//
//  HomeViewController.swift
//  skyclub
//
//  Created by Elvis  on 7/27/17.
//  Copyright © 2017 Elvis Zhang. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var flightNumber: String!
    var date: String!
    var users = [User]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        FlightService.getFlights(forDate: date, andFlightNumber: flightNumber, completion: { users in
            self.users = users
            self.tableView.reloadData()
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = users[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell", for: indexPath) as! HeaderCell
        let imageURL = URL(string: user.imageURL)
        
        cell.nameLabel.text = user.name
        cell.ageLabel.text = user.age
        cell.sexLabel.text = user.sex
        cell.imageView?.kf.setImage(with: imageURL)
        
        
        return cell
    }
    @IBAction func unwindProfileView(segue: UIStoryboardSegue) {
        
        print("unwindProfileView fired in firt view")
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.Segue.showDetail {
            let detailVC = segue.destination as! ProfileViewController
            let indexPath = tableView.indexPathForSelectedRow!
            let selectedUser = users[indexPath.row]
            detailVC.user = selectedUser
        }
    }
}
