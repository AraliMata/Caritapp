import UIKit
import UniformTypeIdentifiers

class ImportProductsViewController: UIViewController {
    let createDonationService = CreateDonationService()
    
    var idDonation: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Seungdo id:", idDonation!)
        // Do any additional setup after loading the view.
        
    }
    
    
    
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
    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {

        if let url = urls.first {
            let fileTool = FileTool()
            
            do {
                
                let readJson = try fileTool.readFileAsString(url)
                print("JSON: \(String(describing: readJson))")
                
                createDonationService.sendProducts(file: readJson, idDonation: String(self.idDonation!)) { (response) in
                    print(response)
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


