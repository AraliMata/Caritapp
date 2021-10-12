//
//  CalendarioController.swift
//  Caritapp
//
//  Created by user194078 on 9/19/21.
//

import Foundation
import UIKit


/*class CalendarioViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {*/
class CalendarioViewController: UIViewController{
    let calendarService = CalendarService()
    
    @IBOutlet weak var tableView: UITableView!
    var donation : [Donation]? {
        didSet {

        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func verCalendario(_ sender: UIButton) {
        print("button pressed")
        calendarService.retrieveCalendar() {
            (donation) in
            print("Calendar Retreived")
            print(donation)
        }
    }
    }
    
    
    
    
    /*func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return donation?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CalendarTableViewCell {
            let donationLog = donation?[indexPath.row]
            cell.updateCell(conversion: donationLog!)
            return cell
        }

        //cell.textLabel!.text = String(temperatureConversion?.original.value ?? 0) + " " + String(temperatureConversion?.converted.value ?? 0)
        return UITableViewCell()
    }*/
    


