//
//  User.swift
//  MoneyTogether
//
//  Created by Osmar Hernández on 27/03/19.
//  Copyright © 2019 pastdue. All rights reserved.
//

import UIKit

class User: NSObject {
    private var firstname: String
    private var lastname: String
    private var email: String
    private var password: String
    public let uid = UUID.init()
    
    init(firstname: String, lastname: String, email: String, password: String) {
        self.firstname = firstname
        self.lastname = lastname
        self.email = email
        self.password = password
    }
    
    var getName: String {
        return "\(self.firstname) \(self.lastname)"
    }
}
