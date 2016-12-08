//
//  CheckInTableViewCell.swift
//  sidebarMenuTutorial
//
//  Created by Feelink Apps on 11/11/16.
//  Copyright © 2016 Kenechi Okolo. All rights reserved.
//

import UIKit

class CheckInTableViewCell: UITableViewCell {

    @IBOutlet weak var imagenLugar: UIImageView!
    @IBOutlet weak var nombreDistancia: UILabel!
    @IBOutlet weak var visitantes: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
