//
//  MessagesViewController.swift
//  DognerTest
//
//  Created by Feelink02 on 28/10/16.
//  Copyright © 2016 Feelink Apps. All rights reserved.
//

import UIKit

class MessagesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var openMenu: UIBarButtonItem!

    @IBOutlet weak var tableView: UITableView!
    
    var Nombres = ["Roberto Jaime", "Paco Plascencia", "David Hernández", "Aldo Estrada", "Pablo Leyva", "Carlos Rojas", "Luis Prieto", "Fritz Von Scherzer"]
    
    var Fechas = ["20:30", "20:15", "19:55", "15:17", "14:03", "11:09", "10:55", "09:55"]
    
    var ProfilePicture = ["persona1", "persona2", "persona3", "persona4", "persona5", "persona1", "persona2", "persona3"]
    
    var IconoPerfil = ["run_mensajes", "hearth_mensajes", "health_mensajes", "friends_mensajes", "camadas_mensajes", "hearth_mensajes", "health_mensajes", "friends_mensajes"]
    
    var Caption1 = ["Bacon ipsum dolor amet kielbasa corned beef tenderloin shankle", "biltong chuck. Ham short loin kielbasa jerky, drumstick alcatra", "ham hock andouille pork. Biltong cow beef ribs bacon. Jerky pancetta kevin fatback pastrami", "Brisket pancetta strip steak drumstick kielbasa", "Capicola short ribs tenderloin sirloin turkey corned beef", "biltong ball tip. Prosciutto brisket ball tip ground round bacon", "fatback strip steak tail drumstick. Picanha fatback landjaeger andouille.", "Brisket pancetta strip steak drumstick kielbasa", "Capicola short ribs tenderloin sirloin turkey corned beef"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Nombres.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellMensaje", for: indexPath) as! MensajeTableViewCell
        
        cell.persona.text = Nombres[indexPath.row]
        cell.imagenPerfil.image = UIImage(named: ProfilePicture[indexPath.row])
        cell.texto.text = Caption1[indexPath.row]
        cell.hora.text = Fechas[indexPath.row]
        cell.iconoPerfil.image = UIImage(named: IconoPerfil[indexPath.row])
        
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
