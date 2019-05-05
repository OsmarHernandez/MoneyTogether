//
//  ActiveLoansController.swift
//  MoneyTogether
//
//  Created by Antonio Spinola Flores on 4/24/19.
//  Copyright © 2019 pastdue. All rights reserved.
//
import Foundation
import UIKit

class LoansController: UIViewController {
 
    let borrowed: [(key: String, value: Double)] = [
        ("Colegiatura", 22_500.00),
        ("Pago Agua", 350.00),
        ("Pago Gas", 220.00)
    ]
    
    let lended: [(key: String, value: Double)] = [
        ("Despensa Jaime", 1_400.00),
        ("Rosas Regina", 790.00)
    ]

    let details: [(key: String, title: String, amount: Double, remaining: Double, value: String)] = [
        ("345634562","Despensa Jaime", 1_300.00, 4_210.00, "01-06-2019"),
        ("234667234","Jaime", 5_200.00, 6_210.00, "13-06-2019"),
        ("432402401","Osmar", 5_200.00, 6_210.00, "12-04-2019")
    ]
    
    let lendedDetails: [(key: String, title: String, amount: Double, remaining: Double, value: String)] = [
        ("D345634562","Despensa Jaime", 1_210.00, 980.00, "01-06-2019"),
        ("D234667234","Jaime", 790.00, 3_230.00, "13-08-2019")
    ]
    
    @IBOutlet weak var loanID: UILabel!
    
    @IBOutlet weak var amountReq: UILabel!
    @IBOutlet weak var amountRem: UILabel!
    @IBOutlet weak var detailsTitle: UILabel!
    @IBOutlet weak var nextPayment: UILabel!
    
    @IBOutlet weak var borrowedCollectionView: UICollectionView!
    @IBOutlet weak var lendedCollectionView: UICollectionView!
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .currency
        
        return nf
    }()
    
    override func viewDidLoad()  {
        super.viewDidLoad()
        
        initialSetup()
    }
    
    func initialSetup() {
        let loan = details[0]
        
        loanID.text =  loan.key
        detailsTitle.text =  loan.title
        amountReq.text =  numberFormatter.string(from: NSNumber(value: loan.amount))
        amountRem.text =  numberFormatter.string(from: NSNumber(value: loan.remaining))
        nextPayment.text =  loan.value
    }
}


extension LoansController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == borrowedCollectionView {
            return borrowed.count
        }
        
        return lended.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == borrowedCollectionView {
            let borrowedCell = borrowedCollectionView.dequeueReusableCell(withReuseIdentifier: "borrowedCell", for: indexPath) as! LoanCollectionViewCell
            
            borrowedCell.loanNameLabel.text = borrowed[indexPath.row].key
            borrowedCell.amountLabel.text = numberFormatter.string(from: NSNumber(value: borrowed[indexPath.row].value))
            
            return borrowedCell
        }
        
        let lendedCell = lendedCollectionView.dequeueReusableCell(withReuseIdentifier: "lendedCell", for: indexPath) as! LoanCollectionViewCell
        
        lendedCell.loanNameLabel.text = lended[indexPath.row].key
        lendedCell.amountLabel.text = numberFormatter.string(from: NSNumber(value: lended[indexPath.row].value))
        
        return lendedCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let loan = collectionView == borrowedCollectionView ? details[indexPath.row] : lendedDetails[indexPath.row]
        
        loanID.text =  loan.key
        detailsTitle.text =  loan.title
        amountReq.text =  numberFormatter.string(from: NSNumber(value: loan.amount))
        amountRem.text =  numberFormatter.string(from: NSNumber(value: loan.remaining))
        nextPayment.text =  loan.value
    }
}

