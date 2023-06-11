//
//  PaginatedResponse.swift
//  cats
//
//  Created by Lukáš Frajt on 10.06.2023.
//

import Foundation

struct PaginatedResponse<T: Decodable> {
    let info: PaginationInfo
    let results: [T]
}

extension PaginatedResponse: Decodable {}
