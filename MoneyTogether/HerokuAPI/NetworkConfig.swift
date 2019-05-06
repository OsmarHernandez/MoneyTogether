//
//  NetworkConfig.swift
//  MoneyTogether
//
//  Created by Antonio Spinola Flores on 5/5/19.
//  Copyright © 2019 pastdue. All rights reserved.
//
import UIKit
import Foundation

class NetworkConfig {
    
    
    
    func prepare() {
        
        let url = URL(string: "https://money-together.herokuapp.com/api/v1/cards")!
        
        let net = NetworkPorcess(url: url)
        
        net.downloadJASONfromURL { (jsonDictionary) in
            print(jsonDictionary)
        }
    }
}
