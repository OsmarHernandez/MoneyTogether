//
//  LoansCollectionViewController.swift
//  MoneyTogether
//
//  Created by Antonio Spinola Flores on 5/3/19.
//  Copyright © 2019 pastdue. All rights reserved.
//

import UIKit

final class LoansCollectionViewController: UICollectionViewController {
    // MARK: - Properties
    private let reuseIdentifier = "LoansCell"
    
    // number of cards
    let numCards = 3
    
}
// MARK: - UICollectionViewDataSource
extension LoansCollectionViewController {
    //1 one section
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //2 number of cards
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return numCards
    }
    
    //3
    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
        ) -> UICollectionViewCell {
        let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cell.backgroundColor = .black
        // Configure the cell
        return cell
    }
}

