//
//  BreedsListViewModel.swift
//  cats
//
//  Created by Lukáš Frajt on 09.06.2023.
//

import Foundation

@MainActor final class BreedsListViewModel: ObservableObject {
    
    enum State {
        case initial
        case loading
        case fetched
        case failed
    }
    
    @Injected private var apiManager: APIManager
    
    
    @Published var catImages: [CatImage] = []
    @Published var state: State = .initial
    
    
    
    func load() async {
        state = .loading
        await fetch()
    }
    
    
    func fetch() async {
        
        do {
            
            let endpoint = ImageEndponint.getImages
            
            let response: [CatImage] = try await apiManager.request(endpoint: endpoint)
            
            catImages += response
            
            state = .fetched
        } catch {
            
            if let error = error as? URLError, error.code == .cancelled {
                Logger.log("URL request was cancelled", .info)
                
                state = .fetched
                
                return
            }
            print("fuck")
            debugPrint(error)
            state = .failed
        }
    }

}
