//
//  ViewController.swift
//  TaskApp
//
//  Created by Rustem Supayev on 15.05.2021.
//

import UIKit

class ViewController: UIViewController {
        
    var prices = ["100", "200", "90", "", "", "300", "100"]
    var filteredPrices: [String]!

    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
    }


}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid") as? PriceViewCell
        cell?.itemLbl.text = prices[indexPath.row]
        return cell ?? UITableViewCell()
    }
    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        filteredPrices = []
//
//        if searchText == "" {
//            filteredPrices = prices
//        } else {
//        for price in prices {
//            if price.lowercased().contains(searchText.lowercased()) {
//                prices.append(price)
//            }
//        }
//        }
//        self.tableView.reloadData()
//
//    }

    
}

extension ViewController: UISearchBarDelegate {
    
}

