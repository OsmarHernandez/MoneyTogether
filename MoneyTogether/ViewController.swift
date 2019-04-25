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
    
    @IBAction func addCardButton(_ sender: UIButton) {
        let number = "5579 2461 0921 6732"
        let expirationDate = ("02", "21")
        let type = Card.CardType.debit
        
        let card = Card(number: number, expirationDate: expirationDate, type: type, name: nil)
        
        CardManager.add(new: card)
    }
}

