//
//  NetworkProcess.swift
//  MoneyTogether
//
//  Created by Antonio Spinola Flores on 5/5/19.
//  Copyright © 2019 pastdue. All rights reserved.
//

import Foundation



class NetworkPorcess{
    
    
    lazy var config: URLSessionConfiguration = URLSessionConfiguration.default
    lazy var session: URLSession = URLSession(configuration: self.config)
    
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    typealias JASONDictionaryHandeler = (([String: Any]?) -> Void)
    
    // _ completion: @escaping JASONDictionaryHandeler
    
    func downloadJASONfromURL(_ completion: @escaping (_ success: Bool) -> Void){
        
        let request = URLRequest(url: self.url)
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            
            if error == nil{
                if let httpResponse = response as? HTTPURLResponse{
                    switch httpResponse.statusCode{
                    case 200:
                        //successful response
                        if let data = data{
                            print(data)
                            do {
                                let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [[String : Any]]
                                
                                print(jsonDictionary)
                                
                                for element in jsonDictionary {
                                    print(element["number"]!)
                                    print(element["owner"]!)
                                    
                                }
                                
                                
                            } catch let error as NSError {
                                print("Error in JSON \(error)")
                            }
                            completion(true)
                        }
                        
                    default:
                        print("HTTPresponse \(httpResponse.statusCode)")
                    }
                }
            } else {
                print("error: \(error?.localizedDescription ?? "Some Error")")
            }
        }
        dataTask.resume()
    }
    
}
