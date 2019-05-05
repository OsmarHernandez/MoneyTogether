//
//  LoansViewController.swift
//  MoneyTogether
//
//  Created by Antonio Spinola Flores on 5/3/19.
//  Copyright © 2019 pastdue. All rights reserved.
//

import UIKit


class LoansViewController: UIViewController {

    @IBOutlet weak var LoansCollectionView: UICollectionView!
    // Create an array that contains our data
    var array = ["First Cell", "Second Cell", "Third Cell", "Fourth Cell", "Fifth Cell"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoansCollectionView.dataSource = self as? UICollectionViewDataSource
        LoansCollectionView.delegate = self as? UICollectionViewDelegate
    }
    
    func CollectionViewCell(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    func CollectionViewCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LoansCell", for: indexPath) as! CollectionViewCell
        cell.titleLabel.text = array[indexPath.row]
        return cell
    }
    
}
