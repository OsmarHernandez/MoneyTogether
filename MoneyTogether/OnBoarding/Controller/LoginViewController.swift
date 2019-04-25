//
//  LoginViewController.swift
//  MoneyTogether
//
//  Created by Osmar Hernández on 27/03/19.
//  Copyright © 2019 pastdue. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backToMenuButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func continueButton(_ sender: UIButton) {
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            return
        }
                
        UserManager.login(with: email, and: password) {
            (success) in
            
            if success {
                print("Credenciales correctas")
                self.performSegue(withIdentifier: "showMainSegue", sender: sender)
            } else {
                print("Credenciales incorrectas")
            }
        }
    }
    
    /**
     * Only as a Test
     */
    @IBAction func newAccountButton(_ sender: UIButton) {
        UserManager.create {
            (success) in
            
            if success {
                print("Usuario Creado!")
                self.performSegue(withIdentifier: "showMainSegue", sender: sender)
            } else {
                print("Algo salio mal")
            }
        }
    }
}
