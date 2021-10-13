//
//  HomeDonorViewController.swift
//  Caritapp
//
//  Created by user189928 on 9/14/21.
//

import UIKit

class HomeDonorViewController: UIViewController {

    @IBOutlet weak var crearDonacion: UIButton!
    
    @IBOutlet weak var corregirDonacion: UIButton!
    @IBOutlet weak var calendario: UIButton!
    
    let calendarService = CalendarService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Calendario2Segue" {
            let controller = (segue.destination as! CalendarioViewController)
            
            calendarService.retrieveCalendar() {
                (donation) in
                DispatchQueue.main.async {
                    controller.donacion = donation
                    
                    controller.tableView.reloadData()
                }
            }
            
        }
    }


}
