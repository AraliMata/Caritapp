//
//  Donador.swift
//  Caritapp
//
//  Created by Aralí on 10/15/21.
//

import Foundation

public class Donador: Codable{
    public let id: Int
    public let nombre: String
    
    public init(id: Int, nombre: String){
        self.id = id
        self.nombre = nombre
    }
    
}
