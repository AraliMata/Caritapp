//
//  Entrega.swift
//  Caritapp
//
//  Created by user194078 on 10/20/21.
//

import Foundation
public class Entrega: Codable{
    //public let id: Int
    public let donador: Donador
    public let tienda: Tienda
    //let kilos_donados: Float16
    //let kilos_recibidos: Float16
    let kilosRecibidos: Float16
    let fecha: String
    
    public init(donador: Donador, tienda: Tienda, kilos_recibidos: Float16,  fecha: String){
        //self.id = id
        self.donador = donador
        self.tienda = tienda
        self.fecha = fecha
        self.kilosRecibidos = kilos_recibidos
    }
    
}

