//
//  AccountViewController.swift
//  MoneyTogether
//
//  Created by Osmar Hernández on 26/04/19.
//  Copyright © 2019 pastdue. All rights reserved.
//

import UIKit
import FirebaseAuth

class AccountViewController: UIViewController {

    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    func setup() {
        if let currentUser = Auth.auth().currentUser {
            print(currentUser)
        }
    }
    
    func showAlert() {
        let alertController = UIAlertController(title: "Eliminar Cuenta", message: "¿Seguro que deseas eliminar tu cuenta?", preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "No", style: .cancel)
        
        alertController.addAction(cancel)
        
        let allow = UIAlertAction(title: "Si", style: .destructive) {
            (action) in
            
            if let currentUser = Auth.auth().currentUser {
                let uid = currentUser.uid
                
                currentUser.delete {
                    (error) in
                    
                    if error == nil {
                        print("Account deleted")
                        
                        UserManager.delete(with: uid)
                        
                        self.performSegue(withIdentifier: "showOnBoardingSegue", sender: nil)
                    } else {
                        print("An error ocurred...")
                    }
                }
            }
        }
        
        alertController.addAction(allow)
        
        present(alertController, animated: false, completion: nil)
    }
    
    @IBAction func logOutButton(_ sender: UIButton) {
        do {
           try Auth.auth().signOut()
            
            performSegue(withIdentifier: "showOnBoardingSegue", sender: sender)
        } catch {
            print("Error loging out...")
            
            performSegue(withIdentifier: "showOnBoardingSegue", sender: sender)
        }
    }
    
    @IBAction func deleteAccount(_ sender: UIButton) {
        showAlert()
    }
}
