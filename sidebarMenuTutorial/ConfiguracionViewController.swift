//
//  ConfiguracionViewController.swift
//  sidebarMenuTutorial
//
//  Created by Feelink Apps on 12/11/16.
//  Copyright © 2016 Kenechi Okolo. All rights reserved.
//

import UIKit

class ConfiguracionViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBOutlet weak var tableView: UITableView!
    
    var Nombre = ["Perfil de Seguridad", "Publicaciones Multimedia", "Sonido", "Notificaciones", "Idioma", "General", "Seguidores", "Bloqueo", "Términos y Condiciones", "Aviso de Privacidad"]
    
    var Imagen = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]

    var identities = [String]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Nombre.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellConf", for: indexPath) as! ConfiguracionTableViewCell
        
        cell.nombre.text = Nombre[indexPath.row]
        cell.icono.image = UIImage(named: Imagen[indexPath.row])

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vcName = identities[indexPath.row]
        let viewController = storyboard?.instantiateViewController(withIdentifier: vcName)
        
        tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(viewController!, animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        identities = ["Empty", "Empty", "Empty", "Empty", "Empty", "Empty", "Empty", "Empty", "Terminos", "Aviso"]

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
