//
//  EntregasService.swift
//  Caritapp
//
//  Created by user194078 on 10/21/21.
//

import Foundation

class EntregasService {
    public typealias RetrieveEntregasClosure = ([Entrega]) -> Void

    func retrieveEntregas(_ handler: @escaping RetrieveEntregasClosure) {
            let entregasEndpoint: String = "https://caritapp-rest.herokuapp.com/entrega/getEntregas"
            guard let url = URL(string: entregasEndpoint) else {
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
                    print("error calling GET on /entrega/getEntregas")
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
                            let entregas = try decoder.decode([Entrega].self, from: responseData)
                            handler(entregas)
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
    
}

