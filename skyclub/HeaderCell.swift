//
//  HeaderCell.swift
//  skyclub
//
//  Created by Elvis  on 7/27/17.
//  Copyright © 2017 Elvis Zhang. All rights reserved.
//

import Foundation
import UIKit

class HeaderCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}

/* let imageURL: String
 let imageHeight: CGFloat
 
 init(imageURL: String, imageHeight: CGFloat){
 self.imageURL = imageURL
 self.imageHeight = imageHeight
 
 
 }
 
 required init?(coder aDecoder: NSCoder) {
 fatalError("init(coder:) has not been implemented")
 }
 */
