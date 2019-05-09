//
//  Constants.swift
//  MoneyTogether
//
//  Created by Osmar Hernández on 06/05/19.
//  Copyright © 2019 pastdue. All rights reserved.
//

import Foundation

struct Constants {
    static let userDefaults = {
        (key: String) in
        
        return UserDefaults.standard.string(forKey: key)
    }
}
