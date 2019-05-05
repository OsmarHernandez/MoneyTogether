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
    
    @IBOutlet weak var borrowedCollectionView: UICollectionView!
    @IBOutlet weak var lendedCollectionView: UICollectionView!
    
    override func viewDidLoad()  {
        super.viewDidLoad()
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
            borrowedCell.amountLabel.text = "$\(borrowed[indexPath.row].value)"
            
            return borrowedCell
        }
        
        let lendedCell = lendedCollectionView.dequeueReusableCell(withReuseIdentifier: "lendedCell", for: indexPath) as! LoanCollectionViewCell
        
        lendedCell.loanNameLabel.text = lended[indexPath.row].key
        lendedCell.amountLabel.text = "$\(lended[indexPath.row].value)"
        
        return lendedCell
    }
    
    
}

