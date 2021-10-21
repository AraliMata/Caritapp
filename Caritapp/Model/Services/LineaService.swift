//
//  lineaService.swift
//  Caritapp
//
//  Created by user189928 on 10/13/21.
//

import Foundation

class LineaService{
    public typealias RetrieveProductsClosure = ([Linea]) -> Void

    func retrieveProducts(_ handler: @escaping RetrieveProductsClosure) {
            let productsEndpoint: String = "https://caritapp-rest.herokuapp.com/donation/129/products"
            guard let url = URL(string: productsEndpoint) else {
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
                            let products = try decoder.decode([Linea].self, from: responseData)
                            handler(products)
                        }
                        else {
                            print("Error: Failed to retrieve products")
                        }
                        
                    }
                } catch {
                    print("error trying to convert data to JSON")
                    return
                }

            }
            task.resume()
      }
}

