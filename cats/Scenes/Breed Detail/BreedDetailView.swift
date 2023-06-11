//
//  BreedDetailView.swift
//  cats
//
//  Created by Lukáš Frajt on 09.06.2023.
//

import SwiftUI

struct BreedDetailView: View {
    
    @StateObject var viewModel: BreedDetailViewModel
    @State var showWiki = false
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            //BackgroundGradientView()

            ScrollView {
                VStack(spacing: 16) {
                    switch viewModel.state {
                    case .initial:
                        ProgressView()
                    case .loading:
                        ProgressView()
                    case .fetched:
                        if let catImage = viewModel.catImage {
                            makeImage(url: catImage.url, wikiLink: catImage.breeds[0].wikipedia_url ?? "https://en.wikipedia.org/wiki/Cat")
                                .padding(.horizontal, 8)
                            makeInfo(catImage: catImage)
                        }
                        
                    case .failed:
                        Text("Sorry cat detail fetch failed")
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                if let url = viewModel.catImage?.breeds.first!.wikipedia_url {
                    Button("Wiki") {
                        self.showWiki.toggle()
                    }.sheet(isPresented: $showWiki){
                        safari(url: url)
                    }
                }
            }
        }
        .navigationTitle(viewModel.catImage?.breeds[0].name ?? "Cat Detail").padding(.horizontal, 8)
        .onFirstAppear {
            Task {
                await viewModel.fetch()
            }
        }
    }
}


private extension BreedDetailView {
    func makeImage(url: URL?, wikiLink: String) -> some View {
        Link(destination: URL(string: wikiLink)!) {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: .infinity)
        }
    }

    func makeInfo(catImage: CatImage) -> some View {
        let breed = catImage.breeds.first!;
        return VStack(alignment: .leading, spacing: 8) {
            Text("About breed")
                .font(.appSectionTitle)
                .fontWeight(.bold)

            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 8) {
                    makeInfoRow(title: "Description", text: breed.description)
                    makeInfoRow(title: "Origin", text: breed.origin)
                    makeInfoRow(title: "Temperament", text: breed.temperament)
                    makeInfoRow(title: "Life span", text: breed.life_span)
                }
            }
        }
        .padding(.horizontal, 8)
    }

    func makeInfoRow(title: String, text: String) -> some View {
        VStack(alignment: .leading) {
            Text(title).fontWeight(.bold)
            Text(text).font(.appItemDescription)
            Spacer()
        }
    }
}
