//
//  MockProductRespository.swift
//  MeliMobileChallengeTests
//
//  Created by Santiago Castañeda on 23/09/24.
//

import MeliMobileChallenge
import Foundation

class MockProductRespository: ProductRepository  {
    
    func fetchProducts(query: String, completion: @escaping (Result<MeliMobileChallenge.Products, MeliMobileChallenge.APIError>) -> Void) {
        
        switch query.lowercased() {
        case "pc":
            let result = mockProductsFromJSON(json: MockProducts.productJSON)
            completion(.success(result!))
        case "":
            let result = mockProductsFromJSON(json: MockProducts.emptyProductJSON)
            completion(.success(result!))
        default:
            let result = mockProductsFromJSON(json: MockProducts.productJSON)
            completion(.success(result!))
        }
    }
    
    private func mockProductsFromJSON(json: String) -> Products? {
        guard let data = json.data(using: .utf8) else { return nil }
        let decoder = JSONDecoder()
        return try? decoder.decode(Products.self, from: data)
    }
}

