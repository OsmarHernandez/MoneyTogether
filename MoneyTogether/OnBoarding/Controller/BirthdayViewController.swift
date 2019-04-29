//
//  BirthdayViewController.swift
//  MoneyTogether
//
//  Created by Osmar Hernández on 29/04/19.
//  Copyright © 2019 pastdue. All rights reserved.
//

import UIKit

class BirthdayViewController: UIViewController {
    
    var pageVC: SignInPageViewController!
    var index: Int!
    
    @IBOutlet weak var birthdateCheck: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    
    @IBAction func goToPreviousPage(_ sender: UIButton) {
        pageVC.setViewControllers([pageVC.vc[index - 1]], direction: .reverse, animated: true, completion: nil)
    }
    
    @IBAction func goToNextPage(_ sender: UIButton) {
        if let fourthViewController = pageVC.vc[index + 1]  as? PasswordViewController {
            fourthViewController.index = index + 1
            fourthViewController.pageVC = pageVC
            
            pageVC.setViewControllers([fourthViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    @IBAction func setBirthdate(_ sender: UIDatePicker) {
    }
}
