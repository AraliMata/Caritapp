//
//  File.swift
//
//  Created by user193555 on 10/7/21.
//

import UIKit

class editStatus: UIViewController {
    
  
    @IBOutlet weak var donadorStatus: UILabel!
    @IBOutlet weak var estado: UILabel!
    @IBOutlet weak var tiendaStatus: UILabel!
    @IBOutlet weak var fechaStatus: UILabel!
    var updateStatus : Donation? {
        didSet {

        }
    }
    var showStatus : Status? {	
        didSet{	
            	
        }	
    }
    
    @IBAction func actualizarEstado(_ sender: UIButton) {
        if estado.text == "En tienda"{
                    estado.text = "En camino"
                } else if estado.text == "En camino"{
                    estado.text = "En almacen"
                } else if estado.text == "En almacen"{
                    estado.text = "En tienda"
                }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let status = updateStatus {
            donadorStatus.text = String(status.donador)
            tiendaStatus.text = String(status.tienda)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYYY-MM-dd"
            fechaStatus.text = status.fecha
            
        }
        estado.text = showStatus?.estado ?? "En tienda"
    }
    
   
    
}
