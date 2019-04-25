//
//  CardManager.swift
//  MoneyTogether
//
//  Created by Osmar Hernández on 25/04/19.
//  Copyright © 2019 pastdue. All rights reserved.
//

import Foundation
import FirebaseAuth

struct CardManager {
    
    /**
     * Funcion del tipo CardManager
     *
     * Agregar
     * parametros:
     *  card: Tarjeta ingresada por el usuario
     */
    public static func add(new card: Card) {
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        card.ownerId = uid
        
        DatabaseReference.reference.child("Cards").child(card.id).setValue(card.representation)
    }
    
    /**
     * Funcion del tipo CardManager
     *
     * Eliminar
     * parametros:
     *  card: Tarjeta ingresada por el usuario
     */
    public static func delete(new card: Card) {
        
    }
}
