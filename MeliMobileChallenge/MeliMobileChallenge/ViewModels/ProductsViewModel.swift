//
//  ProductsViewModel.swift
//  MeliMobileChallenge
//
//  Created by Santiago Castañeda on 20/09/24.
//

import Combine
import Foundation

class ProductsViewModel {
    @Published var products: [Item] = []
    @Published var isLoading: Bool = false
    @Published var isError: Bool = false
    @Published var isProductsEmpty: Bool = false
    private let productRepository: ProductRepository
    let query: String
    
    init(productRepository: ProductRepository = ProductRepositoryImpl(),query: String) {
        self.productRepository = productRepository
        self.query = query
    }
    
    func searchProducts(){
        LogsManager.shared.logInfo("Starting the request to fetch data.", className: String(describing: type(of: self)))
        isLoading = true
        
        productRepository.fetchProducts(query: query) { [weak self] result in
            
            DispatchQueue.main.async {
                switch result {
                case .success(let products):
                    self?.isProductsEmpty = products.items.isEmpty
                    self?.products = products.items
                    LogsManager.shared.logInfo("Data fetched successfully.", className: String(describing: type(of: self)))
                case .failure(let failure):
                    LogsManager.shared.logError("Error fetching data. \(failure.localizedDescription)", className: String(describing: type(of: self)))
                    self?.isError = true
                }
                self?.isLoading = false
            }
        }
    }
    
    func numberOfItems() -> Int {
        return products.count
    }
    
    func item(at index: Int) -> Item {
        return products[index]
    }
}
