//
//  NotificationViewController.swift
//  DognerTest
//
//  Created by Feelink02 on 28/10/16.
//  Copyright © 2016 Feelink Apps. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var openMenu: UIBarButtonItem!
    
    var NotificationText = ["Recuerda que Max tiene cita en el salón", "A Luis Prieto le gusta tu comentario en su post", "Recuerda que Max tiene que ir con el doctor", "Amaia Arrechea quiere que Camila y Max se conozcan", "Bacon ipsum dolor amet kielbasa corned", "shankle biltong chuck. Ham short loin", "drumstick alcatra ham hock", "Biltong cow beef ribs bacon"]
    
    var Image = ["corazon_gris", "estetica", "huella_gris", "shoe_run", "pulse_gris", "huella_gris", "shoe_run", "pulse_gris"]
    
    var Fechas = ["11 de Nov - 16:00hrs", "11 de Nov - 13:00hrs", "11 de Nov - 10:00hrs", "08 de Nov - 16:00hrs", "07 de Nov - 20:00hrs", "05 de Nov - 03:00hrs", "04 de Nov - 16:00hrs", "01 de Nov - 22:00hrs"]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NotificationText.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellNotification", for: indexPath) as! NotificationTableViewCell
        
        cell.texto.text = NotificationText[indexPath.row]
        cell.horaFecha.text = Fechas[indexPath.row]
        cell.imagen.image = UIImage(named: Image[indexPath.row])
        
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        openMenu.target = self.revealViewController()
        openMenu.action = #selector(SWRevealViewController.revealToggle(_:))
        
        
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
