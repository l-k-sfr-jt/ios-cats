//
//  ImageEndpoint.swift
//  cats
//
//  Created by Lukáš Frajt on 09.06.2023.
//

import Foundation

enum ImageEndponint: Endpoint {
    
    case getImages
    
    var path: String {
        switch self {
        case .getImages:
            return "images/search"
        }
    }
    
    var urlParameters: [String : String] {
        switch self {
        case .getImages:
            return ["limit": "20", "has_breeds": "1"]
        }
        
    }
}
