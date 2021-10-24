//
//  CreateDonationPerformance.swift
//  CaritappTests
//
//  Created by user189928 on 10/24/21.
//

import Foundation
import XCTest

@testable import Caritapp

class CreateDonationPerformanceTests: XCTestCase {
    let createDonationService = CreateDonationService()

    func testRetrieveDonors() throws {
        
        self.measure {
            
            createDonationService.retrieveDonors{
                (donors) in
            }
        }
    }
    
    func testRetrieveStores() throws {
        let idDonor = 145
        
        self.measure {
            
            createDonationService.retrieveStores(idDonor: idDonor) { (stores) in
                
            }
        }
    }
    
    func testSendDonation() throws {
        let donation = Donation(donador: "Walmart", tienda: "San Francisco", kilos_donados: 189, kilos_recibidos: 45, fecha: "2021-10-31")
        
        self.measure {
            
            createDonationService.sendDonation(donation: donation) { (answer) in
                
            }
        }
    }
    
    func testSendProducts() throws {
        let products = "[{\"upc\": \"345678\",\"cantidadSupuesta\": 18,\"cantidadRecibida\": 16,\"precioUnitario\": 1,\"precioTotal\": 18,\"destino\": \"no definido\", \"status\":\"Recibido\"}]"
        let idDonation = "314"
        
        self.measure {
            
            createDonationService.sendProducts(file: products, idDonation: idDonation) { (status) in
                
            }
            
        }
    }
    
    
    

}

