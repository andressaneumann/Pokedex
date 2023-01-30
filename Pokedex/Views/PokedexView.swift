//
//  ContentView.swift
//  Pokedex
//
//  Created by Andressa Neumann Silva on 18/01/23.
//

import SwiftUI

struct PokedexView: View {
    @StateObject var viewModel = PokedexViewModel()
    @State var searchText = ""

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    let height: CGFloat = 120
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 8) {
                    ForEach(viewModel.pokemonList.results) { pokemon in
                        NavigationPokemonCard(pokemonName: pokemon.name, url: pokemon.url)
                            .frame(height: height)
                    }
                }
                .padding()
            }
            .onAppear {
                viewModel.fetchPokemonList()
            }
            .navigationTitle("PokedexUI")
        }
    }
}

struct PokemondexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
