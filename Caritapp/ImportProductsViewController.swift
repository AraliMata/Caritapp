//
//  ImportProductsViewController.swift
//  Caritapp
//
//  Created by user189928 on 10/8/21.
//

import UIKit

//
//  newDonationViewController.swift
//  Caritapp
//
//  Created by user189928 on 9/9/

import UIKit
import UniformTypeIdentifiers

class ImportProductsViewController: UIViewController {
    let createDonationService = CreateDonationService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func importarProductos(_ sender: UIButton) {
        let supportedTypes: [UTType] = [UTType.json]
        let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: supportedTypes, asCopy: true)
        documentPicker.delegate = self
        documentPicker.allowsMultipleSelection = false
        documentPicker.modalPresentationStyle = .fullScreen
        present(documentPicker, animated: true, completion: nil)
    }
    
    

}

extension ImportProductsViewController: UIDocumentPickerDelegate {
    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {

        if let url = urls.first {
            let fileTool = ImportFileTool()
            
            do {
                let readString = try fileTool.readFileAsString(url)
                //self.loadedFile.text = readString
            } catch {
                print("error trying to convert data to String")
            }
            
            do {
                let readJson = try fileTool.readFileAsJson(url)
                print("JSON: \(String(describing: readJson))")
                //Aquí llamar al service y enviar los productos a la bdd
            } catch {
                print("error trying to convert data to JSON")
            }
            
            do {
                let readProducts = try fileTool.readFileAsProducts(url)
                print(readProducts)
                //self.celsiusTextField.text = String(readTemperature.value)
                
            } catch {
                print("error trying to convert data to JSON Products")
            }
        }

        controller.dismiss(animated: true)
    }
    
    public func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        controller.dismiss(animated: true)
    }
}


