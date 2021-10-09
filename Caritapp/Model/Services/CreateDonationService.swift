//
//  TemperatureConverterService.swift
//  ConvertidorTemperatura
//
//  Created by Aralí Mata on 9/24/2021
//

import Foundation

class CreateDonationService {
    public typealias sendDonationClosure = (Donation) -> Void
    public typealias importProductsClosure = ([Product]) -> Void
    
    func sendDonation(donation: Donation, _ handler: @escaping sendDonationClosure) {
        let createDonationEndpoint: String = "hola.com" //Poner endpoint
        guard let url = URL(string: createDonationEndpoint) else {
            print("Error: cannot create URL")
            return
        }
    
        var urlRequest = URLRequest(url: url)

        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        let jsonData = try! encoder.encode(donation)
        urlRequest.httpBody = jsonData
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            guard error == nil else {
                print("error calling POST on /donation/create/")
                print(error!)
                return
            }
            
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            
            do {
                let createdDonation = try decoder.decode(Donation.self, from: responseData)
                
                if let httpResponse = response as? HTTPURLResponse {
                    print("statusCode: \(httpResponse.statusCode)")
                    print("donador: \(createdDonation.donador)")
                    print("tienda: \(createdDonation.tienda)")
                    print("kilos: \(createdDonation.kilos)")
                    print("fecha: \(createdDonation.fecha)")
                }
                
                handler(createdDonation)
            } catch {
                print("error trying to convert data to JSON")
                return
            }

        }
        task.resume()
        
        
  }
    
    func sendDonation(products: [Product], _ handler: @escaping importProductsClosure) {
        let createDonationEndpoint: String = "hola.com" //Poner endpoint
        guard let url = URL(string: createDonationEndpoint) else {
            print("Error: cannot create URL")
            return
        }
    
        var urlRequest = URLRequest(url: url)

        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        let jsonData = try! encoder.encode(products)
        urlRequest.httpBody = jsonData
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            guard error == nil else {
                print("error calling POST on /donation/create/")
                print(error!)
                return
            }
            
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            
            do {
                let importedProducts = try decoder.decode([Product].self, from: responseData)
                
                if let httpResponse = response as? HTTPURLResponse {
                    print("statusCode: \(httpResponse.statusCode)")
                    print("upc1: \(importedProducts[1].upc)")
                   
                }
                
                handler(importedProducts)
            } catch {
                print("error trying to convert data to JSON")
                return
            }

        }
        task.resume()
        
        
  }
    
    
}

