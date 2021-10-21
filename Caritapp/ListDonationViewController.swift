//
//  DonationListViewController.swift
//  Caritapp
//
//  Created by user189928 on 10/13/21.
//
import UIKit

class ListDonationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let verificarMercanciaService = VerificarMercanciaService()

    var history : [Donation]? {
        didSet {

        }
    }
    
    var idDonations: [String]? {
        didSet{
            
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

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailListProducts" {
            let controller = (segue.destination as! ListProductsViewController)
            if let indexPath = tableView.indexPathForSelectedRow{
                let idDonation = idDonations?[indexPath.row] ?? "129"
                verificarMercanciaService.retrieveProducts(idDonation: idDonation) {
                    (products) in
                    
                    DispatchQueue.main.async {
                        controller.history = products
                        controller.tableView.reloadData()
                    }
                }
            }
            
            
            }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cellListDonation", for: indexPath) as? ListDonationViewCell {

            let donation = history?[indexPath.row]
            cell.updateCell(donation: donation!)

            return cell
        }

     
        return UITableViewCell()
    }

}
