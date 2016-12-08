//
//  Header.swift
//  sidebarMenuTutorial
//
//  Created by Feelink Apps on 05/12/16.
//  Copyright © 2016 Kenechi Okolo. All rights reserved.
//

import UIKit

class Header: UIViewController {
    
    @IBOutlet weak var lblTitulo: UILabel!
    @IBOutlet weak var btnLupa: UIButton!
    
    var titulo = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblTitulo.text = titulo
        
        if let menu = self.revealViewController(){
            self.view.addGestureRecognizer(menu.panGestureRecognizer())
        }
    }
    
    @IBAction func abrirMenu(){
        if let menu = self.revealViewController(){
            menu.revealToggle(animated: true)
        }else{
            print("No existe el menu en la ventana \(self.titulo)")
        }
    }
    

}
