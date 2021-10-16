//
//  EstatusListViewController.swift
//  Caritapp
//
//  Created by user194275 on 10/14/21.
//
import UIKit
class EstatusDonationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource	{
    @IBOutlet weak var tableViewStatus: UITableView!
    
    var history : [Donation]? {
        didSet {

        }
    }
        /* esto es para sacar cada donacion del arreglo/bd dinamico de doncion
        */
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history?.count ?? 0
    }
    
    //Aqu[i se mete lo que va a llevar la tabla
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellStatus = tableView.dequeueReusableCell(withIdentifier: "cellStatus", for: indexPath)
        let statusDonation = history?[indexPath.row]
        
        //cellStatus.updateCellStatus(donation : statusDonation)
        //return cellStatus
        //Borrar o cambiar de aqui
        cellStatus.textLabel!.text = String(statusDonation?.tienda.count ?? 0)
        return cellStatus
        //a aqui
        
    }
}






/*class EstatusDonationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var history : [Donation]? {
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
        return history?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? EstatusViewCell {
            let estatus = history?[indexPath.row]
            cell.updateCell(donation: estatus!)
            return cell
        }
        
        
        return UITableViewCell()
    }

    
}*/
