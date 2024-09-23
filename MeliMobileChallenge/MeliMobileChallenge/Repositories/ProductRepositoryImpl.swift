//
//  ProductRepositoryImpl.swift
//  MeliMobileChallenge
//
//  Created by Santiago Castañeda on 20/09/24.
//

class ProductRepositoryImpl: ProductRepository {
    func fetchProducts(query: String, completion: @escaping (Result<Products, APIError>) -> Void) {
        APIClient.shared.fetchData(endpoint: "search", method: .get, parameters: ["q":query]) { (result: Result<Products, APIError>) in
            completion(result)
        }
    }
}
