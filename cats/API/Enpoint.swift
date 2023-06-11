//
//  Enpoint.swift
//  cats
//
//  Created by Lukáš Frajt on 09.06.2023.
//

import Foundation

protocol Endpoint {
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String] { get }
    var urlParameters: [String: String] { get }
    
    func asURLRequest() throws -> URLRequest
}

extension Endpoint {
    var method: HTTPMethod {
        .get
    }
    
    var headers: [String: String] {
        [:]
    }
    
    var urlParameters: [String: String] {
        [:]
    }
    
    func asURLRequest() throws -> URLRequest {
        
        let url = Constants.baseAPIUrl.appendingPathComponent(path)

        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            throw APIError.invalidUrlComponents
        }

        if !urlParameters.isEmpty {
            urlComponents.queryItems = urlParameters.map { URLQueryItem(name: $0, value: String(describing: $1)) }
        }

        guard let url = urlComponents.url else {
            throw APIError.invalidUrlComponents
        }

        var request = URLRequest(url: url)
        print(request)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        request.setValue(Constants.apiKey, forHTTPHeaderField: "x-api-key")
        request.setValue(
            HTTPHeader.ContentType.json.rawValue,
            forHTTPHeaderField: HTTPHeader.HeaderField.contentType.rawValue
        )

        return request
    }
}
