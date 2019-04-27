//
//  UserManager.swift
//  MoneyTogether
//
//  Created by Osmar Hernández on 24/04/19.
//  Copyright © 2019 pastdue. All rights reserved.
//

import Foundation
import FirebaseAuth

public struct UserManager {
    
    typealias FirebaseUser = User
    
    /**
     * Funcion del tipo UserManager
     *
     *  parametros:
     *  email: email ingresado por el usuario
     *  password: contraseña ingresada por el usuario
     *  completion: regresa un boleano al terminar la llamada asincrona para saber si la conexion fue exitosa
     */
    public static func login(with email: String, and password: String, completion: @escaping (_ success: Bool) -> ()) {
        
        /*
         * Funcion de firebase
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
    
    /**
     * Funcion del tipo UserManager
     *
     * parametros:
     *  user: Cuenta creada por el usuario
     */
    public static func create(completion: @escaping (_ success: Bool) -> ()) {
        
        let email = "money.together.tec@gmail.com"
        let password = "passwd"
        
        /*
         * Funcion de firebase
         *
         * parametros:
         *  email
         *  password
         */
        Auth.auth().createUser(withEmail: email, password: password) {
            (result, error) in
            
            if error == nil {
                let firstname = "Money"
                let lastname = "Together"
                
                let user = User(firstname: firstname, lastname: lastname, email: email, password: password)
                user.uid = result?.user.uid
                
                add(new: user)
                
                if let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest() {
                    changeRequest.displayName = user.getName
                    changeRequest.commitChanges {
                        (error) in
                        if error != nil {
                            print("There was an error")
                        }
                    }
                }
                
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    /**
     * Funcion del tipo UserManager
     * parametros:
     *  user: Cuenta confirmada por Firebase
     */
    private static func add(new user: User) {
        guard let uid = user.uid else {
            return
        }
        
        DatabaseReference.reference.child("Users").child(uid).setValue(user.representation)
    }
    
    /**
     * Funcion del tipo UserManager
     * parametros:
     *  user: Cuenta confirmada por Firebase
     */
    public static func delete(with uid: String) {
        DatabaseReference.reference.child("Users").child(uid).removeValue()
    }
}

