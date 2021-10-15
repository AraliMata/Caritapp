//
//  CalendarTableViewCell.swift
//  Caritapp
//
//  Created by user194078 on 10/13/21.
//

import UIKit

class CalendarTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nombreDonador: UILabel!
    
    @IBOutlet weak var nombreTienda: UILabel!
    
    @IBOutlet weak var numKilos: UILabel!
    
    @IBOutlet weak var fechaRegistro: UILabel!
    
    func updateCell(donacion: Donation) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        nombreDonador.text = String(donacion.donador)
        nombreTienda.text = String(donacion.tienda)
        numKilos.text = String(donacion.kilosDonados)
        fechaRegistro.text = donacion.fecha
    }
    
}
