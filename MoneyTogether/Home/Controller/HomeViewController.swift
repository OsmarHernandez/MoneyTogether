//
//  HomeViewController.swift
//  MoneyTogether
//
//  Created by Osmar Hernández on 04/05/19.
//  Copyright © 2019 pastdue. All rights reserved.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    let uid = Auth.auth().currentUser?.uid
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(uid ?? "?")
    }
}

// TODO: Delete hardcoded code
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cardCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath)
        
        return cardCell
    }
}
