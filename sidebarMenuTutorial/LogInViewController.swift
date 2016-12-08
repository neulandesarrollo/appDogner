//
//  LogInViewController.swift
//  DognerTest
//
//  Created by Feelink02 on 27/10/16.
//  Copyright © 2016 Feelink Apps. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Alamofire
import SwiftyJSON

class LogInViewController: UIViewController {
    
    //enlaces del view
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorEmail: UIImageView!
    @IBOutlet weak var errorPassword: UIImageView!
    
    var dict : [String : AnyObject]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        /*Alamofire.request("", method: .get).responseJSON { (response) in
            switch response.result{
            case .success(_):
                
                guard let jsonData = response.data else{
                    return
                }
                
                let json = JSON(data: jsonData)
                for usuario in json["status"].arrayValue{
                    usuario["nom"]
                }
                
                
            case .failure(let error):
                print(error)
                break
            }
        }
        
        self.login()*/
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //accion del boton logIn
     @IBAction func LoginButton(_ sender: AnyObject) {
     self.emailTextField.resignFirstResponder()
     self.passwordTextField.resignFirstResponder()
     
     //Verificando que los textField no esten vacios
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
        
     self.login()
     
     //let email : String = "test@neuland.mx"
     //let password: String = "Neuland"
     
     /*if emailTextField.text == email && passwordTextField.text == password
     {
     print("Entro")
     let viewController = storyboard?.instantiateViewController(withIdentifier: "Home") as! HomeViewController
     
     self.navigationController?.pushViewController(viewController, animated: true)
     }
     else
     {
     let alert : UIAlertController = UIAlertController(title: "Error de autenticacion", message: "El usuario o la contraseña son incorrectos", preferredStyle: .alert)
     
     let okAction : UIAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
     
     alert.addAction(okAction)
     
     present(alert, animated: true, completion: nil)
     }*/
     
        
     }
    
    @IBAction func btnFBLoginPressed(_ sender: AnyObject) {
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if (error == nil){
                let fbloginresult : FBSDKLoginManagerLoginResult = result!
                if fbloginresult.grantedPermissions != nil {
                    if(fbloginresult.grantedPermissions.contains("email"))
                    {
                        self.getFBUserData()
                        fbLoginManager.logOut()
                    }
                }
            }
        }
    }
    
    func getFBUserData(){
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    self.dict = result as! [String : AnyObject]
                    
                    let name = self.dict["name"]
                    let id = self.dict["id"]
                    
                    var pictureUrl = ""
                    
                    let picture = self.dict["picture"] as? NSDictionary, data = picture?["data"] as? NSDictionary, url = data?["url"] as? String
                    
                    pictureUrl = url!
                    
                    
                    var parameters: [String: AnyObject?] = [:]
                    
                    parameters["fb_id"] = id
                    parameters["full_name"] = name
                    parameters["image_url"] = pictureUrl as AnyObject??
                    
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
                                //self.present(secondViewController, animated: false, completion: nil)
                            }
                            else
                            {
                                let alert : UIAlertController = UIAlertController(title: "Error de autenticacion", message: "El usuario o la contraseña son incorrectos", preferredStyle: .alert)
                                
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
                    print(result!)
                    print(self.dict)
                }
            })
        }
    }
    
    
    func login()
    {
        var parameters: [String: AnyObject?] = [:]
        
        parameters["email"] = emailTextField.text as AnyObject??
        parameters["password"] = passwordTextField.text as AnyObject??
        
        Alamofire.request("http://www.feelink.mx/dogner/login.php", method: .post, parameters: parameters).responseJSON { (response) in
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
                    //self.present(secondViewController, animated: false, completion: nil)
                }
                else
                {
                    let alert : UIAlertController = UIAlertController(title: "Error de autenticacion", message: "El usuario o la contraseña son incorrectos", preferredStyle: .alert)
                    
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
