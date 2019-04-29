//
//  PasswordViewController.swift
//  MoneyTogether
//
//  Created by Osmar Hernández on 29/04/19.
//  Copyright © 2019 pastdue. All rights reserved.
//

import UIKit

class PasswordViewController: UIViewController {
    
    var pageVC: SignInPageViewController!
    var index: Int!
    
    @IBOutlet weak var passwordCheck: UILabel!
    @IBOutlet weak var retypePasswordCheck: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    
    private var password: String!
    private var validPassword: String!
    
    @IBAction func goToPreviousPage(_ sender: UIButton) {
        pageVC.setViewControllers([pageVC.vc[index - 1]], direction: .reverse, animated: true, completion: nil)
    }
    
    @IBAction func goToNextPage(_ sender: UIButton) {
        if validPassword != nil {
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
    
    @IBAction func setPassword(_ sender: UITextField) {
        guard let text = sender.text, text.match(Patterns.password.rawValue) else {
            return
        }
        
        password = text
    }
    
    @IBAction func retypePassword(_ sender: UITextField) {
        guard let password = password else {
            return
        }
        
        validPassword = password
    }
}
