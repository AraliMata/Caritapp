//
//  TemperatureConverterService.swift
//  ConvertidorTemperatura
//
//  Created by Aralí Mata on 9/24/2021
//

import Foundation

class CreateDonationService {
    public typealias sendDonationClosure = (String) -> Void
    public typealias sendProductsClosure = (String) -> Void
    
    func sendDonation(donation: Donation, _ handler: @escaping sendDonationClosure) {
        let createDonationEndpoint: String = "https://caritapp-rest.herokuapp.com/donation/createDonation/create"
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
        //let decoder = JSONDecoder()
        let jsonData = try! encoder.encode(donation)
        urlRequest.httpBody = jsonData
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            guard error == nil else {
                print("error calling POST on /donation/createDonation/create")
                print(error!)
                return
            }
            
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            
           
            print(responseData)
                
            let idReceived = String(decoding: responseData, as: UTF8.self)
                
                
                //let createdDonation = try decoder.decode(Donation.self, from: responseData)
                
            if let httpResponse = response as? HTTPURLResponse {
                print("statusCode: \(httpResponse.statusCode)")
                print("idDonacion:", idReceived)
            }
                
            handler(idReceived)
           

        }
        task.resume()
        
        
  }
    
    func sendProducts(file: Data, idDonation: String, _ handler: @escaping sendProductsClosure) {
        let sendProductsEndpoint: String = "https://caritapp-rest.herokuapp.com/donation/createDonation/importProducts/"+idDonation //Poner endpoint
        guard let url = URL(string: sendProductsEndpoint) else {
            print("Error: cannot create URL")
            return
        }
    
        var urlRequest = URLRequest(url: url)

        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
       
        urlRequest.httpBody = file
        
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            guard error == nil else {
                print("error calling POST on /donation/create/importProducts")
                print(error!)
                return
            }
            
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            
            
            let response =  String(decoding: responseData, as: UTF8.self)
            
            handler(response)

        }
        task.resume()
        
        
  }
    
    
}

