//
//  CatImage.swift
//  cats
//
//  Created by Lukáš Frajt on 09.06.2023.
//

import Foundation

struct CatImage: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case width
        case height
        case url
        case breeds
    }
    
    let url: URL
    let id: String
    let breeds: [Breed]
    let width: Int
    let height: Int

}

extension CatImage: Identifiable {}
extension CatImage: Equatable {}
