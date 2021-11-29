//
//  RegistroViewController.swift
//  Login Fire
//
//  Created by Mac10 on 27/11/21.
//

import UIKit
import  FirebaseAuth

class RegistroViewController: UIViewController {

    @IBOutlet weak var EmailTXF: UITextField!
    @IBOutlet weak var PassTXF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func RegistrarBtn(_ sender: UIButton) {
        if let email = EmailTXF.text, let pass = PassTXF.text{
            Auth.auth().createUser(withEmail: email, password: pass) { (result, error) in
                if let result = result, error == nil{
                    self.navigationController?.pushViewController(ViewController(), animated: true)
                }else{
                    let alertController = UIAlertController(title: "Error", message: "Se ha producido un error", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    

}
