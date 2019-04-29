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
    public lazy var vc: [UIViewController] = [
        createNewViewController(self.NAME_VC),
        createNewViewController(self.EMAIL_VC),
        createNewViewController(self.BIRTHDAY_VC),
        createNewViewController(self.PASSWD_VC)
    ]
    
    /**
     * Custom setup
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        if let firstViewController = vc.first as? NameViewController {
            firstViewController.index = vc.index(of: firstViewController)
            firstViewController.pageVC = self
            
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
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

extension SignInPageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = vc.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = index - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard vc.count > index else {
            return nil
        }
        
        return vc[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = vc.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = index + 1
        
        guard vc.count != nextIndex else {
            return nil
        }
        
        guard vc.count > nextIndex else {
            return nil
        }
        
        return vc[nextIndex]
    }
}
