//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Andressa Neumann Silva on 26/01/23.
//

import Foundation
import SwiftUI

struct PokemonDetailsView: View {
    @StateObject var viewModel = ViewModel()
    var url = ""

    var body: some View {
        
        VStack {
            Text("\(viewModel.pokeDetails.name)")
            ForEach(viewModel.pokeDetails.abilities) { ability in
                Text("\(ability.ability.name)")
            }
        }
        .onAppear {
            viewModel.fetchPokemonDetails(url: url)
        }
    }
}

extension PokemonDetailsView {
    class ViewModel: ObservableObject {
        @Published var pokeDetails = PokemonDetails(id: 1,
                                                    name: "",
                                                    abilities: [],
                                                    types: [],
                                                    stats: [])
        
        func fetchPokemonDetails(url: String) {
            guard let url = URL(string: url) else { return }
            
            URLSession.shared.dataTask(with: url) { data, _, error in
                DispatchQueue.main.async {
                    if let data = data {
                        do {
                            let decoder = JSONDecoder()
                            let decodedData = try decoder.decode(PokemonDetails.self, from: data)
                            
                            self.pokeDetails = decodedData
                        } catch {
                            print("Something went wrong..." )
                        }
                    }
                }
            }.resume()
        }
    }
}
