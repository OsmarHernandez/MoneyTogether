//
//  PaymentsViewController.swift
//  MoneyTogether
//
//  Created by Osmar Hernández on 04/05/19.
//  Copyright © 2019 pastdue. All rights reserved.
//

import UIKit

class PaymentsViewController: UIViewController {
    
    let payments: [Payment] = [
        Payment(loanId: UUID.init().uuidString, title: "Pa las putas Martes: ", payTo: "Osmar Hernández", paymentAmount: 4_500.00, payDate: "15-04-2019"),
        Payment(loanId: UUID.init().uuidString, title: "Pa las putas Viernes", payTo: "Osmar Hernández", paymentAmount: 720.00, payDate: "17-05-2019"),
        Payment(loanId: UUID.init().uuidString, title: "Pa las putas Sabado", payTo: "Osmar Hernández", paymentAmount: 1_200.00, payDate: "02-05-2019"),
        Payment(loanId: UUID.init().uuidString, title: "Pa las putas Miercoles", payTo: "Osmar Hernández", paymentAmount: 2_130.00, payDate: "24-06-2019")
    ]
    
    @IBOutlet weak var conceptLabel: UILabel!
    @IBOutlet weak var toWhomLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .currency
        
        return nf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
    }
    
    func initialSetup() {
        let payment = payments[0]
        
        conceptLabel.text = payment.title
        toWhomLabel.text = payment.payTo
        dateLabel.text = payment.payDate
        amountLabel.text = numberFormatter.string(from: NSNumber(value: payment.paymentAmount))
    }
}

extension PaymentsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return payments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let paymentCell = tableView.dequeueReusableCell(withIdentifier: "paymentCell", for: indexPath) as! PaymentCell
        
        paymentCell.titleLabel.text = payments[indexPath.row].title
        paymentCell.dateLabel.text = payments[indexPath.row].payDate
        
        return paymentCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let payment = payments[indexPath.row]
        
        /*let paymentCell = tableView.dequeueReusableCell(withIdentifier: "paymentCell", for: indexPath) as! PaymentCell
        paymentCell.titleLabel.textColor = UIColor.red
         paymentCell.titleLabel.text = payments[indexPath.row].title*/
        
        conceptLabel.text = payment.title
        toWhomLabel.text = payment.payTo
        dateLabel.text = payment.payDate
        amountLabel.text = numberFormatter.string(from: NSNumber(value: payment.paymentAmount))
    }
    
    /*func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        let paymentCell = tableView.dequeueReusableCell(withIdentifier: "paymentCell", for: indexPath) as! PaymentCell
        paymentCell.titleLabel.textColor = UIColor.black
        paymentCell.titleLabel.text = payments[indexPath.row].title
    }*/
}
