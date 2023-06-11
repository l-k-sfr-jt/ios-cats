//
//  BreedsListItemView.swift
//  cats
//
//  Created by Lukáš Frajt on 09.06.2023.
//

import SwiftUI

struct BreedsListItemView: View {
    let catImage: CatImage
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            AsyncImage(
                url: catImage.url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(8)
                } placeholder: {
                    ProgressView()
                }.padding(.bottom, 8)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(catImage.breeds[0].name)
                    .font(.appItemLargeTitle)
                    .multilineTextAlignment(.leading)
                
                
                Text(catImage.breeds[0].temperament)
                    .font(.appItemDescription)
                    .lineLimit(1)
                Text(catImage.breeds[0].origin)
                    .font(.appItemDescription)
            }
            .padding(.bottom, 16)
        }
    }
}
