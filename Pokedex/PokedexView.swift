//
//  ContentView.swift
//  Pokedex
//
//  Created by Andressa Neumann Silva on 18/01/23.
//

import SwiftUI

struct PokedexView: View {
    @ObservedObject var viewModel = PokedexViewModel()
    
    var body: some View {
        VStack {
            Button("Refresh data") {viewModel.getPokemonData()}
            Text(viewModel.pokemonList.results.first?.name ?? "default")
            Text(viewModel.pokemonList.results.first?.url ?? "www.")
        }
        .padding()
    }
}
