//
//  DogResultViewController.swift
//  sidebarMenuTutorial
//
//  Created by Pablo Leyva on 10/11/16.
//  Copyright © 2016 Kenechi Okolo. All rights reserved.
//

import UIKit

class DogResultViewController: UIViewController {

    @IBOutlet weak var BuscarB: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        BuscarB.layer.cornerRadius = 6
        
        //Cambia el titulo del item izq
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
