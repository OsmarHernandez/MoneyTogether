//
//  Loan.swift
//  MoneyTogether
//
//  Created by Antonio Spinola Flores on 4/26/19.
//  Copyright © 2019 pastdue. All rights reserved.
//

import Foundation

class Loan: NSObject {
    
    
    public let loanId = UUID.init().uuidString
    
    public var concept: String
    public var amount: Float
    public var remainToPay: Float
    public var paymentTerm:String
    public var paymentPlan: String
    public var start: String
    public var lenderId: String
    public var lenderCard: String
    public var borrowerId: String
    public var borrowerCard: String
    
    
    //INICIAR UN NUEVO PRESTAMO
    init(concept: String, amount: Float, remainToPay: Float, paymentTerm:String , paymentPlan: String, start: String, lenderId: String, lenderCard: String,  borrowerId: String, borrowerCard: String ) {
        
        self.concept = concept
        self.amount = amount
        self.remainToPay = remainToPay
        self.paymentTerm = paymentTerm
        self.paymentPlan = paymentPlan
        self.start = start
        self.lenderId = lenderId
        self.lenderCard = lenderCard
        self.borrowerId = borrowerId
        self.borrowerCard = borrowerCard

    }
    
}
extension Loan: DatabaseRepresentation {
    
    public var representation: [String : Any] {
        let rep: [String : Any] = [
            "concept": concept,
            "amount" : amount,
            "remainToPay" : remainToPay,
            "paymentTerm" : paymentTerm,
            "paymentPlan" : paymentPlan ,
            "start": start,
            "lenderId" : lenderId,
            "lenderCard" : lenderCard,
            "borrowerId" : borrowerId ,
            "borrowerCard": borrowerCard
        ]
        
        return rep
    }
}

