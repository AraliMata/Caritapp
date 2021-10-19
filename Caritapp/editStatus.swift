//
//  File.swift
//
//  Created by user193555 on 10/7/21.
//

import UIKit

class editStatus: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        /*if let conversion = detailItem {
            originalLabel.text = String(conversion.original.value) + " " + conversion.original.unit.rawValue
            convertedLabel.text = String(conversion.converted.value) + " " + conversion.converted.unit.rawValue
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYYY-MM-dd"
            dateLabel.text = dateFormatter.string(from: conversion.created)
        }*/
    }
    
    @IBAction func regresarStatusList(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
