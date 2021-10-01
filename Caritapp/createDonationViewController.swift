//
//  newDonationViewController.swift
//  Caritapp
//
//  Created by user189928 on 9/9/

import UIKit

class createDonationViewController: UIViewController {
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
                                let donationReceived = Donation(donador: String(donadorValue), tienda: String(tiendaValue), kilos: String(kilosValue), fecha: fechaDatePicker.date)
                                
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
    
    
    

}
