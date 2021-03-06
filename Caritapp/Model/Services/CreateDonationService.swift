//
//  TemperatureConverterService.swift
//  ConvertidorTemperatura

import Foundation

///Clase de servicio de crear donación, la cual tiene los métodos que hacen post y get con los endpoints relacionados a la creación de donación e importación de productos
class CreateDonationService {
    public typealias sendDonationClosure = (String) -> Void
    public typealias sendProductsClosure = (Int) -> Void
    public typealias retrieveDonorsClosure = ([Donador]) -> Void
    public typealias retrieveStoresClosure = ([String]) -> Void
    
    ///Método para enviar una donación con post al endpoint de crear donación
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
            
           
            if let httpResponse = response as? HTTPURLResponse {
                print("statusCode: \(httpResponse.statusCode)")
                
                if (httpResponse.statusCode == 200) {
                    let idReceived = String(decoding: responseData, as: UTF8.self)
                    
                    handler(idReceived)
                }
                else {
                    print("Error: Failed to retrieve donation")
                }
                
            }

        }
        task.resume()
        
  }
    
    ///Método para enviar una lista de productos con post al endpoint de importar productos
    func sendProducts(file: String, idDonation: String, _ handler: @escaping sendProductsClosure) {
        let sendProductsEndpoint: String = "https://caritapp-rest.herokuapp.com/donation/createDonation/importProducts/"+idDonation
        guard let url = URL(string: sendProductsEndpoint) else {
            print("Error: cannot create URL")
            return
        }
        
        var urlRequest = URLRequest(url: url)

        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let decoder = JSONDecoder()
        
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        urlRequest.httpBody = Data(file.utf8)
        
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
                    print(responseData)
                    do{
                        let products = try decoder.decode([Linea].self, from: responseData)
                        
                        print("Http response", httpResponse)
                        print("UPC:", products[0].upc)
                        print("Destino: ", products[0].destino)
                        
                    }catch{
                        print("Nose pudo convertir JSON a Linea")
                    }
                    
                    handler(httpResponse.statusCode)
                    
                }
                else {
                    print("Error: Failed to retrieve donation")
                }
                
            }

        }
        task.resume()
        
  }
    
    ///Método para obtener una lista de donadores con get al endpoint de obtener donadores
    func retrieveDonors(_ handler: @escaping retrieveDonorsClosure) {
            let donationEndpoint: String = "https://caritapp-rest.herokuapp.com/donor/getDonors"
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
                    print("error calling GET on /donation/donor/getDonors")
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
                            let donors = try decoder.decode([Donador].self, from: responseData)
                            handler(donors)
                        }
                        else {
                            print("Error: Failed to retrieve donors")
                        }
                        
                    }
                    
                } catch {
                    print("error trying to convert data to JSON")
                    return
                }

            }
            task.resume()
      }
    
    ///Método para obtener una lista de tiendas con get al endpoint de obtener tiendas, estas se obtienen por medio del id de donador
    func retrieveStores(idDonor: Int, _ handler: @escaping retrieveStoresClosure) {
            let donationEndpoint: String = "https://caritapp-rest.herokuapp.com/donor/getStores/"+String(idDonor)
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
                    print("error calling GET on /donor/getStores/{id}")
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
                            let stores = try decoder.decode([String].self, from: responseData)
                            handler(stores)
                        }
                        else {
                            print("Error: Fallo al recuperar donaciones")
                        }
                        
                    }
                    
                    
                } catch {
                    print("error al convertir los datos a String")
                    return
                }

            }
            task.resume()
      }
    
    
}

