//
//  AmigosViewController.swift
//  sidebarMenuTutorial
//
//  Created by Pablo Leyva on 09/11/16.
//  Copyright © 2016 Kenechi Okolo. All rights reserved.
//

import UIKit

class AmigosViewController: UIViewController {

    @IBOutlet weak var OpenMenu: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showHeaderAmigos"{
            let header = segue.destination as! Header
            header.titulo = "AMIGOS"
        }
        
    }

    
}
