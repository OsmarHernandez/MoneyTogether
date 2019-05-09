//
//  EmailViewController.swift
//  MoneyTogether
//
//  Created by Osmar Hernández on 29/04/19.
//  Copyright © 2019 pastdue. All rights reserved.
//

import UIKit

class EmailViewController: UIViewController {
    
    var pageVC: SignInPageViewController!
    var index: Int!
    
    @IBOutlet weak var emailCheck: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    
    var email: String!
    
    @IBAction func goToPreviousPage(_ sender: UIButton) {
        pageVC.setViewControllers([pageVC.vc.first!], direction: .reverse, animated: true, completion: nil)
    }
    
    @IBAction func goToNextPage(_ sender: UIButton) {
        if let thirdViewController = pageVC.vc[index + 1]  as? BirthdayViewController {
            thirdViewController.index = index + 1
            thirdViewController.pageVC = pageVC
            
            pageVC.setViewControllers([thirdViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    @IBAction func setEmail(_ sender: UITextField) {
        guard let text = sender.text, text.match(Patterns.email.rawValue) else {
            return
        }
        
        email = text
        
        UserDefaults.standard.set(text, forKey: "user.email")
        emailCheck.isHidden = false
    }
}

extension EmailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if email != nil {
            continueButton.isHidden = false
        }
    }
}
