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
    public var paymentAmount : Double
    public var payDate : String
    
//Agregar un nuevo payment
    
    init(loanId: String, paymentAmount: Double, payDate: String){

        self.loanId = loanId
        self.paymentAmount = paymentAmount
        self.payDate = payDate
    }
    
}



    
    extension Payment: DatabaseRepresentation {
        public var representation: [String : Any]{
            let rep: [String : Any] = [
                "PaymentID": paymentId,
                "loandId": loanId,
                "paymentAmount": paymentAmount,
                "payDate": payDate
            ]
            
            return rep
        }
    }

