//
//  PaymentsService.swift
//  MoneyTogether
//
//  Created by Antonio Spinola Flores on 5/6/19.
//  Copyright © 2019 pastdue. All rights reserved.
//

import Foundation

class PaymentsService{
    
    let paymentsBaseURL: URL?
    
    init(service: APIServices) {
        paymentsBaseURL = URL(string: "https://money-together.herokuapp.com/api/v1/\(service)")
    }
    
    static let paymentsService = PaymentsService(service: .payments)
    
    /**
     * Se hace una llamada al URL (API)
     * Si no existe un error se procesa el valor traido del endpoint
     *  Se llama a una funcion externa para procesar la informacion y conseguir un arreglo de tarjetas
     *  Si el arreglo de tarjetas no es nulo se sobreescribe el arreglo actual
     *  Se manda al "thread main" el arreglo con las tarjetas del endpoint
     */
    static func payments(_ completion: @escaping (_ payments: [Payment]?) -> Void) {
        var payments: [Payment] = []
        
        let task = URLSession.shared.dataTask(with: paymentsService.paymentsBaseURL!) {
            (data, response, error) in
            
            if error == nil {
                if let data = data {
                    if let currentPayments = getPayments(data) {
                        payments = currentPayments
                        
                        OperationQueue.main.addOperation {
                            completion(payments)
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
    static func getPayments(_ data: Data) -> [Payment]? {
        do {
            if let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [[String : Any]] {
                var payments: [Payment] = []
                
//                id    "BString id"
//                loanId    "BString loanId"
//                paymentAmount    1000
//                payDate    "BString payDate"
                
                
                for dictionary in jsonDictionary {
                    _ = dictionary["id"] as! String
                    let loanId = dictionary["loanId"] as! String
                    let paymentAmount = dictionary["paymentAmount"] as! Double
                    let payDate = dictionary["payDate"] as! String
                    
                    let payment = Payment(loanId: loanId, paymentAmount: paymentAmount, payDate: payDate)
                    
                    payments.append(payment)
                }
                
                print(jsonDictionary)
                
                return payments
            }
            
            return nil
        } catch let error as NSError {
            print("Error in JSON \(error)")
            return nil
        }
    }
}
