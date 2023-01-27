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
    
    var body: some View {        
        NavigationView {
            List {
                ForEach(searchText == "" ? viewModel.pokemonList.results : viewModel.pokemonList.results.filter( {$0.name.contains(searchText.lowercased())} )) { entry in

                    HStack {
                        PokemonImageView(imageLink: "\(entry.url)")
                            .padding(.trailing, 20)
                        NavigationLink("\(entry.name)".capitalized,
                                       destination: PokemonDetailView())
                    }
                }
            }
            .onAppear {
                viewModel.fetchPokemonList()
            }
            .searchable(text: $searchText)
            .navigationTitle("PokedexUI")
        }
    }
}

struct PokemondexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
