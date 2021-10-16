//
//  ExportDonationViewController.swift
//  Caritapp
//
//  Created by user193919 on 10/9/21.
//

import UIKit

class ExportDonationViewController: UIViewController {
    let donationService = DonationService()
    var exportedDonation: Donation = Donation(donador: "", tienda: "", kilos_donados: 0, kilos_recibidos: 0, fecha: "")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func exportDonation(_ sender: UIButton) {
        print("button pressed")
        let semaphore = DispatchSemaphore(value: 0)
        donationService.retrieveDonation() {
            (donation) in
            print("Donation exported")
            print(donation.donador)
            self.exportedDonation = donation
            print("Exported donation:")
            print("Donador:", self.exportedDonation.donador)
            semaphore.signal()
            /*
            let fileTool = FileTool()
            do {
                try fileTool.saveExportedDonationFile(donation: donation) {
                    fileURL in
                    let controller = UIDocumentPickerViewController(forExporting: [fileURL])
                    self.present(controller, animated: true)
                }
            } catch {
                print("Cannot save file")
            }*/
        }
        semaphore.wait()
        print("Exported donation outside closure:")
        print("Donador:", self.exportedDonation.donador)
        let fileTool = FileTool()
        do {
            try fileTool.saveExportedDonationFile(donation: self.exportedDonation) {
                fileURL in
                let controller = UIDocumentPickerViewController(forExporting: [fileURL])
                self.present(controller, animated: true)
            }
        } catch {
            print("Cannot save file")
        }

    }
    
}
