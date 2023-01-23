//
//  ContentView.swift
//  Pokedex
//
//  Created by Andressa Neumann Silva on 18/01/23.
//

import SwiftUI

struct PokedexView: View {
    @StateObject var viewModel = PokedexViewModel()
    
    var columns: [GridItem] = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
        ]

    let height: CGFloat = 150

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(viewModel.pokemonList.results) { pokemon in
                    PokemonCardView(title: pokemon.name)
                        .frame(height: height)
                }
            }
        }
        .onAppear {
            viewModel.fetchPokemonList()
        }
        .padding()
    }
}
