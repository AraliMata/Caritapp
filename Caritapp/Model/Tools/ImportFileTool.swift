//
//  ImportFileTool.swift
//  Caritapp
//
//  Created by Aralí Mata on 10/4/21.
//

import Foundation

class ImportFileTool {
    enum Error: Swift.Error {
        case fileAlreadyExists
        case invalidDirectory
        case writtingFailed
    }
    
    let fileManager: FileManager
    
    init(fileManager: FileManager = .default) {
            self.fileManager = fileManager
    }

    public func readFileAsLinea(_ url: URL) throws -> [Linea]{
        print("The Url is : \(url)")
        var donatedProducts : [Linea]
        
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        donatedProducts = try decoder.decode([Linea].self, from: data)
        
        print("Product=  UPC:\(donatedProducts[0].upc)")
        
        return donatedProducts
    }
    
    public func readFileAsString(_ url: URL) throws -> String {
        print("The Url is : \(url)")
        var strData : String
        
        let data = try Data(contentsOf: url)
        strData = String(decoding: data, as: UTF8.self)
        print("String data=\(strData)")

        return strData
    }
    
    public func readFileAsJson(_ url: URL) throws -> Any? {
        print("The Url is : \(url)")
        let data = try Data(contentsOf: url)
        let json = try? JSONSerialization.jsonObject(with: data, options: [])
        print("Json data=\(String(describing: json))")
        
        return json
    }

    public typealias SaveFileClosure = (URL) -> Void

    public func saveFile(products: [Linea], _ handler: SaveFileClosure) throws {
        let encoder = JSONEncoder()
        let jsonData = try! encoder.encode(products)
        
        let fileManager = FileManager.default


        let fileURL = fileManager.temporaryDirectory.appendingPathComponent("exported.json")
            
        try jsonData.write(to: fileURL)
        
        handler(fileURL)
    }
}
