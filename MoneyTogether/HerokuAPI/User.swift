//
//  User.swift
//  MoneyTogether
//
//  Created by Antonio Spinola Flores on 5/6/19.
//  Copyright © 2019 pastdue. All rights reserved.
//

import Foundation


//id    "BString id"
//firstname    "BString firstname"
//lastname    "BString lastname"
//email    "BString email"
//password    "BString password"
//birthDate    "BString birthDate"

class User: NSObject {
    
    
    public let userId = UUID.init().uuidString
    
    public var firstname: String
    public var lastname:String
    public var email: String
    public var password: String
    public var birthDate: String

    
    //INICIAR UN NUEVO PRESTAMO
    init(firstname: String, lastname: Float, email: String, password:String , birthDate: String) {
        
        self.firstname = firstname
        self.lastname = amount
        self.email = email
        self.password = password
        self.birthDate = birthDate
        
        
    }
    
}
extension User: DatabaseRepresentation {
    
    public var representation: [String : Any] {
        let rep: [String : Any] = [
            "firstname": firstname,
            "lastname" : lastname,
            "email" : email,
            "password" : password,
            "birthDate" : birthDate
            
        ]
        
        return rep
    }
}

