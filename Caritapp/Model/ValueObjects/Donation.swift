//
//  Donation.swift
//  Caritapp
//
//  Created by Aralí Mata on 9/24/2021
//

import Foundation

public class Donation: Codable{
    public let donador: String
    public let tienda: String
    let kilos: Float16
    //let kilos_recibidos: Float16
    let fecha: String
    
    public init(donador: String, tienda: String, kilos_donados: Float16, fecha: String){
        self.donador = donador
        self.tienda = tienda
        self.kilos = kilos_donados
        self.fecha = fecha
        //self.kilos_recibidos = 0
    }
    
}

