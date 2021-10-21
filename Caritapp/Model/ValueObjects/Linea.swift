//
//  Product.swift
//  Caritapp
//
//  Created by Aralí Mata on 10/4/21.
//

import Foundation

public class Linea: Codable{
    public let id: Int;
    public let upc: String;
    public let cantidadSupuesta: Float
    public let cantidadRecibida: Float
    public let precioUnitario: Float
    public let precioTotal: Float
    public let destino: String
    public let status: String?
    public let donacion: Donation?

    
    public init(id: Int, upc: String, cant_s: Float, cant_r: Float, precio_unit: Float, precio_tot: Float, donacion: Donation){
        self.id = id;
        self.upc = upc
        self.cantidadSupuesta = cant_s
        self.cantidadRecibida = cant_r
        self.precioUnitario = precio_unit
        self.precioTotal = precio_tot
        self.destino = "Indefinido"
        self.status = "No recibido"
        self.donacion = donacion
    }
    
    /*private enum CodingKeys: String, CodingKey {
            case upc, cantidadSupuesta, cantidadRecibida, precioUnitario, precioTotal, destino, status
        }
    

   required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        upc = try container.decode(String.self, forKey: .upc)
        cantidadRecibida = try container.decode(Float.self, forKey:  .cantidadRecibida)
        cantidadSupuesta = try container.decode(Float.self, forKey: .cantidadSupuesta)
        precioTotal = try container.decode(Float.self, forKey: .precioTotal)
        precioUnitario = try container.decode(Float.self, forKey: .precioUnitario)
        destino = try container.decode(String.self, forKey: .destino)
        status = try container.decode(String.self, forKey: .status)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(upc, forKey: .upc)
        try container.encode(cantidadRecibida, forKey: .cantidadRecibida)
        try container.encode(cantidadSupuesta, forKey: .cantidadSupuesta)
        try container.encode(precioTotal, forKey: .precioTotal)
        try container.encode(precioUnitario, forKey: .precioUnitario)
        try container.encode(destino, forKey: .destino)
        try container.encode(status, forKey: .status)
    }*/
    
}
