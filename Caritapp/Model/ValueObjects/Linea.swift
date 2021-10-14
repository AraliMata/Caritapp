//
//  Product.swift
//  Caritapp
//
//  Created by Aralí Mata on 10/4/21.
//

import Foundation

public class Linea: Codable{
    public let upc: String;
    //Para tabla linea
    public let cantidad_supuesta: Float
    public let cantidad_recibida: Float
    public let precio_unitario: Float
    public let precio_total: Float
    public let destino: String
    public let status: String

    
    public init(upc: String, cant_s: Float, cant_r: Float, precio_unit: Float, precio_tot: Float){
        self.upc = upc
        self.cantidad_supuesta = cant_s
        self.cantidad_recibida = cant_r
        self.precio_unitario = precio_unit
        self.precio_total = precio_tot
        self.destino = "Indefinido"
        self.status = "No recibido"
    }
    
}
