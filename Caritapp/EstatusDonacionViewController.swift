//
//  EstatusListViewController.swift
//  Caritapp
//
//  Created by user194275 on 10/14/21.
//
import UIKit
class EstatusDonationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource	{
    @IBOutlet weak var tableViewStatus: UITableView!
    
    var historyStatus : [Donation]? {
        didSet {

        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyStatus?.count ?? 0
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cellStatus = tableView.dequeueReusableCell(withIdentifier: "cellStatus", for: indexPath) as? EstatusViewCell {
            let statusDonation = historyStatus?[indexPath.row]
            cellStatus.updateCellStatus(donation: statusDonation!)
            return cellStatus
        }
        
        
        
        /* let cellStatus = tableView.dequeueReusableCell(withIdentifier: "cellStatus", for: indexPath)
        let statusDonation = historyStatus?[indexPath.row]
    
        cellStatus.textLabel!.text = String(statusDonation?.tienda.count ?? 0)
        return cellStatus
         
*/
        return UITableViewCell()
    }
}






