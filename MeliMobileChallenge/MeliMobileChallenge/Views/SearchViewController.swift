//
//  SearchViewController.swift
//  MeliMobileChallenge
//
//  Created by Santiago Castañeda on 18/09/24.
//

import UIKit

class SearchViewController: BaseViewController, UISearchBarDelegate {
    let searchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSearchBar()
    }
    
    private func setUpSearchBar() {
        searchBar.delegate = self
        searchBar.placeholder = "Buscar productos"
        searchBar.sizeToFit()
        navigationItem.titleView = searchBar
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        guard let query = searchBar.text, !query.isEmpty else { return }
        searchBar.resignFirstResponder()
        coordinator?.showProducts(for: query)
    }
}
