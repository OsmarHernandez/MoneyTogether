//
//  FirebaseManager.swift
//  MoneyTogether
//
//  Created by Osmar Hernández on 24/04/19.
//  Copyright © 2019 pastdue. All rights reserved.
//

import Foundation
import FirebaseAuth

public struct FirebaseManager {
    
    /*
     * Funcion del programa
     *
     *  parametros:
     *  email: email ingresado por el usuario
     *  password: contraseña ingresada por el usuario
     *  completion: regresa un boleano al terminar la llamada asincrona para saber si la conexion fue exitosa
     */
    public static func login(with email: String, and password: String, completion: @escaping (_ success: Bool) -> ()) {
        
        /*
         * Function de firebase
         *
         * parametros:
         *  email
         *  password
         */
        Auth.auth().signIn(withEmail: email, password: password) {
            (user, error) in
            
            if error == nil {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}

