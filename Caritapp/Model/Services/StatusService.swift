//
//
//
//  Created by user193555 on 8/22/21.
//
import Foundation

class StatusService {
    public typealias SendStatusClosure = (Status) -> Void
    
    func editStatus(status: Status, _ handler: @escaping SendStatusClosure) {
        let statusEndpoint: String = "https://caritapp-rest.herokuapp.com/status/edit"
        guard let url = URL(string: statusEndpoint) else {
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
        let jsonData = try! encoder.encode(status)
        urlRequest.httpBody = jsonData
        
        
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            guard error == nil else {
                print("error calling POST on /status/edit")
                print(error!)
                return
            }
            
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            
            do {
                let newStatus = try decoder.decode(Status.self, from: responseData)
                
                if let httpResponse = response as? HTTPURLResponse {
                    print("statusCode: \(httpResponse.statusCode)")
                    print("Estado: \(newStatus.estado)")
                    
                }
                
                handler(newStatus)
            } catch {
                print("error trying to convert data to JSON")
                return
            }
            

        }
        task.resume()
  }

   
}
