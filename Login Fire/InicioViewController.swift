//
//  InicioViewController.swift
//  Login Fire
//
//  Created by Mac10 on 27/11/21.
//

import UIKit
import  FirebaseAuth

enum ProviderType {
    case basic
    case google
}

class InicioViewController: UIViewController {
    
    let provider: ProviderType
    let email: String
    
    init(email: String, provider: ProviderType) {
        self.provider = provider
        self.email = email
        super.init(nibName: "InicioViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init(coder:) no ha sido implementado")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Guardar datos
        
       let defaults = UserDefaults.standard
        defaults.set(email, forKey: "email")
        //defaults.set(provider, forKey: "provider")
        defaults.synchronize()
    }
    
    @IBAction func CerrarSecionBtn(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "email")
        defaults.removeObject(forKey: "provider")
        defaults.synchronize()
        
        switch provider {
        case .basic, .google:
            do {
                 let cerrar = try Auth.auth().signOut()
                navigationController?.popViewController(animated: true)
            } catch  {
                
            }
            
        }
    }
    
}
