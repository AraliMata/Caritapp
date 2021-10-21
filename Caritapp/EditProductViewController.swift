//
//  EditProductViewController.swift
//  Caritapp
//
//  Created by user189928 on 9/14/21.
//

import UIKit
import DropDown

class EditProductViewController: UIViewController {
    
    var destinoActualizado = ""
    
    var productoRecibido : Linea? {
        didSet {

        }
    }

    @IBOutlet weak var upcEdit_textField: UITextField!
    @IBOutlet weak var udmEdit_textField: UITextField!
    @IBOutlet weak var articEdit_textField: UITextField!
    @IBOutlet weak var cantSupEdit_textField: UITextField!
    @IBOutlet weak var cantRecEdit_textField: UITextField!
    @IBOutlet weak var precioUnEdit_textField: UITextField!
    @IBOutlet weak var recibidoEditSwitch: UISwitch!
    @IBOutlet weak var precioTotEdit_textField: UITextField!
    @IBOutlet weak var guardarEditBtn: UIButton!
    
    @IBOutlet weak var dropdownDestView: UIView!
    
    @IBOutlet weak var destinoLabel: UILabel!
    
    
    @IBAction func seleccionarDestino(_ sender: Any) {
    }
    
    let dropdownDestino = DropDown()
    let almacenes = ["Central de abastos", "Avalos", "No definido"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateView(product: productoRecibido)
        setupDropdownDestino()
    }
    
    @IBAction func guardar(_ sender: Any) {
        
    }
    
    func setupDropdownDestino(){
        dropdownDestino.anchorView = dropdownDestView
        dropdownDestino.bottomOffset = CGPoint(x: 0, y:( dropdownDestino.anchorView?.plainView.bounds.height)!)
        dropdownDestino.direction = .bottom
        //Llamar al servicio que saca los almacenes de la tabla, recibir una lista con los nombres y guardarlo en el datasource
        dropdownDestino.dataSource = almacenes
        dropdownDestino.selectionAction = {
            [unowned self ](index: Int, item: String) in
            print("Almacen seleccionado: \(item) en index: \(index)")
            self.destinoActualizado = item
            self.destinoLabel.text = item
            //Cuando se presione el botón guardar, llamar al servicio, usar id de producto para poder actualizar
            
        }
        

    }
    
    
    public func updateView(product: Linea?){
        upcEdit_textField.text = product?.upc
        cantSupEdit_textField.text = String(product?.cantidadSupuesta ?? 0)
        cantRecEdit_textField.text = String(product?.cantidadRecibida ?? 0)
        
        
        if(product?.status == "No recibido"){
            recibidoEditSwitch.setOn(false, animated :true)
        }else{
            recibidoEditSwitch.setOn(true, animated: true)
        }
        
        precioTotEdit_textField.text = String(product?.precioTotal ?? 0)
        precioUnEdit_textField.text = String(product?.precioUnitario ?? 0)
        
    }
    
    


}


