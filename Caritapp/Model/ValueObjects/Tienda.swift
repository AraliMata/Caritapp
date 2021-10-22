//
//  Tienda.swift
//  Caritapp
//
//  Created by user194078 on 10/21/21.
//

import Foundation
public class Tienda: Codable{
    public let ubicacion: String
    public let nombre: String
    
    public init(ubicacion: String, nombre: String){
        self.ubicacion = ubicacion
        self.nombre = nombre
    }
    
}
