//
//  NameViewController.swift
//  MoneyTogether
//
//  Created by Osmar Hernández on 29/04/19.
//  Copyright © 2019 pastdue. All rights reserved.
//

import UIKit

class NameViewController: UIViewController {
    
    var pageVC: SignInPageViewController!
    var index: Int!
    
    @IBOutlet weak var firstnameCheck: UILabel!
    @IBOutlet weak var lastnameCheck: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    
    @IBAction func goToPreviousPage(_ sender: UIButton) {
        pageVC.dismiss(animated: true) {
            let signInPageViewController = SignInPageViewController()
            self.present(signInPageViewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func goToNextPage(_ sender: UIButton) {
        if let secondViewController = pageVC.vc[index + 1]  as? EmailViewController {
            secondViewController.index = index + 1
            secondViewController.pageVC = pageVC
            
            pageVC.setViewControllers([secondViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    @IBAction func setFirstname(_ sender: UITextField) {
        guard let firstname = sender.text else {
            return
        }
        
        UserDefaults.standard.set(firstname, forKey: "user.firstname")
        firstnameCheck.isHidden = false
    }
    
    @IBAction func setLastname(_ sender: UITextField) {
        guard let lastname = sender.text else {
            return
        }
        
        UserDefaults.standard.set(lastname, forKey: "user.lastname")
        lastnameCheck.isHidden = false
    }
}

extension NameViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    /*
    func textFieldDidEndEditing(_ textField: UITextField) {
        if !firstnameCheck.isHidden && !lastnameCheck.isHidden {
            continueMessageLabel.isHidden = false
            continueButton.isHidden = false
        }
    }
    */
}
