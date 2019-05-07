//
//  paymentCell.swift
//  MoneyTogether
//
//  Created by Jaime Solís on 5/5/19.
//  Copyright © 2019 pastdue. All rights reserved.
//

import UIKit

class PaymentCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
