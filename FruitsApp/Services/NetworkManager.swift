//
//  NetworkManager.swift
//  FruitsApp
//
//  Created by Alexandr Baranov on 19.11.2023.
//

import Foundation
import Alamofire

enum Link: String {
    case url = "https://www.fruityvice.com/api/fruit/all"
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchFruits(from url: String, completion: @escaping(Result<[Fruit], AFError>) -> Void) {
        AF.request(url, method: .get)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    let fruits = Fruit.getFruits(from: value)
                    completion(.success(fruits))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}



