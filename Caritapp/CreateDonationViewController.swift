//
//  newDonationViewController.swift
//  Caritapp
//
//  Created by user189928 on 9/9/

import UIKit
import UniformTypeIdentifiers

class CreateDonationViewController: UIViewController {
    let createDonationService = CreateDonationService()

    @IBOutlet weak var donadorTextField: UITextField!
    
    @IBOutlet weak var tiendaTextFIeld: UITextField!
    
    @IBOutlet weak var kilosTextField: UITextField!
    
    @IBOutlet weak var fechaDatePicker: UIDatePicker!
    
    @IBOutlet weak var importarBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func crearDonacion(_ sender: UIButton) {
        //Variable booleana que muestre que ya se seleccionó el archivo json a subir
        
        if let donadorValue = donadorTextField.text{
            if !donadorValue.isEmpty{
                if let tiendaValue = tiendaTextFIeld.text{
                    if !tiendaValue.isEmpty{
                        if let kilosValue = kilosTextField.text{
                            if !kilosValue.isEmpty{
                                let donationReceived = Donation(donador: String(donadorValue), tienda: String(tiendaValue), kilos_donados: Float16(kilosValue)!, fecha: fechaDatePicker.date)
                                
                                createDonationService.sendDonation(donation: donationReceived) { (createdDonation) in
                                    print(createdDonation)
                                }
                            
                        }
                    }
                }
            }
        }
     }
        //Poner alertas en los else
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

extension CreateDonationViewController: UIDocumentPickerDelegate {
    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {

        if let url = urls.first {
            let fileTool = ImportFileTool()
            
            /*do {
                let readString = try fileTool.readFileAsString(url)
                self.loadedFile.text = readString
            } catch {
                print("error trying to convert data to String")
            }*/
            
            do {
                let readJson = try fileTool.readFileAsJson(url)
                print("JSON: \(String(describing: readJson))")
            } catch {
                print("error trying to convert data to JSON")
            }
            
            do {
                let readProducts = try fileTool.readFileAsProducts(url)
                //self.celsiusTextField.text = String(readTemperature.value)
                //Aquí llamar al service y enviar los productos a la bdd
            } catch {
                print("error trying to convert data to JSON")
            }
        }

        controller.dismiss(animated: true)
    }
    
    public func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        controller.dismiss(animated: true)
    }
}
