//
//  ImportFileTool.swift
//  Caritapp


import Foundation

///Herramienta para convertir un archivo recibido en algun tipo de dato.
class FileTool {
    enum Error: Swift.Error {
        case fileAlreadyExists
        case invalidDirectory
        case writtingFailed
    }
    
    let fileManager: FileManager
    
    init(fileManager: FileManager = .default) {
            self.fileManager = fileManager
    }

    ///Función que lee el archivo recibido como tipo Linea
    public func readFileAsLinea(_ url: URL) throws -> [Linea]{
        print("The Url is : \(url)")
        var donatedProducts : [Linea]
        
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        donatedProducts = try decoder.decode([Linea].self, from: data)
        
        print("Product=  UPC:\(donatedProducts[0].upc)")
        
        return donatedProducts
    }
    
    ///Función que lee el archivo recibido como tipo String
    public func readFileAsString(_ url: URL) throws -> String {
        print("The Url is : \(url)")
        var strData : String
        
        let data = try Data(contentsOf: url)
        strData = String(decoding: data, as: UTF8.self)
        print("String data=\(strData)")

        return strData
    }
    
    ///Función que lee el archivo recibido como tipo Json
    public func readFileAsJson(_ url: URL) throws -> Any? {
        print("The Url is : \(url)")
        let data = try Data(contentsOf: url)
        let json = try? JSONSerialization.jsonObject(with: data, options: [])
        print("Json data=\(String(describing: json))")
        
        return json
    }

    public typealias SaveFileClosure = (URL) -> Void

    public func saveProductsFile(products: [Linea], _ handler: SaveFileClosure) throws {
        let encoder = JSONEncoder()
        let jsonData = try! encoder.encode(products)
        
        let fileManager = FileManager.default


        let fileURL = fileManager.temporaryDirectory.appendingPathComponent("exportedProducts.json")
            
        try jsonData.write(to: fileURL)
        
        handler(fileURL)
    }
    
    public func saveExportedDonationFile(donation: Donation, _ handler: SaveFileClosure) throws {
        let encoder = JSONEncoder()
        let jsonData = try! encoder.encode(donation)
        
        let fileManager = FileManager.default


        let fileURL = fileManager.temporaryDirectory.appendingPathComponent("exportedDonation.json")
            
        try jsonData.write(to: fileURL)
        
        handler(fileURL)
    }
}
