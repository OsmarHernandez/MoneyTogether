//
//  AddCardViewController.swift
//  MoneyTogether
//
//  Created by Antonio Spinola Flores on 5/4/19.
//  Copyright © 2019 pastdue. All rights reserved.
//

import UIKit

class AddCardViewController: UIViewController {

    
    @IBOutlet weak var cardNumberTextField: UITextField!
    
    
    var cardType: String! {
        didSet {
            if cardType.hasPrefix("5"){
                print("MASTER CARD")
            }else if cardType.hasPrefix("4"){
                print("VISA")
            }
        }
    }
    
    @IBAction func cardNumberTextField(_ sender: UITextField) {
        cardType = sender.text!
    }
    
    

    @IBAction func AddCardButton(_ sender: Any) {
        print("addCard")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.cardNumberTextField.becomeFirstResponder()
     
    }
    
    func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.cardNumberTextField.resignFirstResponder()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
