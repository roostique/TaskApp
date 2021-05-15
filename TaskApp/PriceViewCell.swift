//
//  PriceViewCell.swift
//  TaskApp
//
//  Created by Rustem Supayev on 15.05.2021.
//

import UIKit

class PriceViewCell: UITableViewCell {
    
    let pricesObj = ViewController()
    
    @IBOutlet weak var itemLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        for i in pricesObj.prices.enumerated() {
            priceLbl.text = "Item: \(i)"
        }
       
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
