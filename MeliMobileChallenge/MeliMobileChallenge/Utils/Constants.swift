//
//  Constants.swift
//  MeliMobileChallenge
//
//  Created by Santiago Castañeda on 23/09/24.
//

import Foundation

struct Constants {
    struct FontSize {
        static let s: CGFloat = 12.0
        static let m: CGFloat = 16.0
        static let l: CGFloat = 20.0
        static let xl: CGFloat = 24.0
    }
    
    struct Spacing {
        struct Positive {
            static let xs: CGFloat = 4.0
            static let s: CGFloat = 8.0
            static let m: CGFloat = 16.0
            static let l: CGFloat = 32.0
            static let xl: CGFloat = 64.0
        }
        
        struct Negative {
            static let xss: CGFloat = -4.0
            static let s: CGFloat = -8.0
            static let m: CGFloat = -16.0
            static let l: CGFloat = -32.0
            static let xl: CGFloat = -64.0
        }
    }
    
    struct Height {
        static let xs: CGFloat = 100.0
        static let s: CGFloat = 150.0
        static let m: CGFloat = 200.0
        static let l: CGFloat = 250.0
        static let xl: CGFloat = 300.0
    }
    
    struct ImageSize {
        static let thumbnail: CGFloat = 50.0
        static let medium: CGFloat = 100.0
        static let large: CGFloat = 200.0
    }
    
    struct ViewStyle {
        static let cornerRaidus: CGFloat = 12.0
        static let borderWidth: CGFloat = 1.0
    }
}
