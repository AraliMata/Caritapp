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
    let statusService = StatusService()


    @IBOutlet weak var registrarRecepcion: UIButton!
    
    @IBOutlet weak var verificarMercancia: UIButton!
    
    @IBOutlet weak var historialDonaciones: UIButton!
    
    @IBOutlet weak var calendario: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    //al hacer click en el boton calendario, con identificados de segue entregasSegue, llamar
    //desiganar al controller correspondiente y llamar al servicio entregasService para que
    //recupere la lista de las donaciones registradas
    //pasar la lista al controller y llamar a la funcion reloadData para que se llene la tabla
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
            statusService.retrieveStatus(){
                (status) in DispatchQueue.main.async {
                    controller.newStatus = status
                    controller.tableViewStatus.reloadData()
                }
            }

            
        }
        
        
        //al hacer click en el boton historialDonaciones, con identificados de segue entregasSegue, llamar
        //desiganar al controller correspondiente y llamar al servicio entregasService para que
        //recupere la lista de las entregas registradas
        //pasar la lista al controller y llamar a la funcion reloadData para que se llene la tabla
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
        
        ///BDA-16
        ///Función que manda una lista de donaciones, una lista de ids de donaciones y carga los datos de la tabla de la siguiente pantalla que se verá que es la de ListDonation
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
