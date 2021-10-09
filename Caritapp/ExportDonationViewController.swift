//
//  ExportDonationViewController.swift
//  Caritapp
//
//  Created by user193919 on 10/9/21.
//

import UIKit

class ExportDonationViewController: UIViewController {
    let donationService = DonationService()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func exportDonation(_ sender: UIButton) {
        print("button pressed")
        donationService.retrieveDonation() {
            (donation) in
            print("Test retrieveDonation")
            print(donation)
        }
    }
    
}
