//
//  SecondViewController.swift
//  TaskApp
//
//  Created by Rustem Supayev on 16.05.2021.
//

import UIKit

class SecondViewController: UIViewController {
    
    var itemIndex = ""
    var itemPrice = ""
    
    @IBOutlet weak var itemLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        itemLbl.text = "Item \(itemIndex):"
        priceLbl.text = itemPrice
    }
    
}
