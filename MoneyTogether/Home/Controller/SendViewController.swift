//
//  SendViewController.swift
//  MoneyTogether
//
//  Created by Osmar Hernández on 05/05/19.
//  Copyright © 2019 pastdue. All rights reserved.
//

import UIKit

class SendViewController: UIViewController {

    @IBOutlet weak var requestCollectionView: UICollectionView!
    @IBOutlet weak var cardCollectionView: UICollectionView!
    
    @IBOutlet weak var amountTextField: UITextField!
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .currency
        
        return nf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        amountTextField.addDoneButtonOnKeyboard()
    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

// TODO: Change hardcoded code
extension SendViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let requestCell = tableView.dequeueReusableCell(withIdentifier: "requestCell", for: indexPath)
        
        return requestCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135
    }
}

extension SendViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == requestCollectionView {
            let requestCell = requestCollectionView.dequeueReusableCell(withReuseIdentifier: "requestCell", for: indexPath)
            
            return requestCell
        }
        
        let cardCell = cardCollectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath)
        
        return cardCell
    }
}

extension SendViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text, let number = Double(text) {
            if let value = numberFormatter.string(from: NSNumber(value: number)) {
                textField.text = value
            }
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let countDots = textField.text!.components(separatedBy: ".").count - 1
        
        return countDots > 0 && string == "." ? false : true
    }
}
