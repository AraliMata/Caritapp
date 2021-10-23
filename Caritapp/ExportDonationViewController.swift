//
//  ExportDonationViewController.swift
//  Caritapp
//
//  Created by user193919 on 10/9/21.
//

import UIKit

class ExportDonationViewController: UIViewController {
    // Products service
    let productsService = LineaService()
    // Variable to store the products that will be exported
    var exportedProducts: [Linea] = []

    // UI labels
    @IBOutlet weak var donadorLabel: UILabel!
    @IBOutlet weak var tiendaLabel: UILabel!
    @IBOutlet weak var fechaLabel: UILabel!
    @IBOutlet weak var kilosDonadosLabel: UILabel!
    @IBOutlet weak var kilosRecibidosLabel: UILabel!
    @IBOutlet weak var destinoLabel: UILabel!
    @IBOutlet weak var statusSwitch: UISwitch!
    
    // On loading the view
    override func viewDidLoad() {
        super.viewDidLoad()
        // Use a semaphore to wait to recieve an answer from the backend
        // before continuing
        let semaphore = DispatchSemaphore(value: 0)
        // Call products service
        productsService.retrieveProducts() {
            (products) in
            print("Products exported")
            // Set products list
            self.exportedProducts = products
            // Show number of exported products
            print("Number of products:", self.exportedProducts.count)
            // Signal semaphore
            semaphore.signal()
        }
        // Wait for signal
        semaphore.wait()
        
        // Update labels
        self.donadorLabel.text = self.exportedProducts[0].donation?.donador
        self.tiendaLabel.text = self.exportedProducts[0].donation?.tienda
        self.fechaLabel.text = self.exportedProducts[0].donation?.fecha
        self.kilosDonadosLabel.text = String(self.exportedProducts[0].donation!.kilosDonados)
        self.kilosRecibidosLabel.text = String(self.exportedProducts[0].donation!.kilosRecibidos)
        self.destinoLabel.text = self.exportedProducts[0].destino
        // Update switch
        if self.exportedProducts[0].status == "Recibido" {
            self.statusSwitch.isOn = true
        }
        else {
            self.statusSwitch.isOn = false
        }
    }

    // Create a json file after pressing export button
    @IBAction func exportDonation(_ sender: UIButton) {
        // Show that button was pressed
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
