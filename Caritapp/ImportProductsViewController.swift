import UIKit
import UniformTypeIdentifiers

///Clase para realizar las operaciones relacionadas con la escena de importar donación
class ImportProductsViewController: UIViewController {
    let createDonationService = CreateDonationService()
    
    var idDonation: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Seungdo id:", idDonation!)
        
    }
    
    ///Función para que al presionar el botón de importarProductos se abra el document picker
    @IBAction func importarProductos(_ sender: UIButton) {
        let supportedTypes: [UTType] = [UTType.json]
        let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: supportedTypes, asCopy: true)
        documentPicker.delegate = self
        documentPicker.allowsMultipleSelection = false
        documentPicker.modalPresentationStyle = .fullScreen
        present(documentPicker, animated: true, completion: nil)
    }
    
    

}

extension ImportProductsViewController: UIDocumentPickerDelegate {
    ///Función para que al seleccionar un archivo en el document picker, se convierta a String y se llame al servicio para enviar los productos relacionados a la donación al endpoint
    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {

        if let url = urls.first {
            let fileTool = FileTool()
            
            do {
                
                let readJson = try fileTool.readFileAsString(url)
                print("JSON: \(String(describing: readJson))")
                
                createDonationService.sendProducts(file: readJson, idDonation: String(self.idDonation!)) { (response) in
                    print(response)
                    
                if(response == 200){
                    DispatchQueue.main.async {
                let alertController = UIAlertController(title: "Éxito", message: "Importación de productos completada", preferredStyle: UIAlertController.Style.alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler:{(action: UIAlertAction!) in
                                
                                let controller = self.storyboard?.instantiateViewController(withIdentifier: "HomeDonorViewController") as! HomeDonorViewController
                                    self.present(controller, animated: true, completion: nil)
                                                                
                                                            
                    }))
                self.present(alertController, animated: true, completion: nil)
                    }
                }else{
                    DispatchQueue.main.async {
                let alertController2 = UIAlertController(title: "Fallo", message: "Lo sentimos, la importación de productos no pudo ser completada", preferredStyle: UIAlertController.Style.alert)
                    alertController2.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler:{(action: UIAlertAction!) in
                                
                                let controller = self.storyboard?.instantiateViewController(withIdentifier: "HomeDonorViewController") as! HomeDonorViewController
                                    self.present(controller, animated: true, completion: nil)
                                                                
                                                            
                    }))
                self.present(alertController2, animated: true, completion: nil)
                    }
                    
                }
                    
                    
                }
            
            } catch {
                print("error trying to convert data to JSON")
            }
            
           
        }

        controller.dismiss(animated: true)
    }
    
    public func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        controller.dismiss(animated: true)
    }
}


