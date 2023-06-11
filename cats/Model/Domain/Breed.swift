//
//  Breed.swift
//  cats
//
//  Created by Lukáš Frajt on 09.06.2023.
//

import Foundation

struct Breed: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case weight
        case temperament
        case description
        case origin
        case life_span
        case wikipedia_url
    }
    
    let id: String
    let weight: [String:String]
    let name: String
    let temperament: String
    let description: String
    let origin: String
    let life_span: String
    let wikipedia_url: String?
}

extension Breed: Identifiable {}
extension Breed: Equatable {}
