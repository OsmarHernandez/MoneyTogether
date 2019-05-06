//
//  LoansService.swift
//  MoneyTogether
//
//  Created by Antonio Spinola Flores on 5/6/19.
//  Copyright © 2019 pastdue. All rights reserved.
//

import Foundation

class LoansService{
    
    let loansBaseURL: URL?
    
    init(service: APIServices) {
        loansBaseURL = URL(string: "https://money-together.herokuapp.com/api/v1/\(service)")
    }
    
    static let loansService = LoansService(service: .loans)
    
    /**
     * Se hace una llamada al URL (API)
     * Si no existe un error se procesa el valor traido del endpoint
     *  Se llama a una funcion externa para procesar la informacion y conseguir un arreglo de tarjetas
     *  Si el arreglo de tarjetas no es nulo se sobreescribe el arreglo actual
     *  Se manda al "thread main" el arreglo con las tarjetas del endpoint
     */
    static func loans(_ completion: @escaping (_ loans: [Loan]?) -> Void) {
        var loans: [Loan] = []
        
        let task = URLSession.shared.dataTask(with: loansService.loansBaseURL!) {
            (data, response, error) in
            
            if error == nil {
                if let data = data {
                    if let currentLoans = getLoans(data) {
                        loans = currentLoans
                        
                        OperationQueue.main.addOperation {
                            completion(loans)
                        }
                    }
                }
            } else {
                completion(nil)
            }
        }
        
        // Creo que es para seguir en la funcion
        task.resume()
    }
    
    /**
     * Se tiene un parametro de datos
     * Si los datos son del tipo JSON se crea un objeto del tipo arreglo el cual contiene diccionarios; se crea un arreglo de diccionarios
     *  Se itera cada diccionario que contiene el arreglo para obtener su informacion
     *  Al momento de crear las variables correspondientes diccionario - modelo, se crea el objeto tarjeta
     *  Se agrega el objeto tarjeta al arreglo de tarjetas
     */
    static func getLoans(_ data: Data) -> [Loan]? {
        do {
            if let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [[String : Any]] {
                var loans: [Loan] = []
                
                for dictionary in jsonDictionary {
                    let concept = dictionary["concept"] as! String
                    let amount = dictionary["amount"] as! Float
                    let remainToPay = dictionary["remainToPay"] as! Float
                    let paymentTerm = dictionary["paymentTerm"] as! String
                    let paymentPlan = dictionary["paymentPlan"] as! String
                    let start = dictionary["start"] as! String
                    let lenderId = dictionary["lenderId"] as! String
                    let lenderCard = dictionary["lenderCard"] as! String
                    let borrowerId = dictionary["borrowerId"] as! String
                    let borrowerCard = dictionary["borrowerCard"] as! String
                    
                    let loan = Loan(concept: concept, amount: amount, remainToPay: remainToPay, paymentTerm: paymentTerm, paymentPlan: paymentPlan, start: start, lenderId: lenderId, lenderCard: lenderCard, borrowerId: borrowerId, borrowerCard: borrowerCard)
                    
                    loans.append(loan)
                }
                
                print(jsonDictionary)
                
                return loans
            }
            
            return nil
        } catch let error as NSError {
            print("Error in JSON \(error)")
            return nil
        }
    }
}
