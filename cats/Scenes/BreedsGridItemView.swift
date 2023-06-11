//
//  BreedsGridItemView.swift
//  cats
//
//  Created by Lukáš Frajt on 11.06.2023.
//

import SwiftUI

struct BreedsGridItemView: View {
    let catImage: CatImage
    
    var body: some View {
        AsyncImage(
            url: catImage.url) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } placeholder: {
                ProgressView()
            }
    }
}
