//
//  VerificarMercanciaService.swift
//  Caritapp
//
//  Created by user189928 on 10/18/21.
//

import Foundation

class VerificarMercanciaService {
    public typealias RetrieveDonationClosure = ([Donation]) -> Void
    public typealias RetrieveProductsClosure = ([Linea]) -> Void
    public typealias RetrieveDonationsIdClosure = ([String]) -> Void
    public typealias sendProductClosure = (Linea) -> Void

    func retrieveDonations(_ handler: @escaping RetrieveDonationClosure) {
            let donationEndpoint: String = "https://caritapp-rest.herokuapp.com/donation/getDonations"
            guard let url = URL(string: donationEndpoint) else {
                print("Error: cannot create URL")
                return
            }
        
            let urlRequest = URLRequest(url: url)
            let config = URLSessionConfiguration.default
            let session = URLSession(configuration: config)
            
            let decoder = JSONDecoder()
            let task = session.dataTask(with: urlRequest) {
                (data, response, error) in
                guard error == nil else {
                    print("error calling GET on /donation/getDonations")
                    print(error!)
                    return
                }
                
                guard let responseData = data else {
                    print("Error: did not receive data")
                    return
                }
                
                do {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd"
                    decoder.dateDecodingStrategy = .formatted(dateFormatter)
                    
                    if let jsonResponse = String(data: responseData, encoding: String.Encoding.utf8) {
                        print("JSON String: \(jsonResponse)")
                    }

                    // check status code
                    if let httpResponse = response as? HTTPURLResponse {
                        print("statusCode: \(httpResponse.statusCode)")
                        
                        if (httpResponse.statusCode == 200) {
                            let donation = try decoder.decode([Donation].self, from: responseData)
                            handler(donation)
                        }
                        else {
                            print("Error: Failed to retrieve donation")
                        }
                        
                    }
                    
                } catch {
                    print("error trying to convert data to JSON")
                    return
                }

            }
            task.resume()
      }
    
    func retrieveDonationsId(_ handler: @escaping RetrieveDonationsIdClosure) {
            let donationEndpoint: String = "https://caritapp-rest.herokuapp.com/donation/getIdDonations"
            guard let url = URL(string: donationEndpoint) else {
                print("Error: cannot create URL")
                return
            }
        
            let urlRequest = URLRequest(url: url)
            let config = URLSessionConfiguration.default
            let session = URLSession(configuration: config)
            
            let decoder = JSONDecoder()
            let task = session.dataTask(with: urlRequest) {
                (data, response, error) in
                guard error == nil else {
                    print("error calling GET on /donation/getIdDonations")
                    print(error!)
                    return
                }
                
                guard let responseData = data else {
                    print("Error: did not receive data")
                    return
                }
                
                do {
                    if let jsonResponse = String(data: responseData, encoding: String.Encoding.utf8) {
                        print("JSON String: \(jsonResponse)")
                    }

                    // check status code
                    if let httpResponse = response as? HTTPURLResponse {
                        print("statusCode: \(httpResponse.statusCode)")
                        
                        if (httpResponse.statusCode == 200) {
                            let donationIds = try decoder.decode([String].self, from: responseData)
                            handler(donationIds)
                        }
                        else {
                            print("Error: Failed to retrieve donation")
                        }
                        
                    }
                    
                } catch {
                    print("error trying to convert data to JSON")
                    return
                }

            }
            task.resume()
      }
    
    
    func retrieveProducts(idDonation: String, _ handler: @escaping RetrieveProductsClosure) {
           let historyEndpoint: String = "https://caritapp-rest.herokuapp.com/donation/"+idDonation+"/products"
           guard let url = URL(string: historyEndpoint) else {
               print("Error: cannot create URL")
               return
           }
       
           let urlRequest = URLRequest(url: url)
           let config = URLSessionConfiguration.default
           let session = URLSession(configuration: config)
           
           let decoder = JSONDecoder()
           let task = session.dataTask(with: urlRequest) {
               (data, response, error) in
               guard error == nil else {
                   print("error calling GET on /donation/{id}/products")
                   print(error!)
                   return
               }
               
               guard let responseData = data else {
                   print("Error: did not receive data")
                   return
               }
               
               do {
                   if let jsonResponse = String(data: responseData, encoding: String.Encoding.utf8) {
                       print("JSON String: \(jsonResponse)")
                   }

                   let products = try decoder.decode([Linea].self, from: responseData)
                   
                   if let httpResponse = response as? HTTPURLResponse {
                       print("statusCode: \(httpResponse.statusCode)")
                   }
       
                   handler(products)
               } catch {
                   print("error trying to convert data to JSON")
                   return
               }

           }
           task.resume()
     }
    
    
    func updateProduct(product: Linea, _ handler: @escaping sendProductClosure) {
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
        let decoder = JSONDecoder()
        let jsonData = try! encoder.encode(product)
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
            
           
            if let httpResponse = response as? HTTPURLResponse {
                print("statusCode: \(httpResponse.statusCode)")
                
                if (httpResponse.statusCode == 200) {
                    print(httpResponse)
                    do{
                        let updated_product = try decoder.decode(Linea.self, from: responseData)
                        handler(updated_product)
                    }catch{
                        print("No se pudo convertir json a Linea")
                    }
                }
                else {
                    print("Error: Failed to retrieve donation")
                }
                
            }

        }
        task.resume()
        
  }
    
    
    
}
