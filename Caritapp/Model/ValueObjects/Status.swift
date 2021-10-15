//
//  Status.swift
//  Caritapp
//
//  Created by user194275 on 10/3/21.
//
import Foundation

public class Status: Codable{
    public let estado: String
    let fecha: String
    
    public init(estado: String, fecha: String){
        self.estado = estado
        self.fecha = fecha
        
    }
    
}
