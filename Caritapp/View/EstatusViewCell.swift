//
//  EstatusViewCell.swift
//  Caritapp
//
//  Created by user194275 on 10/13/21.
//
import UIKit

class EstatusViewCell: UITableViewCell {
       
    @IBOutlet weak var tiendaValue: UILabel!
    @IBOutlet weak var donadorValue: UILabel!

    @IBOutlet weak var estatusValue: UITextField!
    
    func updateCellStatus(donation: Donation) {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "YYYY-MM-dd"
           
        tiendaValue.text = String(donation.tienda)
        donadorValue.text = String(donation.donador)
           
       }

}
    
