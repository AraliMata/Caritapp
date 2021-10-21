//
//  Product.swift
//  Caritapp
//
//  Created by Aralí Mata on 10/4/21.
//

import Foundation

public class Linea: Codable{
    public let id: Int
    public let upc: String;
    //Para tabla linea
    public let cantidadRecibida: Float
    public let cantidadSupuesta: Float
    public let destino: String
    public let precioTotal: Float
    public let precioUnitario: Float
    public let status: String
    public let donation: Donation

    
    public init(id: Int, upc: String, cant_s: Float, cant_r: Float, precio_unit: Float, precio_tot: Float, donacion: Donation){
        self.id = id
        self.upc = upc
        self.cantidadSupuesta = cant_s
        self.cantidadRecibida = cant_r
        self.precioUnitario = precio_unit
        self.precioTotal = precio_tot
        self.destino = "Indefinido"
        self.status = "No recibido"
        self.donation = donacion
    }
    
}
