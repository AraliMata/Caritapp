//
//  ListProductsViewController.swift
//  Caritapp


import UIKit

///BDA-16
///Clase que contiene los métodos y variables para controlar lo que ocurre con la escena que muestra una lista de productos como tabla
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
    
    ///Función que manda el producto seleccionado por el usuario en la tabla a la escena de editar producto
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
                }
                
                
            }
            
        }
    }
    
    ///Función que va asignando los valores de la lista de productos de esta clase (history) a las celdas de la tabla de productos
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cellProducts", for: indexPath) as? ListProductsViewCell {
            
            let product = history?[indexPath.row]
            cell.updateCell(product: product!)
            
            return cell
        }

        return UITableViewCell()
    }
    
    
}
    





