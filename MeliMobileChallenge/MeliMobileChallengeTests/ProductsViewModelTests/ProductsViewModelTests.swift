//
//  ProductsViewModelTests.swift
//  MeliMobileChallengeTests
//
//  Created by Santiago Castañeda on 23/09/24.
//

import Combine
import XCTest
@testable import MeliMobileChallenge

final class ProductsViewModelTests: XCTestCase {
    var viewModel: ProductsViewModel!
    var productRepository: ProductRepository!
    var cancellables: Set<AnyCancellable>!
    
    override func setUpWithError() throws {
        productRepository = MockProductRespository()
        cancellables = []
    }

    override func tearDownWithError() throws {
        productRepository = nil
        cancellables = nil
    }

    func testSearchProductWithCorrectData() throws {
        viewModel = ProductsViewModel(productRepository: productRepository, query: "pc")
        viewModel.searchProducts()
        
        let expectation = self.expectation(description: "Products should be loaded")
        viewModel.$products
            .dropFirst()
            .sink { products in
                XCTAssertEqual(products.count, 1)
                XCTAssertEqual(products[0].id, "MLA1128472052")
                expectation.fulfill()
            }
            .store(in: &cancellables)

        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testSearchProductWithEmptyProducts() throws {
        viewModel = ProductsViewModel(productRepository: productRepository, query: "")
        viewModel.searchProducts()
        
        let expectation = self.expectation(description: "Products should be empty")
        viewModel.$isProductsEmpty
            .dropFirst()
            .sink { isEmpty in
                XCTAssertTrue(isEmpty)
                expectation.fulfill()
            }
            .store(in: &cancellables)

        waitForExpectations(timeout: 1.0, handler: nil)
    }
}
