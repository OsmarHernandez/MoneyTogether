//
//  Payment.swift
//  MoneyTogether
//
//  Created by Antonio Spinola Flores on 4/27/19.
//  Copyright © 2019 pastdue. All rights reserved.
//

import Foundation

class Payment: NSObject {

    public enum PaymentPlan: Float {
        case weekly = 4.0
        case biweekly = 2.0
        case monthly = 1.0
        
        func toInt() -> Int {
            return Int(self.rawValue)
        }
    }
    
    public enum PaymentTerm: Float {
        case oneYear = 12.0
        case twoYear = 24.0
        case threeYear = 36.0
        
        func toInt() -> Int {
            return Int(self.rawValue)
        }
    }
    

    public var startDate: Date
    public var endDate: Date
    
    public var paymentTerm: PaymentTerm
    
    public var paymentPlan: PaymentPlan
    public var paymentDates: (Float, Date)!
    

    
    //INICIAR UN NUEVO PRESTAMO
    init(startDate: Date ,endDate: Date, paymentPlan: PaymentPlan, paymentTerm: PaymentTerm, amountRequested: Float) {
        
        self.endDate = endDate
        self.paymentTerm = paymentTerm
        self.paymentPlan = paymentPlan
        self.startDate = startDate
        
        var dateComponent = DateComponents()
        
        let amountRequested = amountRequested / paymentTerm.rawValue
        
        switch paymentPlan {
        
        //One payment each month
        case .monthly:
            //Calculate amount of each payment
            var eachPayment = (amountRequested) / (paymentPlan.rawValue)
            eachPayment = eachPayment*1.05
            //We assume that there will be one payment each month
            dateComponent.month = 1
            var holderDate = startDate

            for _ in 0..<paymentPlan.toInt() {
                
                //Calculate Dates of payment
                let nextPayment = Calendar.current.date(byAdding: dateComponent, to: holderDate )!
                holderDate = nextPayment
 

                self.paymentDates = (eachPayment,nextPayment)
            }
        
        //Payment each 15 days
        case .biweekly:
            //Calculate amount of each payment
            let eachPayment = (amountRequested) / paymentPlan.rawValue
            
            //We assume that there will be one payment each month
            dateComponent.day = 15
            var holderDate = startDate
            
            for _ in 0..<paymentPlan.toInt() {
                
                //Calculate Dates of payment
                let nextPayment = Calendar.current.date(byAdding: dateComponent, to: holderDate )!
                holderDate = nextPayment
                
                self.paymentDates = (eachPayment,nextPayment)
            }
            
        //Weekly payment
            case .weekly:
                //Calculate amount of each payment
                let eachPayment = (amountRequested) / paymentPlan.rawValue
                
                //We assume that there will be one payment each month
                dateComponent.day = 7
                var holderDate = startDate
                
                for _ in 0..<paymentPlan.toInt() {
                    
                    //Calculate Dates of payment
                    let nextPayment = Calendar.current.date(byAdding: dateComponent, to: holderDate )!
                    holderDate = nextPayment
                    
                    self.paymentDates = (eachPayment,nextPayment)
            }
        }
                
    }
    
}
extension Payment: DatabaseRepresentation {
    
    public var representation: [String : Any] {
        let rep: [String : Any] = [
            "endDate" : endDate,
            "paymentPlan" : paymentPlan,
            "paymentDates" : paymentDates,
            "startDate" : startDate
        ]
        
        return rep
    }
}

