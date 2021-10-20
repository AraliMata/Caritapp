//
//  File.swift
//
//  Created by user193555 on 10/7/21.
//

import UIKit

class editStatus: UIViewController {
    
  
    @IBOutlet weak var donadorStatus: UILabel!
    @IBOutlet weak var tiendaStatus: UILabel!
    @IBOutlet weak var fechaStatus: UILabel!
    var updateStatus : Donation? {
        didSet {

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
        //donadorStatus.text = "Strip"
    }
    
    @IBAction func regresarStatusList(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
