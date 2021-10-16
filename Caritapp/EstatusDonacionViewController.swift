//
//  EstatusListViewController.swift
//  Caritapp
//
//  Created by user194275 on 10/14/21.
//
import UIKit

class EstatusDonationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
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

    
}
