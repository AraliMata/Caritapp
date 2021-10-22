//
//  EntregaTableViewCell.swift
//  Caritapp
//
//  Created by user194078 on 10/21/21.
//

import Foundation
import Foundation
import UIKit

class EntregaTableViewCell: UITableViewCell {

    @IBOutlet weak var nombreDona: UILabel!
    @IBOutlet weak var kilosRecibidos: UILabel!
    
    @IBOutlet weak var tienda: UILabel!
    
    @IBOutlet weak var fechaRecepcion: UILabel!
    
    //Llenar labels de la celda con los valores del objeto Entrega
    func updateCell(entrega: Entrega) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        nombreDona.text = entrega.donador.nombre
        tienda.text = entrega.tienda.nombre
        kilosRecibidos.text = String(entrega.kilosRecibidos) + "kg"
        fechaRecepcion.text = entrega.fecha
    }
    
    
}
