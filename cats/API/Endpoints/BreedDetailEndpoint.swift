//
//  BreedDetailEndpoint.swift
//  cats
//
//  Created by Lukáš Frajt on 09.06.2023.
//

import Foundation

enum BreedDetailEndponint: Endpoint {
    
    case getBreeds(page: Int?)
    
    var path: String {
        switch self {
        case .getBreeds:
            return "breed"
        }
    }
    
    var urlParameters: [String : String] {
        switch self {
        case .getBreeds(let page?):
            return ["page": String(page)]
        case .getBreeds:
            return [:]
        }
        
    }
}
