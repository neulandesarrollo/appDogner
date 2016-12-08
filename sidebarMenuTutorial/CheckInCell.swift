//
//  CheckInCell.swift
//  sidebarMenuTutorial
//
//  Created by Pablo Leyva on 02/11/16.
//  Copyright © 2016 Kenechi Okolo. All rights reserved.
//

import UIKit

class CheckInCell: UITableViewCell {

    @IBOutlet weak var Imagen: UIImageView!
    @IBOutlet weak var Mensaje: UILabel!
    @IBOutlet weak var Lugar: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
