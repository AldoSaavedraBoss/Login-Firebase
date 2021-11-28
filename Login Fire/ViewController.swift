//
//  ViewController.swift
//  Login Fire
//
//  Created by Mac10 on 27/11/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var UsuarioLBL: UITextField!
    @IBOutlet weak var PassLBL: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func AceptarBtn(_ sender: UIButton) {
        
    }
    
    @IBAction func RegistrarBtn(_ sender: UIButton) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let Inicio = segue.destination as? InicioViewController else {return}
        guard let Registro = segue.destination as? RegistroViewController else {return}
    }
}

