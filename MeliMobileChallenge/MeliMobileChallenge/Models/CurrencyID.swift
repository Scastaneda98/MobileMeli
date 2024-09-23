//
//  CurrencyID.swift
//  MeliMobileChallenge
//
//  Created by Santiago Castañeda on 17/09/24.
//

import Foundation

enum CurrencyID: String, Codable {
    case ars = "ARS"
    case clp = "CLP"
    case mxm = "MXN"
    case brl = "BRL"
    
    static func fromCountryCode(_ currency: CurrencyID) -> String {
        switch currency {
        case .ars: return "es_AR"
        case .clp: return "es_CL"
        case .mxm: return "es_MX"
        case .brl: return "pt_BR"
        }
    }
}
