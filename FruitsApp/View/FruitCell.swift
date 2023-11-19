//
//  FruitCell.swift
//  FruitsApp
//
//  Created by Alexandr Baranov on 19.11.2023.
//

import UIKit

final class FruitCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var familyLabel: UILabel!
    @IBOutlet var orderLabel: UILabel!
    @IBOutlet var genusLabel: UILabel!
    
    func configure(fruit: Fruit) {
        nameLabel.text = fruit.name
        familyLabel.text = "family: \(fruit.family)"
        orderLabel.text = "order: \(fruit.order)"
        genusLabel.text = "genus: \(fruit.genus)"
    }
}
