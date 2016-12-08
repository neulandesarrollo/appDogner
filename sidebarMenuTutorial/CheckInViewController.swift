//
//  CheckInViewController.swift
//  DognerTest
//
//  Created by Feelink02 on 28/10/16.
//  Copyright © 2016 Feelink Apps. All rights reserved.
//

import UIKit

class CheckInViewController: UIViewController{
    
    @IBOutlet var OpenMenu: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        OpenMenu.target = self.revealViewController()
        OpenMenu.action = #selector(SWRevealViewController.revealToggle(_:))
        if self.revealViewController() != nil {
            OpenMenu.target = self.revealViewController()
            OpenMenu.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
   /* func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AgenciasViewTableViewCell
        
        cell.direccionAgencia.text = Direcciones[indexPath.row]
        cell.nombreAgencia.text = Nombres[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vcName = identities[indexPath.row]
        let viewController = storyboard?.instantiateViewController(withIdentifier: vcName)
        
        tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(viewController!, animated: true)
    }*/
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
    
}
