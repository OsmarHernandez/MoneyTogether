//
//  demoViewController.swift
//  MoneyTogether
//
//  Created by Antonio Spinola Flores on 5/5/19.
//  Copyright © 2019 pastdue. All rights reserved.
//

import UIKit

class demoViewController: UIViewController {
    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    
    @IBOutlet weak var loansTitle: UILabel!
    @IBOutlet weak var loansNumber: UILabel!
    
    
    
    // Property observer
    var cards: [Card]? {
        didSet {
            print("We have some value")
            print("We have \(self.cards?.count ?? 0)")
            titlelabel.text = "Hay cards en el arreglo"
            numberLabel.text = "Cantidad: \(self.cards?.count ?? 0)"
        }
    }
    
    var loans: [Loan]? {
        didSet {
            print("We have some loans")
            print("We have \(self.loans?.count ?? 0)")
            loansTitle.text = "Hay loans en el arreglo"
            loansNumber.text = "Cantidad: \(self.loans?.count ?? 0)"
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        CardsService.cards {
            (response) in
            
            self.cards = response
        }
        
        LoansService.loans {
            (response) in
            
            self.loans = response
        }
        
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
