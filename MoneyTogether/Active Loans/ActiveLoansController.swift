//
//  ActiveLoansController.swift
//  MoneyTogether
//
//  Created by Antonio Spinola Flores on 4/24/19.
//  Copyright © 2019 pastdue. All rights reserved.
//
import Foundation
import FirebaseAuth
import UIKit

class ActiveLoansController: UIViewController {
   
 
    override func viewDidLoad()  {
        super.viewDidLoad()
    }
}

extension ActiveLoansController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // Esta cuenta tambien tiene que salir de FireBase
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let activeLoansCell = collectionView.dequeueReusableCell(withReuseIdentifier: "activeLoansCell", for: indexPath) as! CollectionViewCellActiveLoans
        
        
        //obtener el titulo del prestamo
        DatabaseReference.reference.child("Loans").child("LoanID").observeSingleEvent(of: .value, with: { (snapshot) in
            
            let myLoans = (DatabaseReference.reference.child("Loans").queryEqual(toValue: ""))

            
            DispatchQueue.global(qos: .userInitiated).async {
                // Get user value
                let value = snapshot.value as? NSDictionary
                let title = value?["title"] as? String ?? ""
                
                //self.loanTitles.append(user)
                
                //Get remaining amounts
                let remaining = value?["remainingAmount"] as? Int ?? 1
                
                DispatchQueue.main.async {
                    activeLoansCell.loanNameLabel.text = title
                    activeLoansCell.amountLabel.text = "\(remaining)"
                    
                }
                
                //self.amountsRemaining.append(u)
            }
        })
        
        return activeLoansCell
    }
    
    
}

