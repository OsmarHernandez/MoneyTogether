//
//  NewLoanViewController.swift
//  MoneyTogether
//
//  Created by Osmar Hernández on 06/05/19.
//  Copyright © 2019 pastdue. All rights reserved.
//

import UIKit

class NewLoanViewController: UIViewController {

    
    @IBOutlet weak var lendedTableView: UITableView!
    @IBOutlet weak var requestedTableView: UITableView!
    
    
    @IBAction func paymentButton(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Home", bundle: nil)
        let sendMoneyVC = storyBoard.instantiateViewController(withIdentifier: "sendMoneyVC") as? SendViewController
        performSegue(withIdentifier: "showSendMoneySegue", sender: sender)
    }
}

extension NewLoanViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == lendedTableView {
            return 4
        }
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == lendedTableView {
            let lendedCell = lendedTableView.dequeueReusableCell(withIdentifier: "lendedCell", for: indexPath)
            
            return lendedCell
        }
        
        let requestedCell = requestedTableView.dequeueReusableCell(withIdentifier: "requestedCell", for: indexPath)
        
        return requestedCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135
    }
}
