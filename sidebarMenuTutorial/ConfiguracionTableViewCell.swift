//
//  ConfiguracionTableViewCell.swift
//  sidebarMenuTutorial
//
//  Created by Feelink Apps on 12/11/16.
//  Copyright © 2016 Kenechi Okolo. All rights reserved.
//

import UIKit

class ConfiguracionTableViewCell: UITableViewCell {

    @IBOutlet weak var icono: UIImageView!
    @IBOutlet weak var nombre: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
