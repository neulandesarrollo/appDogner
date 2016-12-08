//
//  LugaresViewController.swift
//  sidebarMenuTutorial
//
//  Created by Pablo Leyva on 06/11/16.
//  Copyright © 2016 Kenechi Okolo. All rights reserved.
//

import UIKit

class LugaresViewController: UIViewController {

    @IBOutlet var openMenu: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "mostarHeader"{
            let header = segue.destination as! Header
            header.titulo = "LUGARES"
        }
        
    }

}
