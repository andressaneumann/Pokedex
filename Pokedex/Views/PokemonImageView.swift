//
//  PokemonImage.swift
//  Pokedex
//
//  Created by Andressa Neumann Silva on 23/01/23.
//

import SwiftUI
import NukeUI

struct PokemonImageView: View {
    @ObservedObject var viewModel = ViewModel()
    var imageLink = ""
    @State private var pokemonSprite = ""
    
    var body: some View {
        LazyImage(source: pokemonSprite, resizingMode: .aspectFill)
            .frame(width: 80, height: 80)
            .onAppear {
                self.getSprite(url: imageLink)
            }
    }
    
    func getSprite(url: String) {
        var tempSprite: String?
        viewModel.fetchPokemonImage(url: url) { pokemon in
            tempSprite = pokemon.sprites.front_default
            self.pokemonSprite = tempSprite ?? "placeholder"
        }
    }
}

extension PokemonImageView {
    class ViewModel: ObservableObject {
        func fetchPokemonImage(url: String, completion: @escaping (PokemonImage) -> ()) {
            guard let url = URL(string: url) else { return }
            
            URLSession.shared.dataTask(with: url) { data, _, error in
                DispatchQueue.main.async {
                    if let data = data {
                        do {
                            let decoder = JSONDecoder()
                            let decodedData = try decoder.decode(PokemonImage.self, from: data)
                            
                            completion(decodedData)
                        } catch {
                            print("Something went wrong..." )
                        }
                    }
                }
            }.resume()
        }
    }
}

struct PokemonImage_Previews: PreviewProvider {
    static var previews: some View {
        PokemonImageView()
    }
}
