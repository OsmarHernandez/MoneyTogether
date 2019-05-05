//
//  CardsViewController.swift
//  MoneyTogether
//
//  Created by Osmar Hernández on 04/05/19.
//  Copyright © 2019 pastdue. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController{
    
    
    let details: [(number: String, date: String, name: String, provider: String)] = [
        ("345634562","Despensa", "Jaime Solis","VISA"), ("234667234","Jaime", "Osmar Hernandez","VISA"), ("xxxxxxx","xxxxxxx", "Antonio Spinola","VISA")
    ]
    
    @IBOutlet weak var cardCollectionView: UICollectionView!
  
    
    @IBOutlet weak var del: UIButton!
    
    
    @IBAction func deleteCardButton(_ sender: Any) {
        print("Delete")
    }
    
    
    
    override func viewDidLoad()  {
        super.viewDidLoad()
        
        del.isEnabled=false
    }
}

extension CardsViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Aqui se va a obtener el id del objeto Card
        del.isEnabled = true
        print(indexPath)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return details.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cardCell = cardCollectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath) as! CardsCollectionViewCell
        
        cardCell.titleLabel.text = details[indexPath.row].number
        cardCell.dateLabel.text = details[indexPath.row].date
        cardCell.nameLabel.text = details[indexPath.row].name
        cardCell.providerLabel.text = details[indexPath.row].provider
        
        return cardCell

}
}
