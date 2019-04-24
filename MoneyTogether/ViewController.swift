//
//  ViewController.swift
//  MoneyTogether
//
//  Created by Osmar Hernández on 27/03/19.
//  Copyright © 2019 pastdue. All rights reserved.
//

import UIKit

import FirebaseAuth

class ViewController: UIViewController {

    
    @IBAction func testButton(_ sender: UIButton) {
        if let uid = Auth.auth().currentUser?.uid {
            print(uid)
        }
    }
}

