//
//  ViewController.swift
//  Login Fire
//
//  Created by Mac10 on 27/11/21.
//

import UIKit
import FirebaseAuth



class ViewController: UIViewController {

    @IBOutlet var viewAuth: UIView!
    @IBOutlet weak var UsuarioLBL: UITextField!
    @IBOutlet weak var PassLBL: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       /* let defaults = UserDefaults.standard
        if let email = defaults.value(forKey: "email") as? String,
           let provider = defaults.value(forKey: "provider") as? String{
            view.isHidden = true
            navigationController?.pushViewController(InicioViewController(email: email, provider: .basic), animated: false)
        }*/
    }

    
    @IBAction func AceptarBtn(_ sender: UIButton) {
        if let email = UsuarioLBL.text, let pass = PassLBL.text{
            Auth.auth().signIn(withEmail: email, password: pass) { (result, error) in
                if let result = result, error == nil{
                    self.navigationController?.pushViewController(InicioViewController(email: result.user.email!, provider: .basic), animated: true)
                }else{
                    let alertController = UIAlertController(title: "Error", message: "Se ha producido un error", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func RegistrarBtn(_ sender: UIButton) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let Registro = segue.destination as? RegistroViewController else {return}
    }
}

