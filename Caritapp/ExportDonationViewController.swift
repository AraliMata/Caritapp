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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func exportDonation(_ sender: UIButton) {
        print("button pressed")
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
