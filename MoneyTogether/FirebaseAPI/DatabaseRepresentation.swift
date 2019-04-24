//
//  DatabaseRepresentation.swift
//  MoneyTogether
//
//  Created by Osmar Hernández on 24/04/19.
//  Copyright © 2019 pastdue. All rights reserved.
//

import Foundation

protocol DatabaseRepresentation {
    var representation: [String : Any] { get }
}
