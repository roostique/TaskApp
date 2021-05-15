//
//  ViewController.swift
//  TaskApp
//
//  Created by Rustem Supayev on 15.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var prices = ["100", "200", "90", "", "", "300", "100", "999"]
    lazy var ascPrices: [Int] = prices.compactMap {Int($0) ?? 0}.sorted(by: < )
    lazy var descPrices: [Int] = prices.compactMap {Int($0) ?? 0}.sorted(by: > )
    var filteredPrices: [String]!
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        print(ascPrices)
        print(descPrices)
        
        filteredPrices = prices
        
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let vc = storyboard?.instantiateViewController(identifier: "secondVC") as?
            SecondViewController{
            vc.itemPrice = "$\(filteredPrices[indexPath.row])"
            vc.itemIndex = "\(indexPath.row + 1)"
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPrices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid") as? PriceViewCell
        
        cell?.priceLbl.text = "Item \(indexPath.row + 1): $\(filteredPrices[indexPath.row])"
        return cell ?? UITableViewCell()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredPrices = []
        
        if searchText == "" {
            filteredPrices = prices
            
        }
        else {
            
            for price in prices {
                if price.lowercased().contains(searchText.lowercased()){
                    filteredPrices.append(price)
                }
            }
        }
        self.tableView.reloadData()
        
    }
    
}

extension ViewController: UISearchBarDelegate {
    
}

