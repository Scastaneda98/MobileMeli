//
//  Products.swift
//  MeliMobileChallenge
//
//  Created by Santiago Castañeda on 17/09/24.
//

import Foundation

public struct Products: Codable {
    let siteID: SiteID
    let query: String
    let items: [Item]
    
    enum CodingKeys: String, CodingKey {
        case siteID = "site_id"
        case query
        case items = "results"
    }
    
}
