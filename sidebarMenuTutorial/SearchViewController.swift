//
//  SearchViewController.swift
//  DognerTest
//
//  Created by Feelink02 on 28/10/16.
//  Copyright © 2016 Feelink Apps. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var openMenu: UIBarButtonItem!
    
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var Text: UILabel!
    @IBOutlet weak var FondoImagen: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        openMenu.target = self.revealViewController()
        openMenu.action = #selector(SWRevealViewController.revealToggle(_:))
        /*Image.layer.cornerRadius = Image.frame.size.width/2
        Image.clipsToBounds = true*/
        Button1.layer.cornerRadius = 6
        
        
        //Cambia el titulo del item izq
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        
        
      
    }
    
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
    
    
    
}
