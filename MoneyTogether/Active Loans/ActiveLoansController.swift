//
//  ActiveLoansController.swift
//  MoneyTogether
//
//  Created by Antonio Spinola Flores on 4/24/19.
//  Copyright © 2019 pastdue. All rights reserved.
//

import UIKit
//import Firebase
//
//
//var ref: DatabaseReference!
//
//ref = Database.database().reference()

class ActiveLoansController: UIViewController {
    let items = ["Primero","Carro","Hipoteca"]
    
    let its = ["400","234","345"]
}

extension ActiveLoansController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // Esta cuenta tambien tiene que salir de FireBase
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let activeLoansCell = collectionView.dequeueReusableCell(withReuseIdentifier: "activeLoansCell", for: indexPath) as! CollectionViewCellActiveLoans
        
        
        
        
        // Esta inforamcion va a ser recuperada de FireBase
        activeLoansCell.loanNameLabel.text = items[indexPath.row]
        activeLoansCell.amountLabel.text = "$\(its[indexPath.row])"
        
        
        return activeLoansCell
    }
    
    
}

