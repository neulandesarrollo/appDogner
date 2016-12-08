//
//  HomeViewController.swift
//  sidebarMenuTutorial
//
//  Created by Pablo Antonio Leyva Muñoz on 31/10/16.
//  Copyright © 2016 Kenechi Okolo. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    var Nombres = ["Roberto Jaime", "Paco Plascencia", "David Hernández", "Aldo Estrada", "Pablo Leyva", "Carlos Rojas", "Luis Prieto", "Fritz Von Scherzer"]
    
    var Estados = ["Son muy tiernos", "¡Amo los perros!", "Amo Dogner", "Mi perro ideal", "Tuvo Cachorritos!!!", ":(", "Cuidemos a los animales", "No lo esperaba!"]
    
    var Fechas = ["5 min | Querétaro, México", "18 min | Guadalajara, México", "25 min | CDMX, México", "4 hrs | Querétaro, México", "5 hrs | Guadalajara, México", "7 hrs | Monterrey, México", "9 hrs | CDMX, México", "10 hrs | Querétaro, México"]
    
    var PostPicture = ["perro1", "perro2", "perro3", "perro4", "perro5", "perro1", "perro2", "perro3"]
    
    var ProfilePicture = ["persona1", "persona2", "persona3", "persona4", "persona5", "persona1", "persona2", "persona3"]
    
    var Caption1 = ["Bacon ipsum dolor amet", "filet mignon, andouille", "ham hock pork ", "belly. Short loin corned", "beef ham venison", "beef ham venison", "anha t-", "alcatra."]
    
    var Caption2 = ["salami shank", "swine picanha", "Alcatra tongue", "bacon kevin", "shankle short", "loin. Sausage", "doner pork", "Prosciutto"]
    
    @IBOutlet weak var OpenMenu: UIBarButtonItem!
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Nombres.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableViewCell
        
        cell.nombre.text = Nombres[indexPath.row]
        cell.estado.text = Estados[indexPath.row]
        cell.fecha.text = Fechas[indexPath.row]
        cell.postPicture.image = UIImage(named: PostPicture[indexPath.row])
        cell.caption1.text = Caption1[indexPath.row]
        cell.caption2.text = Caption2[indexPath.row]
        cell.profilePicture.image = UIImage(named: ProfilePicture[indexPath.row])
        
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        OpenMenu.target = self.revealViewController()
        OpenMenu.action = #selector(SWRevealViewController.revealToggle(_:))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
