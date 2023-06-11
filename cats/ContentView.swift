//
//  ContentView.swift
//  cats
//
//  Created by Lukáš Frajt on 23.05.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView {
                BreedsListView(viewModel: BreedsListViewModel())
            }
        
        }
        .foregroundColor(.black)
        .preferredColorScheme(.none)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
