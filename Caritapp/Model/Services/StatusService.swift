//  Clase de servicio de estados. Contiene metodos Get y Put con enpoints para actualizar el estado de cada donación

import Foundation
 
class StatusService {
    public typealias retrieveStatusClosure = ([Status]) -> Void
    public typealias retrieveAStatusClosure = ([Status]) -> Void
    
    
    ///Metodo para utilizar el endpoint de obtener el estatus de cada donacion
    func retrieveStatus( _ handler: @escaping retrieveStatusClosure) {
        let retrieveStatusEndpoint: String = "https://caritapp-rest.herokuapp.com/status/getStatus"
        guard let url = URL(string: retrieveStatusEndpoint) else {
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
                print("error calling POST on /status/getStatus")
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
                        let newStatus = try decoder.decode([Status].self, from: responseData)
                        handler(newStatus)
                    }
                    else {
                        print("Error: Failed to retrieve status")
                    }
                    
                    
                }
                
                
            } catch {
                print("error trying to convert data to JSON ")
                return
            }

        }
        task.resume()
  }
    func retrieveAStatus(_ handler: @escaping retrieveAStatusClosure){
        let statusEndpoint: String = "https://caritapp-rest.herokuapp.com/status/137"
        guard let url = URL(string: statusEndpoint)else{
            print("Error: cannot create URL")
            return
        }
        
        // Set up url request and session
        let urlRequest = URLRequest(url: url)
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        // Decoder to decode response
        let decoder = JSONDecoder()
        // Perform request
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            guard error == nil else {
                print("error calling GET on /donation/{id}/products")
                print(error!)
                return
            }
            // Check that data was received
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            
            do {
                // Set up date formatter
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                decoder.dateDecodingStrategy = .formatted(dateFormatter)
                
                // Show json response
                if let jsonResponse = String(data: responseData, encoding: String.Encoding.utf8) {
                    print("JSON String: \(jsonResponse)")
                }
                
                // check status code
                if let httpResponse = response as? HTTPURLResponse {
                    print("statusCode: \(httpResponse.statusCode)")
                    // If status code is 200, decode response
                    if (httpResponse.statusCode == 200) {
                        let status = try decoder.decode([Status].self, from: responseData)
                        handler(status)
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

