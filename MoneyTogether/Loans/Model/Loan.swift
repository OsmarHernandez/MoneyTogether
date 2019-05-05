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
    
    public var requestedBy: String
    public var loanedBy: String
    public var title: String
    public var amountRequested: Float
    public var amountRemaining: Float
    let pay: Payment
    
    //INICIAR UN NUEVO PRESTAMO
    init(requestedBy: String, loanedBy: String, title: String, amountRequested: Float,amountRemaining: Float ,loanId : UUID, pay:Payment ) {
        
        self.requestedBy = requestedBy
        self.loanedBy = loanedBy
        self.title = title
        self.amountRequested = amountRequested
        self.amountRemaining = amountRemaining
        
        self.pay = pay
    }
    
}
extension Loan: DatabaseRepresentation {
    
    public var representation: [String : Any] {
        let rep: [String : Any] = [
            "LoanID": loanId,
            "requestedBy" : requestedBy,
            "loanedBy" : loanedBy,
            "title" : title,
            "amountRequested" : amountRequested ,
            "amountRemaining": amountRemaining,
            "payObject": pay.representation
        ]
        
        return rep
    }
}

