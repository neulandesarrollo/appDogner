//
//  HomeTableViewCell.swift
//  sidebarMenuTutorial
//
//  Created by Feelink Apps on 11/11/16.
//  Copyright © 2016 Kenechi Okolo. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var estado: UILabel!
    @IBOutlet weak var fecha: UILabel!
    @IBOutlet weak var postPicture: UIImageView!
    
    @IBOutlet weak var caption2: UILabel!
    @IBOutlet weak var caption1: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
