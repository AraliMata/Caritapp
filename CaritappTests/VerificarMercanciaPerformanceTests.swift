//
//  VerificarMercanciaPerformanceTests.swift
//  CaritappTests
//
//  Created by user189928 on 10/24/21.
//

import XCTest
@testable import Caritapp

class VerificarMercanciaPerformanceTests: XCTestCase {
    let verificarMercanciaService = VerificarMercanciaService()
    
    func testRetrieveDonations() throws {
        
        self.measure {
            
            verificarMercanciaService.retrieveDonations { (donation) in
                
            }
        }
    }
    
    func testRetrieveProducts() throws {
        let idDonation = "314"
        self.measure {
            
            verificarMercanciaService.retrieveProducts(idDonation: idDonation, { (productos) in
                
            })
        }
    }
    
    func testRetrieveDonationsId() throws {
        self.measure {
            
            verificarMercanciaService.retrieveDonationsId { (ids) in
                
            }
        }
    }
    
    func testUpdateProduct() throws {
        let donation = Donation(donador: "Prueba1", tienda: "Chida", kilos_donados: 189, kilos_recibidos: 0, fecha: "2021-10-14")
        let product = Linea(id: 227, upc: "189087", cant_s: 34.5, cant_r: 34.5, precio_unit: 5, precio_tot: 40, donacion: donation)
        self.measure {
            
            verificarMercanciaService.updateProduct(product: product) { (status) in
                
            }
        }
    }
    

}
