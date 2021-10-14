//
//  lineaService.swift
//  Caritapp
//
//  Created by user189928 on 10/13/21.
//

/*import Foundation

class LineaService{
    public typealias RetrieveProductsClosure = ([Donation]) -> Void

    func retrieveProducts(_ handler: @escaping RetrieveDonationsClosure) {
            let historyEndpoint: String = "https://temperature-converter-rest.herokuapp.com/temperature/conversion/history"
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
                    print("error calling GET on /temperature/conversion/history")
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

                    let history = try decoder.decode([TemperatureConversion].self, from: responseData)
                    
                    if let httpResponse = response as? HTTPURLResponse {
                        print("statusCode: \(httpResponse.statusCode)")
                    }
        
                    handler(history)
                } catch {
                    print("error trying to convert data to JSON")
                    return
                }

            }
            task.resume()
      }
}
*/
