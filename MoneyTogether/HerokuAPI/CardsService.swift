//
//  CardsService.swift
//  MoneyTogether
//
//  Created by Antonio Spinola Flores on 5/5/19.
//  Copyright © 2019 pastdue. All rights reserved.
//

import Foundation

class CardsService{
    
    let cardsBaseURL: URL?
    
    init(service: APIServices) {
        cardsBaseURL = URL(string: "https://money-together.herokuapp.com/api/v1/\(service)")
    }
    
    static let cardsService = CardsService(service: .cards)
    
    /**
     * Se hace una llamada al URL (API)
     * Si no existe un error se procesa el valor traido del endpoint
     *  Se llama a una funcion externa para procesar la informacion y conseguir un arreglo de tarjetas
     *  Si el arreglo de tarjetas no es nulo se sobreescribe el arreglo actual
     *  Se manda al "thread main" el arreglo con las tarjetas del endpoint
     */
    static func cards(_ completion: @escaping (_ cards: [Card]?) -> Void) {
        var cards: [Card] = []
        
        let task = URLSession.shared.dataTask(with: cardsService.cardsBaseURL!) {
            (data, response, error) in
            
            if error == nil {
                if let data = data {
                    if let currentCards = getCards(data) {
                        cards = currentCards
                        
                        OperationQueue.main.addOperation {
                            completion(cards)
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
    static func getCards(_ data: Data) -> [Card]? {
        do {
            if let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [[String : Any]] {
                var cards: [Card] = []
                
                for dictionary in jsonDictionary {
                    let number = dictionary["number"] as! String
                    let ownerId = dictionary["owner"] as! String
                    let expirationDate = dictionary["expirationDate"] as! String
                    let id = dictionary["id"] as! String
                    
                    let card = Card(number: number, expirationDate: (expirationDate.prefixes, expirationDate.sufixes), owner: ownerId, type: .debit, name: id)
                    
                    cards.append(card)
                }
                
                print(jsonDictionary)
                
                return cards
            }
            
            return nil
        } catch let error as NSError {
            print("Error in JSON \(error)")
            return nil
        }
    }
}
