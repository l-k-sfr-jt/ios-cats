//
//  APIManager.swift
//  cats
//
//  Created by Lukáš Frajt on 09.06.2023.
//

import Foundation


class APIManager {

    lazy var session: URLSession = {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 30
        
        return URLSession(configuration: config)
    }()
    
    func request<T>(endpoint: Endpoint) async throws -> [T] where T : Decodable {
        
        let request = try endpoint.asURLRequest()
        
        let (data, response) = try await session.data(for: request)
        
        let httpResponse = response as? HTTPURLResponse
        
        debugPrint(String(data: data, encoding: .utf8) )
        
        debugPrint("Finished request: \(response)")
                        
        guard let status =  httpResponse?.statusCode, (200...299).contains(status) else {
            throw APIError.unaceptableStatusCode
        }
        
        let decoder = JSONDecoder()
        
        do {
            let result = try decoder.decode([T].self, from: data)

            return result
        } catch {
            throw APIError.decodingFailed(error: error)
        }
    }
}
