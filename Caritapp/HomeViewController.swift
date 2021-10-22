//
//  HomeViewController.swift
//  Caritapp
//
//  Created by user189928 on 9/14/21.
//

import UIKit
import UniformTypeIdentifiers


class HomeViewController: UIViewController {
    
    let calendarService = CalendarService()
    let verificarMercanciaService = VerificarMercanciaService()
    let entregasService = EntregasService()



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
                    controller.donacion = donation
                    
                    controller.tableView.reloadData()
                }
            }
            
        }
        
        if segue.identifier == "statusSegue" {
            let controller = (segue.destination as! EstatusDonationViewController)
            
            calendarService.retrieveCalendar() {
                (donation) in
                DispatchQueue.main.async {
                    controller.historyStatus = donation
                    controller.tableViewStatus.reloadData()
                }
            }

            
        }
        
        if segue.identifier == "entregasSegue" {
            let controller = (segue.destination as! EntregasViewController)
            
            entregasService.retrieveEntregas() {
                (entregas) in
                DispatchQueue.main.async {
                    controller.entrega = entregas
                    controller.tableView.reloadData()
                }
            }

            
        }
        
        
        
        if segue.identifier == "verificarMercancia" {
            let controller = (segue.destination as! ListDonationViewController)
            
            verificarMercanciaService.retrieveDonations() {
                (donations) in
                self.verificarMercanciaService.retrieveDonationsId { (idDonations) in
                    DispatchQueue.main.async {
                        controller.history = donations
                        controller.idDonations = idDonations
                        controller.tableView.reloadData()
                    }
                }
                
            }
            
        }
        
        
    }


}
