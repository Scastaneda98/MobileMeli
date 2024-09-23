//
//  AppCoordinator.swift
//  MeliMobileChallenge
//
//  Created by Santiago Castañeda on 18/09/24.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
    func showProducts(for query: String)
}

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let searchViewController = SearchViewController()
        searchViewController.coordinator = self
        navigationController.pushViewController(searchViewController, animated: true)
    }
    
    func showProducts(for query: String) {
        let productsViewModel = ProductsViewModel(query: query)
        let productsViewController = ProductsViewController(viewModel: productsViewModel)
        productsViewController.coordinator = self
        navigationController.pushViewController(productsViewController, animated: true)
    }
    
    func showProductDetail(item: Item) {
        let productDetailViewModel = ProductDetailViewModel(item: item)
        let productDetailViewController = ProductDetailViewController(viewModel: productDetailViewModel)
        navigationController.pushViewController(productDetailViewController, animated: true)
    }
}

