//
//  BreedsListView.swift
//  cats
//
//  Created by Lukáš Frajt on 09.06.2023.
//

import SwiftUI


struct BreedsListView: View {
    @StateObject var viewModel = BreedsListViewModel()
    @State private var displayMode: DisplayMode = .list
    
    let gridItems: [GridItem] = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    
    
    func makeList() -> some View {
        LazyVStack(alignment: .leading, spacing: 12) {
            ForEach(viewModel.catImages) { catImage in
                NavigationLink(destination: BreedDetailView(viewModel: BreedDetailViewModel(catImage: catImage))) {
                    BreedsListItemView(catImage: catImage)
                }
            }
        }
        .padding(.horizontal, 16)
    }
    
    func makeGrid() -> some View {
        LazyVGrid(columns: gridItems, spacing: 10) {
            ForEach(viewModel.catImages) { catImage in
                NavigationLink(destination: BreedDetailView(viewModel: BreedDetailViewModel(catImage: catImage))) {
                    BreedsGridItemView(catImage: catImage)
                }
            }
        }
        .padding(.horizontal, 10)
    }
    
    var body: some View {
        ZStack {
            ScrollView {
                switch viewModel.state {
                case .initial, .loading:
                    ProgressView()
                case .fetched:
                    switch displayMode {
                    case .list:
                        makeList()
                    case .grid:
                        makeGrid()
                    }
                case .failed:
                    Text("Something went wrong 😕")
                }
            }
        }
        .navigationTitle("Čičani")
        .toolbar {
            ToolbarItem {
                Button {
                    toggleDisplayMode()
                } label: {
                    displayMode.image
                }
            }
        }
        .onFirstAppear {
            Task {
                await viewModel.load()
            }
        }
    }
    
    func toggleDisplayMode() {
        withAnimation {
            displayMode.toggle()
        }
    }
}

extension BreedsListView {
    enum DisplayMode {
        case list
        case grid
        
        var image: Image {
            switch self {
            case .list:
                return Image(systemName: "square.grid.3x3")

            case .grid:
                return Image(systemName: "list.dash")
            }
        }
        
        mutating func toggle() {
            switch self {
            case .list:
                self = .grid
            case .grid:
                self = .list
            }
        }
    }
}
