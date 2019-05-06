//
//  UsersService.swift
//  MoneyTogether
//
//  Created by Antonio Spinola Flores on 5/6/19.
//  Copyright © 2019 pastdue. All rights reserved.
//

import Foundation

class UsersService{
    
    let usersBaseURL: URL?
    
    init(service: APIServices) {
        usersBaseURL = URL(string: "https://money-together.herokuapp.com/api/v1/\(service)")
    }
    
    static let usersService = UsersService(service: .users)
    
    /**
     * Se hace una llamada al URL (API)
     * Si no existe un error se procesa el valor traido del endpoint
     *  Se llama a una funcion externa para procesar la informacion y conseguir un arreglo de tarjetas
     *  Si el arreglo de tarjetas no es nulo se sobreescribe el arreglo actual
     *  Se manda al "thread main" el arreglo con las tarjetas del endpoint
     */
    static func users(_ completion: @escaping (_ users: [User]?) -> Void) {
        var users: [User] = []
        
        let task = URLSession.shared.dataTask(with: usersService.usersBaseURL!) {
            (data, response, error) in
            
            if error == nil {
                if let data = data {
                    if let currentUsers = getUsers(data) {
                        users = currentUsers
                        
                        OperationQueue.main.addOperation {
                            completion(users)
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
    static func getUsers(_ data: Data) -> [User]? {
        do {
            if let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [[String : Any]] {
                var users: [User] = []
                
                for dictionary in jsonDictionary {
                    let firstname = dictionary["firstname"] as! String
                    let lastname = dictionary["lastname"] as! String
                    let email = dictionary["email"] as! String
                    let password = dictionary["password"] as! String
                    
                    let user = User(firstname: firstname, lastname: lastname, email: email, password: password)
                    
                    users.append(user)
                }
                
                print(jsonDictionary)
                
                return users
            }
            
            return nil
        } catch let error as NSError {
            print("Error in JSON \(error)")
            return nil
        }
    }
}
