//
//  Card.swift
//  MoneyTogether
//
//  Created by Osmar Hernández on 25/04/19.
//  Copyright © 2019 pastdue. All rights reserved.
//

import Foundation

class Card: NSObject {
    
    enum CardType: String {
        case debit
        case credit
    }
    
    enum CardBrand: String {
        case visa
        case mastercard
    }
    
    public let number: String
    private let expirationDate: (String, String)
    private var name: String?
    private let owner: String
    private let type: CardType
    
    
    
    init(number: String, expirationDate: (String, String), owner: String, type: CardType, name: String?) {
        self.number = number
        self.expirationDate = expirationDate
        self.name = name
        self.owner = owner
        self.type = type
    }
    
    public let id = UUID.init().uuidString
    
    private var getExpirationDate: String {
        let (month, year) = expirationDate
        return "\(month)/\(year)"
    }
    
    public var ownerId: String?
}

extension Card: DatabaseRepresentation {
    
    public var representation: [String : Any] {
        let rep: [String : Any] = [
            "owner" : ownerId ?? "",
            "number" : number,
            "expirationDate" : getExpirationDate,
            "name" : name ?? "\(type.rawValue.uppercased())",
            "type" : type.rawValue,
        ]
        
        return rep
    }
}
