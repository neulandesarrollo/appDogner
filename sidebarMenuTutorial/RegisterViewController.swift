//
//  RegisterViewController.swift
//  DognerTest
//
//  Created by Feelink02 on 27/10/16.
//  Copyright © 2016 Feelink Apps. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class RegisterViewController: UIViewController {
    
    //Conexion de los botones y textField
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBOutlet weak var errorUser: UIImageView!
    @IBOutlet weak var errorEmail: UIImageView!
    @IBOutlet weak var errorPassword: UIImageView!
    @IBOutlet weak var confirmPasswordError: UIImageView!
    
    @IBOutlet var SegmentControl: UISegmentedControl!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Boton aceptar del registro
    @IBAction func acceptButton(_ sender: AnyObject) {
        
        //Cerrar teclado
        self.userTextField.resignFirstResponder()
        self.emailTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
        self.confirmPasswordTextField.resignFirstResponder()
        
        //comprobacion que todos los campos esten llenos
        if userTextField.text == ""
        {
            errorUser.isHidden = false
        }
        else if userTextField.text != ""
        {
            errorUser.isHidden = true
        }
        
        if emailTextField.text == ""
        {
            errorEmail.isHidden = false
        }
        else if emailTextField.text != ""
        {
            errorEmail.isHidden = true
        }
        
        if passwordTextField.text == ""
        {
            errorPassword.isHidden = false
        }
        else if passwordTextField.text != ""
        {
            errorPassword.isHidden = true
        }
        
        if confirmPasswordTextField.text == ""
        {
            confirmPasswordError.isHidden = false
        }
        else if confirmPasswordTextField.text != ""
        {
            confirmPasswordError.isHidden = true
        }
        
        //comprobacion de contraseñas
        if passwordTextField.text == confirmPasswordTextField.text
        {
            //seleccion de Persona/Institucion
            let selectedIndex = SegmentControl.selectedSegmentIndex
            
            var type = 0
            
            if selectedIndex == 0
            {
                //Persona
                type = 1
            }
            else
            {
                //Institucion
                type = 2
            }
            
            var parameters: [String: AnyObject?] = [:]
            
            parameters["full_name"] = userTextField.text as AnyObject??
            parameters["email"] = emailTextField.text as AnyObject??
            parameters["password"] = passwordTextField.text as AnyObject??
            parameters["type"] = type as AnyObject??
            
            Alamofire.request("http://www.feelink.mx/dogner/register.php", method: .post, parameters: parameters).responseJSON { (response) in
                switch response.result{
                case .success(_):
                    
                    guard let jsonData = response.data else{
                        return
                    }
                    
                    let json = JSON(data: jsonData)
                    if json["message_id"] == 1
                    {
                        print("Entro")
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let secondViewController = storyboard.instantiateViewController(withIdentifier: "Home") as! HomeViewController
                        let navigationController = UINavigationController(rootViewController: secondViewController)
                        self.present(navigationController, animated: true, completion: nil)
                    }
                    else
                    {
                        let alert : UIAlertController = UIAlertController(title: "Error de autenticacion", message: "El correo electrónico ya está registrado", preferredStyle: .alert)
                        
                        let okAction : UIAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                        
                        alert.addAction(okAction)
                        
                        self.present(alert, animated: true, completion: nil)
                    }
                    print(json)
                    
                    
                case .failure(let error):
                    print(error)
                    break
                }
            }

            
        }
        else
        {
            let alert : UIAlertController = UIAlertController(title: "Error de autenticacion", message: "Las contraseñas no coinciden", preferredStyle: .alert)
            
            let okAction : UIAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alert.addAction(okAction)
            
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    
    //Cerrar teclado presionando la pantalla
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}


