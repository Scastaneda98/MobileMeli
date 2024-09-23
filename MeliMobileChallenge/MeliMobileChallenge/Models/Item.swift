//
//  Item.swift
//  MeliMobileChallenge
//
//  Created by Santiago Castañeda on 17/09/24.
//

import Foundation

public struct Item: Codable {
    let id, title: String
    let condition: Condition
    let siteID: SiteID
    let categoryID, domainID: String
    let variationID: String?
    let thumbnail: String
    let currencyID: CurrencyID
    let orderBackend: Int
    let price: Double
    let originalPrice: Double?
    let availableQuantity: Int
        
    enum CodingKeys: String, CodingKey {
        case id, title, condition
        case siteID = "site_id"
        case categoryID = "category_id"
        case domainID = "domain_id"
        case variationID = "variation_id"
        case thumbnail
        case currencyID = "currency_id"
        case orderBackend = "order_backend"
        case price
        case originalPrice = "original_price"
        case availableQuantity = "available_quantity"
    }
}
