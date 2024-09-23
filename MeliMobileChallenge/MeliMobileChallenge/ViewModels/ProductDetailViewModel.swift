//
//  ProductDetailViewModel.swift
//  MeliMobileChallenge
//
//  Created by Santiago Castañeda on 21/09/24.
//

import Foundation

class ProductDetailViewModel {
    var item: Item
    
    init(item: Item) {
        self.item = item
    }
    
    func calculateDiscountPercentage() -> Double {
        guard let originalPrice = item.originalPrice, originalPrice > 0 else {
            return 0
        }
        
        let discount = originalPrice - item.price
        return round((discount / originalPrice) * 100)
    }
}
