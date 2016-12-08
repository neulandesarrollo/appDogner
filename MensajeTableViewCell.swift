//
//  MensajeTableViewCell.swift
//  sidebarMenuTutorial
//
//  Created by Feelink Apps on 11/11/16.
//  Copyright © 2016 Kenechi Okolo. All rights reserved.
//

import UIKit

class MensajeTableViewCell: UITableViewCell {

    @IBOutlet weak var imagenPerfil: UIImageView!
    @IBOutlet weak var iconoPerfil: UIImageView!
    @IBOutlet weak var hora: UILabel!
    @IBOutlet weak var persona: UILabel!
    @IBOutlet weak var texto: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
