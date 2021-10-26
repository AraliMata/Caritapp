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
        let donation = Donation(donador: "Soriana", tienda: "Jardines", kilos_donados: 67, kilos_recibidos: 0, fecha: "2021-10-15")
        let product = Linea(id: 255, upc: "345679", cant_s: 18, cant_r: 16, precio_unit: 1, precio_tot: 18, donacion: donation)
        self.measure {
            
            verificarMercanciaService.updateProduct(product: product) { (status) in
                
            }
        }
    }
    

}
