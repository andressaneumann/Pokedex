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

    var body: some View {
        NavigationView {
            List {
                ForEach(searchText == "" ? viewModel.pokemonList.results : viewModel.pokemonList.results.filter( {$0.name.contains(searchText.lowercased())} )) { entry in
                    
                    PokemonImage(imageLink: "\(entry.url)")
                        .padding(.trailing, 20)
                    
                    HStack {
                        
                        NavigationLink("\(entry.name)".capitalized,
                                       destination: Text("Detail view for \(entry.name)"))
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
