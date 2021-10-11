//
//  HomeViewController.swift
//  Caritapp
//
//  Created by user189928 on 9/14/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    let calendarService = CalendarService()


    @IBOutlet weak var registrarRecepcion: UIButton!
    
    @IBOutlet weak var verificarMercancia: UIButton!
    
    @IBOutlet weak var historialDonaciones: UIButton!
    
    @IBOutlet weak var calendario: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CalendarioSegue" {
            let controller = (segue.destination as! CalendarioViewController)
            
            calendarService.retrieveCalendar() {
                (donation) in
                DispatchQueue.main.async {
                    controller.donation = donation
                    
                    controller.tableView.reloadData()
                }
            }
            
        }
    }


}
