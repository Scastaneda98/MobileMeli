//
//  ProductRepository.swift
//  MeliMobileChallenge
//
//  Created by Santiago Castañeda on 20/09/24.
//

import Foundation

public protocol ProductRepository {
    func fetchProducts(query: String, completion: @escaping (Result<Products, APIError>) -> Void)
}
