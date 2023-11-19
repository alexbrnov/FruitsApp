//
//  Fruit.swift
//  FruitsApp
//
//  Created by Alexandr Baranov on 19.11.2023.
//

import Foundation

struct Fruit: Decodable {
    let name: String
    let family: String
    let order: String
    let genus: String
    
    init(name: String, family: String, order: String, genus: String) {
        self.name = name
        self.family = family
        self.order = order
        self.genus = genus
    }
    
    
    init(fruitData: [String: Any]) {
        name = fruitData["name"] as? String ?? ""
        family = fruitData["family"] as? String ?? ""
        order = fruitData["order"] as? String ?? ""
        genus = fruitData["genus"] as? String ?? ""
    }
    
    static func getFruits(from value: Any) -> [Fruit] {
        guard let fruitsData = value as? [[String: Any]] else { return [] }
        
        var fruits: [Fruit] = []
        
        for fruitData in fruitsData {
            let fruit = Fruit(fruitData: fruitData)
            fruits.append(fruit)
        }
        
        return fruits
    }
    
    
    
    
}

