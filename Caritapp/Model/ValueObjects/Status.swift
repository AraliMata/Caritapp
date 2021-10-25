//
//  Status.swift
//  Caritapp
//
//  Created by user194275 on 10/3/21.
//
import Foundation

public class Status: Codable{
    public let donacion: Donation?
    public let estado: String
    let fecha: String?
    
    public init(donacion: Donation,estado: String, fecha: String){
        self.donacion = donacion
        self.estado = estado
        self.fecha = fecha
        
    }
    
}

