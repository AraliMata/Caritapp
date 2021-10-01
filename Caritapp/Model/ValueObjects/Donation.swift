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
    let kilos: String
    let fecha: Date
    
    public init(donador: String, tienda: String, kilos: String, fecha: Date){
        self.donador = donador
        self.tienda = tienda
        self.kilos = kilos
        self.fecha = fecha
    }
    
}

