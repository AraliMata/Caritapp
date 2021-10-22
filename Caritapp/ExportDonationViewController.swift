//
//  ExportDonationViewController.swift
//  Caritapp
//
//  Created by user193919 on 10/9/21.
//

import UIKit

class ExportDonationViewController: UIViewController {
    let productsService = LineaService()
    var exportedProducts: [Linea] = []

    // UI labels
    @IBOutlet weak var donadorLabel: UILabel!
    @IBOutlet weak var tiendaLabel: UILabel!
    @IBOutlet weak var fechaLabel: UILabel!
    @IBOutlet weak var kilosDonadosLabel: UILabel!
    @IBOutlet weak var kilosRecibidosLabel: UILabel!
    @IBOutlet weak var destinoLabel: UILabel!
    @IBOutlet weak var statusSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let semaphore = DispatchSemaphore(value: 0)
        productsService.retrieveProducts() {
            (products) in
            print("Products exported")
            // Set products list
            self.exportedProducts = products

            print("Number of products:", self.exportedProducts.count)
            semaphore.signal()
        }
        semaphore.wait()
        
        // Update labels
        self.donadorLabel.text = self.exportedProducts[0].donation?.donador
        self.tiendaLabel.text = self.exportedProducts[0].donation?.tienda
        self.fechaLabel.text = self.exportedProducts[0].donation?.fecha
        self.kilosDonadosLabel.text = String(self.exportedProducts[0].donation!.kilosDonados)
        self.kilosRecibidosLabel.text = String(self.exportedProducts[0].donation!.kilosRecibidos)
        self.destinoLabel.text = self.exportedProducts[0].destino
        
        if self.exportedProducts[0].status == "Recibido" {
            self.statusSwitch.isOn = true
        }
        else {
            self.statusSwitch.isOn = false
        }
    }

    @IBAction func exportDonation(_ sender: UIButton) {
        print("button pressed")
        
        
        // Decode JSON and create file
        let fileTool = FileTool()
        do {
            try fileTool.saveProductsFile(products: self.exportedProducts) {
                fileURL in
                let controller = UIDocumentPickerViewController(forExporting: [fileURL])
                self.present(controller, animated: true)
            }
        } catch {
            print("Cannot save file")
        }

    }
    
}
