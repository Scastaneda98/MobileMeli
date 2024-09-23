//
//  SiteID.swift
//  MeliMobileChallenge
//
//  Created by Santiago Castañeda on 17/09/24.
//

enum SiteID: String, Codable {
    case argentina = "MLA"
    case chile = "MLC"
    case mexico = "MLM"
    case brasil = "MLB"
    
    static func fromCountryCode(_ code: String) -> SiteID? {
        switch code {
        case "AR": return .argentina
        case "MX": return .mexico
        case "BR": return .brasil
        case "CL": return .chile
        default: return .argentina
        }
    }
}
