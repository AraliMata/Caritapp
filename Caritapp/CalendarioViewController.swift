//
//  CalendarioController.swift
//  Caritapp
//
//  Created by user194078 on 9/19/21.
//

//
//  ListViewController.swift
//  ConvertidorTemperaturaDraft2
//
//  Created by user193555 on 9/1/21.
//

import UIKit
import UniformTypeIdentifiers

class CalendarioViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
        
    var donacion : [Donation]? {
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
        return donacion?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CalendarTableViewCell {
            let temperatureConversion = donacion?[indexPath.row]
            cell.updateCell(donacion: temperatureConversion!)
            return cell
        }

        //cell.textLabel!.text = String(temperatureConversion?.original.value ?? 0) + " " + String(temperatureConversion?.converted.value ?? 0)
        return UITableViewCell()
    }

}
