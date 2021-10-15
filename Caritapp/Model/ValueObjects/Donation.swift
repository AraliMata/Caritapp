//
//  Donation.swift
//  Caritapp
//
//  Created by Aralí Mata on 9/24/2021
//

import Foundation

public class Donation: Codable{
    //public let id: Int
    public let donador: String
    public let tienda: String
    //let kilos_donados: Float16
    let kilosDonados: Float16
    //let kilos_recibidos: Float16
    let kilosRecibidos: Float16
    let fecha: String
    
    public init(donador: String, tienda: String, kilos_donados: Float16, kilos_recibidos: Float16,  fecha: String){
        //self.id = id
        self.donador = donador
        self.tienda = tienda
        self.fecha = fecha
        self.kilosRecibidos = kilos_recibidos
        self.kilosDonados = kilos_donados
        
    }
    
}

