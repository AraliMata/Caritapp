//
//  EntregasViewController.swift
//  Caritapp
//
//  Created by user194078 on 10/21/21.
//

import Foundation
import UIKit


class EntregasViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        
    
    @IBOutlet weak var tableView: UITableView!
    
    var entrega : [Entrega]? {
        didSet {

        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entrega?.count ?? 0
    }
    //por cada fila de la lista entrega, llenar los datos en la celda
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as? EntregaTableViewCell {
            let temperatureConversion = entrega?[indexPath.row]
            cell.updateCell(entrega: temperatureConversion!)
            return cell
        }

        //cell.textLabel!.text = String(temperatureConversion?.original.value ?? 0) + " " + String(temperatureConversion?.converted.value ?? 0)
        return UITableViewCell()
    }

}

