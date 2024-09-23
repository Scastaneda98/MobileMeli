//
//  DoubleExtension.swift
//  MeliMobileChallenge
//
//  Created by Santiago Castañeda on 21/09/24.
//

import Foundation

extension Double {
    func formatPrice(currency: String) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: currency)
        
        if let priceFormatter = formatter.string(from: NSNumber(value: self)) {
            return priceFormatter
        }
        return String(self)
    }
}
