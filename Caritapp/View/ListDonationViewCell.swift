//
//  ListDonationViewCell.swift
//  Caritapp
//
//  Created by user189928 on 10/13/21.
//

import UIKit

class ListDonationViewCell: UITableViewCell {
    @IBOutlet weak var donador: UILabel!
    @IBOutlet weak var fecha: UILabel!
    @IBOutlet weak var tienda: UILabel!
    @IBOutlet weak var kilos_recibidos: UILabel!
    @IBOutlet weak var kilosDonados: UILabel!
    
    func updateCell(donation: Donation) {
        fecha.text = donation.fecha
        donador.text = donation.donador
        tienda.text = donation.tienda
        kilos_recibidos.text = String(donation.kilosRecibidos)
        kilosDonados.text = String(donation.kilosDonados)
    }
    
}
