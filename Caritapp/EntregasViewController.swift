//
//  EntregasViewController.swift
//  Caritapp
//
//  Created by user194078 on 10/20/21.
//



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

