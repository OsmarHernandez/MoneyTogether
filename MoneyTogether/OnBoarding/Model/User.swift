//
//  User.swift
//  MoneyTogether
//
//  Created by Osmar Hernández on 27/03/19.
//  Copyright © 2019 pastdue. All rights reserved.
//

import Foundation

// TODO: Add imageURL

class User: NSObject {
    
    private var firstname: String
    private var lastname: String
    private var email: String
    private var password: String
    public var uid: String? = nil
    
    init(firstname: String, lastname: String, email: String, password: String) {
        self.firstname = firstname
        self.lastname = lastname
        self.email = email
        self.password = password
    }
    
    public var getName: String {
        return "\(self.firstname) \(self.lastname)"
    }
    
    public var getEmail: String {
        return self.email
    }
}

extension User: DatabaseRepresentation {
    
    public var representation: [String : Any] {
        let rep: [String : Any] = [
            "firstname" : firstname,
            "lastname" : lastname,
            "email" : email
        ]
        
        return rep
    }
}
