//
//  DatabaseReference.swift
//  MoneyTogether
//
//  Created by Osmar Hernández on 24/04/19.
//  Copyright © 2019 pastdue. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct DatabaseReference {
    
    public static let reference = Database.database().reference()
}
