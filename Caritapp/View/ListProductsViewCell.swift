//
//  ListProductsViewCell.swift
//  Caritapp
//
//  Created by user189928 on 10/13/21.
//

import UIKit

class ListProductsViewCell: UITableViewCell {
    
    @IBOutlet weak var upc: UILabel!
    
    @IBOutlet weak var status: UILabel!
   
    
    @IBOutlet weak var destino: UILabel!
    
    func updateCell(product: Linea) {
        upc.text = product.upc
        destino.text = "Destino: "+product.destino
        if(product.status != nil){
            status.text = "Estatus: "+(product.status)!
        }else{
            status.text = "Estatus: "+"No recibido"
        }
    }
    
}
