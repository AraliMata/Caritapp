//
//  ListProductsViewController.swift
//  Caritapp
//
//  Created by user189928 on 9/14/21.
//

import UIKit

/*class ListProductsViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    //let lineaService = LineaService()
    
    var history : [Linea]? {
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
    
   /* override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail" {
            let controller = (segue.destination as! DetailViewController)
            
            if let indexPath = tableView.indexPathForSelectedRow{
                let selectedConversion = history?[indexPath.row]
                controller.detailItem = selectedConversion
            }
            
        }
    }*/
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListProductsViewCell {
            
            let product = history?[indexPath.row]
            cell.updateCell(product: product!)
            
            return cell
        }

        //cell.textLabel!.text = String(temperatureConversion?.original.value ?? 0) + " " + String(temperatureConversion?.converted.value ?? 0)
        return UITableViewCell()
    }
    

}


*/
