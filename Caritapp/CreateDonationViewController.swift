//
//  newDonationViewController.swift
//  Caritapp
//

import UIKit
import UniformTypeIdentifiers
import DropDown


///BDA-1
///Clase para realizar las operaciones relacionadas con la escena de crear donación
class CreateDonationViewController: UIViewController {
    let createDonationService = CreateDonationService()
    var idDonation = "0"
    var idDonor = 145
    var donors = [Donador]()

    
    ///Elementos de la interfaz gráfica conectados a la clase
    @IBOutlet weak var dropDownDonador: UIView!
    
    @IBOutlet weak var donadorLabel: UILabel!
    
    @IBOutlet weak var dropDownTienda: UIView!
    
    @IBOutlet weak var tiendaLabel: UILabel!
    
    @IBOutlet weak var kilosTextField: UITextField!
    
    @IBOutlet weak var fechaDatePicker: UIDatePicker!
    
    @IBOutlet weak var importarBtn: UIButton!
    
    let dropdownDon = DropDown()
    let dropdownTien = DropDown()
    let dropDownTienValues = ["Seleccione un donador"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupToolbar()
        setupDropdownDonador()
        setupDropdownTiendas()
        
    }
    
    
    ///Función que asigna la configuración para que funcione correctamente al dropdown en donde se selecciona el donador y llama a las funciones del servicio para obtener donadores y las tiendas asignadas al donador elegido
    func setupDropdownDonador(){
        dropdownDon.anchorView = dropDownDonador
        
        dropdownDon.bottomOffset = CGPoint(x: 0, y:(dropdownDon.anchorView?.plainView.bounds.height)!)
        dropdownDon.direction = .bottom
        
        createDonationService.retrieveDonors {[weak self](donors) in
            self?.donors = donors
            var donorsName = [String]()
            for donor in donors{
                donorsName.append(donor.nombre)
            }
            self?.dropdownDon.dataSource = donorsName
        }
        dropdownDon.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Donador selecionado: \(item) en index: \(index)")
            self.donadorLabel.text = item
            self.tiendaLabel.text = "Seleccionar tienda"
            self.idDonor = self.donors[index].id
            print(self.idDonor)
            
            createDonationService.retrieveStores(idDonor: self.idDonor) { (stores) in
                self.dropdownTien.dataSource = stores
            }
        }
        
    }
    
    ///Función que asigna la configuración para que funcione correctamente al dropdown en donde se selecciona la tienda
    func setupDropdownTiendas(){
        dropdownTien.anchorView = dropDownTienda
        dropdownTien.dataSource = dropDownTienValues
        dropdownTien.bottomOffset = CGPoint(x: 0, y:(dropdownDon.anchorView?.plainView.bounds.height)!)
        dropdownTien.direction = .bottom
        
        dropdownTien.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Tienda selecionada: \(item) en index: \(index)")
            self.tiendaLabel.text = item
        }
    }
    
    
    ///Función para que al presionar el dropdown de donadores se muestren los donadores
    @IBAction func mostrarDonadores(_ sender: Any) {
        dropdownDon.show()
    }
    
    ///Función para que al presionar el dropdown de donadores se muestren las tiendas
    @IBAction func mostrarTiendas(_ sender: Any) {
        dropdownTien.show()
    }
    
    ///Función que al presionar el botón de crear donación, crea una nueva donación con los valores seleccionados en los dropdowns y campos de texto y llama al servicio que manda la donación, finalmente se cambia de pantalla a la de importar donación
    @IBAction func crearDonacion(_ sender: UIButton) {
        
        if let donadorValue = donadorLabel.text, donadorValue != "Seleccionar donador"{
            
            if let tiendaValue = tiendaLabel.text, tiendaValue != "Seleccionar tienda" && tiendaValue != "Seleccione un donador"{
                    
                if let kilosValue = kilosTextField.text, !kilosValue.isEmpty{
                                
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd"
                                
                    let fecha: String = dateFormatter.string(from: self.fechaDatePicker.date) as String
                                
                    let donationReceived = Donation(donador: donadorLabel.text!, tienda: tiendaLabel.text!, kilos_donados: Float16(kilosValue)!, kilos_recibidos: Float16(0),  fecha: fecha)
                                
                    print("Fecha:", fecha)
                                
                    createDonationService.sendDonation(donation: donationReceived) {
                        [weak self](idReceived) in
                                    print(idReceived)
                                    self!.idDonation = idReceived
                        
                        DispatchQueue.main.async {
                            let importProductsView = self!.storyboard?.instantiateViewController(withIdentifier: "ImportProductsViewController") as! ImportProductsViewController
                            importProductsView.idDonation = idReceived
                            self!.present(importProductsView, animated: true, completion: nil)
                        }
                    }
                        
                }else{
                    print("Entré al else")
                    let alertController = UIAlertController(title: "Error", message: "Coloque los kilos a donar", preferredStyle: UIAlertController.Style.alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    present(alertController, animated: true, completion: nil)
                }
           }else{
                let alertController = UIAlertController(title: "Error", message: "Seleccione la tienda dede donde está donando", preferredStyle: UIAlertController.Style.alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                present(alertController, animated: true, completion: nil)
            }
        }else{
            let alertController = UIAlertController(title: "Error", message: "Seleccione su nombre de donador", preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
      
    }
    
    ///Función para pasar el id de la donación recien creada a la siguiente pantalla
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "importacionProductos" {
            let controller = (segue.destination as! ImportProductsViewController)
            
            controller.idDonation = self.idDonation
            
        }
    }
    
    
    ///Función para agregar el botón Done al teclado y que cuando se le presione, el teclado se quite
    func setupToolbar(){
        let bar = UIToolbar()
       
        let doneBtn = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissMyKeyboard))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        bar.items = [flexSpace, flexSpace, doneBtn]
        bar.sizeToFit()
        kilosTextField.inputAccessoryView = bar
   }
    
    @objc func dismissMyKeyboard(){
        view.endEditing(true)
    }
    

}
 

extension ViewController: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

