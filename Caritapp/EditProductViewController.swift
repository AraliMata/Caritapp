//
//  EditProductViewController.swift
//  Caritapp
//
//  Created by user189928 on 9/14/21.
//

import UIKit
import DropDown

class EditProductViewController: UIViewController {
    let verificarMercanciaService = VerificarMercanciaService()
    
    var destinoActualizado = ""
    var recibido = ""
    var switchChanged = false
    
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
    
    @IBAction func cambiarEstatus(_ sender: Any) {
        if(recibidoEditSwitch.isOn){
            recibido = "Recibido"
        }else{
            recibido = "No recibido"
        }
        switchChanged = true
    }
    
    @IBAction func seleccionarDestino(_ sender: Any) {
        dropdownDestino.show()
    }
    
    let dropdownDestino = DropDown()
    let almacenes = ["Central de abastos", "Avalos", "No definido"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView(product: productoRecibido)
        setupDropdownDestino()
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
            
        }
        

    }
    
    @IBAction func guardar(_ sender: Any) {
        print(recibido)
        
        if(destinoActualizado.isEmpty){
            destinoActualizado = productoRecibido?.destino ?? "No definido"
        }
        
        if(!switchChanged){
            recibido = productoRecibido?.status ?? "No recibido"
        }
        
        let donacionRepuesto = Donation(donador: "Prueba1", tienda: "Chida", kilos_donados: 189, kilos_recibidos: 0, fecha: "2021-10-14")
        
        let producto = Linea(id: productoRecibido?.id ?? 1, upc: productoRecibido?.upc ?? "5678", cant_s: productoRecibido?.cantidadSupuesta ?? 0, cant_r: productoRecibido?.cantidadRecibida ?? 0, precio_unit: productoRecibido?.precioUnitario ?? 0, precio_tot: productoRecibido?.precioTotal ?? 0, destino: destinoActualizado, status: recibido, donacion: productoRecibido?.donation ?? donacionRepuesto)
       
        verificarMercanciaService.updateProduct(product: producto,{(statusServicio) in
            if(statusServicio == 200){
                DispatchQueue.main.async {
                let alertController2 = UIAlertController(title: "Exito", message: "El producto fue actualizado", preferredStyle: UIAlertController.Style.alert)
                    alertController2.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default))
                    self.present(alertController2, animated: true, completion: nil)
               }
            }else{
                DispatchQueue.main.async {
                let alertController2 = UIAlertController(title: "Fallo", message: "Lo sentimos, la actualización del producto no pudo ser completada", preferredStyle: UIAlertController.Style.alert)
                    alertController2.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default))
                    self.present(alertController2, animated: true, completion: nil)
                }
            }
        } )
        
    }
    
    
    
    public func updateView(product: Linea?){
        upcEdit_textField.text = product?.upc
        cantSupEdit_textField.text = String(product?.cantidadSupuesta ?? 0)
        cantRecEdit_textField.text = String(product?.cantidadRecibida ?? 0)
        
        
        if(product?.status == "Recibido" || product?.status == "recibido" ){
            recibidoEditSwitch.setOn(true, animated: true)
        }else{
            recibidoEditSwitch.setOn(false, animated :true)
        }
        
        precioTotEdit_textField.text = String(product?.precioTotal ?? 0)
        precioUnEdit_textField.text = String(product?.precioUnitario ?? 0)
        destinoLabel.text = product?.destino ?? "Selecciona un destino"
        
    }
    
    


}


