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

    let details: [(key: String, title: String, amount: String, remaining: String, value: String)] = [
        ("345634562","Despensa Jaime", "12", "11", "01/06/19"), ("234667234","Jaime", "111", "121", "13/06/19"), ("xxxxxxx","xxxxxxx", "xxxxxxx", "xxxxxxx", "xxxxxxx")
    ]
    
    let lendedDetails: [(key: String, title: String, amount: String, remaining: String, value: String)] = [
        ("D345634562","Ddespensa Jaime", "12112", "1121", "01/06/10"), ("D234667234","DJaime", "D111", "D121", "D13/08/18")
    ]
    
    
    @IBOutlet weak var loanID: UILabel!
    
    @IBOutlet weak var amountReq: UILabel!
    @IBOutlet weak var amountRem: UILabel!
    @IBOutlet weak var detailsTitle: UILabel!
    @IBOutlet weak var nextPayment: UILabel!
    
    
    
    @IBOutlet weak var borrowedCollectionView: UICollectionView!
    @IBOutlet weak var lendedCollectionView: UICollectionView!
    
    override func viewDidLoad()  {
        super.viewDidLoad()
    }
}


extension LoansController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
         if collectionView == borrowedCollectionView {
        loanID.text =  details[indexPath.row].key
        detailsTitle.text =  details[indexPath.row].title
        amountReq.text =  details[indexPath.row].amount
        amountRem.text =  details[indexPath.row].remaining
        nextPayment.text =  details[indexPath.row].value
         }else{
        loanID.text =  lendedDetails[indexPath.row].key
        detailsTitle.text =  lendedDetails[indexPath.row].title
        amountReq.text =  lendedDetails[indexPath.row].amount
        amountRem.text =  lendedDetails[indexPath.row].remaining
        nextPayment.text =  lendedDetails[indexPath.row].value
            
        }
    }
    
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
            borrowedCell.amountLabel.text = "$\(borrowed[indexPath.row].value)"
            
            return borrowedCell
        }
        
        let lendedCell = lendedCollectionView.dequeueReusableCell(withReuseIdentifier: "lendedCell", for: indexPath) as! LoanCollectionViewCell
        
        lendedCell.loanNameLabel.text = lended[indexPath.row].key
        lendedCell.amountLabel.text = "$\(lended[indexPath.row].value)"
        
        return lendedCell
    }
    
    
}

