//
//  MainTableViewController.swift
//  FruitsApp
//
//  Created by Alexandr Baranov on 19.11.2023.
//

import UIKit

final class MainTableViewController: UITableViewController {
    private var fruits: [Fruit] = []
    private let networkManager = NetworkManager.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 180
        
        fetchFruit()
    }
    
    private func fetchFruit() {
        networkManager.fetchFruits(from: Link.url.rawValue) { result in
            switch result {
                
            case .success(let fruits):
                self.fruits = fruits
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

// MARK: - TableViewDataSource
extension MainTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fruits.count 
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fruitCell", for: indexPath)
        guard let cell = cell as? FruitCell else { return UITableViewCell() }
        
        let fruit = fruits[indexPath.row]
        cell.configure(fruit: fruit)

        return cell
    }
}
