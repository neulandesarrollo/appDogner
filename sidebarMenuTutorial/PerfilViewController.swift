//
//  PerfilViewController.swift
//  sidebarMenuTutorial
//
//  Created by Pablo Leyva on 07/11/16.
//  Copyright © 2016 Kenechi Okolo. All rights reserved.
//

import UIKit

class PerfilViewController:UIViewController {
    @IBOutlet weak var OpenMenu: UIBarButtonItem!
    
    @IBOutlet weak var Bio: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        OpenMenu.target = self.revealViewController()
        OpenMenu.action = #selector(SWRevealViewController.revealToggle(_:))
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

   

}
