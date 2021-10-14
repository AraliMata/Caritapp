//
//  newDonationViewController.swift
//  Caritapp
//
//  Created by user189928 on 9/9/

import UIKit
import UniformTypeIdentifiers

class CreateDonationViewController: UIViewController {
    let createDonationService = CreateDonationService()
    var idDonation = "0"

    @IBOutlet weak var donadorTextField: UITextField!
    
    @IBOutlet weak var tiendaTextFIeld: UITextField!
    
    @IBOutlet weak var kilosTextField: UITextField!
    
    @IBOutlet weak var fechaDatePicker: UIDatePicker!
    
    @IBOutlet weak var importarBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupToolbar()
    }
    
    @IBAction func crearDonacion(_ sender: UIButton) {
        
        
        
        if let donadorValue = donadorTextField.text, !donadorValue.isEmpty{
            
            if let tiendaValue = tiendaTextFIeld.text, !tiendaValue.isEmpty{
                    
                if let kilosValue = kilosTextField.text, !kilosValue.isEmpty{
                                
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd"
                                
                    let fecha: String = dateFormatter.string(from: self.fechaDatePicker.date) as String
                                
                    let donationReceived = Donation(donador: String(donadorValue), tienda: String(tiendaValue), kilos_donados: Float16(kilosValue)!, kilos_recibidos: Float16(0),  fecha: fecha)
                                
                    print("Fecha:", fecha)
                                
                    createDonationService.sendDonation(donation: donationReceived) {
                        [weak self](idReceived) in
                                    print(idReceived)
                                    self!.idDonation = idReceived
                        
                        DispatchQueue.main.async {
                           // UI work here
                            let importProductsView = self!.storyboard?.instantiateViewController(withIdentifier: "ImportProductsViewController") as! ImportProductsViewController
                            importProductsView.idDonation = idReceived
                            self!.present(importProductsView, animated: true, completion: nil)
                        }
                        
                        
                        
                        
                        /*let VC = self!.storyboard?.instantiateViewController(withIdentifier: "ImportProductsViewController") as! ImportProductsViewController
                        self!.present(VC, animated: true, completion: nil)*/
                        
                    }
                            
                        
                }else{
                    print("Entré al else")
                    let alertController = UIAlertController(title: "Error", message: "Coloca los kilos a donar", preferredStyle: UIAlertController.Style.alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    present(alertController, animated: true, completion: nil)
                }
            }else{
                let alertController = UIAlertController(title: "Error", message: "Coloca el nombre de la tienda", preferredStyle: UIAlertController.Style.alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                present(alertController, animated: true, completion: nil)
            }
        }else{
            let alertController = UIAlertController(title: "Error", message: "Coloca un donador", preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
        //Poner alertas en los else
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "importacionProductos" {
            let controller = (segue.destination as! ImportProductsViewController)
            
            controller.idDonation = self.idDonation
            
        }
    }
    
    
    func setupToolbar(){
        let bar = UIToolbar()
       
        let doneBtn = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissMyKeyboard))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        bar.items = [flexSpace, flexSpace, doneBtn]
        bar.sizeToFit()
        donadorTextField.inputAccessoryView = bar
        tiendaTextFIeld.inputAccessoryView = bar
        kilosTextField.inputAccessoryView = bar
   }
    
    @objc func dismissMyKeyboard(){
        view.endEditing(true)
    }
    

}
 

extension ViewController: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    /*public func textFieldDidEndEditing(_ textField: UITextField) {
        if (Double(textField.text!) == nil) {
            textField.text = ""
            let alertController = UIAlertController(title: "Error", message: "Invalid Value", preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
    }*/
}

