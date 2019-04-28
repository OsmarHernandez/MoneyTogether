//
//  SignInPageViewController.swift
//  MoneyTogether
//
//  Created by Osmar Hernández on 27/04/19.
//  Copyright © 2019 pastdue. All rights reserved.
//

import UIKit

class SignInPageViewController: UIPageViewController {

    // Constants representing each view controller identifier
    private let NAME_VC = "NameViewController"
    private let EMAIL_VC = "EmailViewController"
    private let PASSWD_VC = "PasswdViewController"
    private let BIRTHDAY_VC = "BirthdayViewController"
    
    // Array of viewcontroller for the curren page view controller
    public lazy var vc: [UIViewController] = {
        let vc = [
            createNewViewController(self.NAME_VC),
            createNewViewController(self.EMAIL_VC),
            createNewViewController(self.PASSWD_VC),
            createNewViewController(self.BIRTHDAY_VC)
        ]
        
        return vc
    }()
    
    
    
    /**
     * Create New View Controller
     *
     * para
     * return
     */
    private func createNewViewController(_ viewController: String) -> UIViewController {
        return UIStoryboard.init(name: "OnBoarding", bundle: nil).instantiateViewController(withIdentifier: viewController)
    }
}
