//
//  APIError.swift
//  cats
//
//  Created by Lukáš Frajt on 09.06.2023.
//

import Foundation

enum APIError: Error {
    case unaceptableStatusCode
    case decodingFailed(error: Error)
    case invalidUrlComponents
}
