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
        setupToolbar()
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
                                    print(createdDonation.donador)
                                }
                            
                        }
                    }
                }
            }
        }
     }
        //Poner alertas en los else
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

