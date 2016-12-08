//
//  CheckInViewController1.swift
//  sidebarMenuTutorial
//
//  Created by Feelink Apps on 11/11/16.
//  Copyright © 2016 Kenechi Okolo. All rights reserved.
//

import UIKit

class CheckInViewController1: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    
    var Nombres = ["La Buena Tierra | 1.3km", "Clinica Guau | 1.6km", "Parque Metropolitano | 2.3km", "El Can Feliz | 2.8km", "Hospital Canino | 3.1km", "Parque Revolución | 3.7km", "Restaurante Firulais | 4.1km", "Veterinaria Feelink | 5.0km"]
    
    var Asistentes = ["636 estuvieron aquí", "236 estuvieron aquí", "136 estuvieron aquí", "836 estuvieron aquí", "36 estuvieron aquí", "63 estuvieron aquí", "106 estuvieron aquí", "6 estuvieron aquí"]
    
    var Imagen = ["restaurante", "clinica", "parque", "restaurante", "clinica", "parque", "restaurante", "clinica"]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Nombres.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellLugar", for: indexPath) as! CheckInTableViewCell
        
        cell.nombreDistancia.text = Nombres[indexPath.row]
        cell.visitantes.text = Asistentes[indexPath.row]
        cell.imagenLugar.image = UIImage(named: Imagen[indexPath.row])
        
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /*let logo = UIImage(named: "persona1.png")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView*/
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
            
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
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
