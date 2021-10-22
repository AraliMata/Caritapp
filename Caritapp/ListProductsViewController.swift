//
//  ListProductsViewController.swift
//  Caritapp
//
//  Created by user189928 on 9/14/21.
//

import UIKit

class ListProductsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    var history : [Linea]? {
        didSet {

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //alerta()
        

    }
    
   

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history?.count ?? 0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailProduct" {
            let controller = (segue.destination as! EditProductViewController)
            
            if let indexPath = tableView.indexPathForSelectedRow{
                
                if let selectedProduct = history?[indexPath.row]{
                    controller.productoRecibido = selectedProduct
                } else {
                    let alertController = UIAlertController(title: "Lo sentimos", message: "El producto no fue encontrado", preferredStyle: UIAlertController.Style.alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
                    present(alertController, animated: true, completion: nil)
                    //Volver a lista de donaciones
                }
                
                
            }
            
        }
    }
    
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cellProducts", for: indexPath) as? ListProductsViewCell {
            
            let product = history?[indexPath.row]
            cell.updateCell(product: product!)
            
            return cell
        }

        //cell.textLabel!.text = String(temperatureConversion?.original.value ?? 0) + " " + String(temperatureConversion?.converted.value ?? 0)
        return UITableViewCell()
    }
    
   /* func alerta(){
        
        if(self.history!.count == 0 || self.history){
           
            DispatchQueue.main.async {
            let alertController2 = UIAlertController(title: "Advertencia", message: "Esta donación no tiene productos asociados", preferredStyle: UIAlertController.Style.alert)
                alertController2.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default))
                self.present(alertController2, animated: true, completion: nil)
           }
        }
    }*/
}
    





