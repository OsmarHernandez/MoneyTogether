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
        guard let email = sender.text, email.match(Patterns.email.rawValue) else {
            return
        }
        
        UserDefaults.standard.set(email, forKey: "user.email")
        emailCheck.isHidden = false
    }
}
