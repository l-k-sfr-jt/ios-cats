//
//  BreedDetailViewModel.swift
//  cats
//
//  Created by Lukáš Frajt on 09.06.2023.
//

import Foundation

@MainActor final class BreedDetailViewModel: ObservableObject {
    
    enum State {
        case initial
        case loading
        case fetched
        case failed
    }
    
    var catImage: CatImage?
    @Published var state: State = .initial
    
    nonisolated init(catImage: CatImage? = nil) {
        self.catImage = catImage
    }
    
    func fetch() async {
        state = .loading
     
        try! await Task.sleep(for: .seconds(2))
    
        state = .fetched
    }
    
}


