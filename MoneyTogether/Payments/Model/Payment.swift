//
//  Payment.swift
//  MoneyTogether
//
//  Created by Antonio Spinola Flores on 4/27/19.
//  Copyright © 2019 pastdue. All rights reserved.
//

import Foundation

class Payment: NSObject {
    
    public let paymentId = UUID.init().uuidString
    public var loanId : String
    public var title: String
    public var payTo: String
    public var paymentAmount : Double
    public var payDate : String
    
//Agregar un nuevo payment
    
    init(loanId: String, title: String, payTo: String, paymentAmount: Double, payDate: String){
        
        self.loanId = loanId
        self.title = title
        self.payTo = payTo
        self.paymentAmount = paymentAmount
        self.payDate = payDate
    }
    
}
    
    extension Payment: DatabaseRepresentation {
        public var representation: [String : Any]{
            let rep: [String : Any] = [
                "PaymentID": paymentId,
                "loandId": loanId,
                "title" : title,
                "payTo": payTo,
                "paymentAmount": paymentAmount,
                "payDate": payDate
            ]
            
            return rep
        }
    }

