//
//  PokemonImage.swift
//  Pokedex
//
//  Created by Andressa Neumann Silva on 23/01/23.
//

import SwiftUI
import NukeUI

struct PokemonImage: View {
    @ObservedObject var viewModel = ViewModel()
    var imageLink = ""
    @State private var pokemonSprite = ""
    
    var body: some View {
        LazyImage(source: pokemonSprite, resizingMode: .aspectFill)
            .frame(width: 75,height: 75)
            .clipShape(Circle())
            .onAppear {
                self.getSprite(url: imageLink)
            }
    }
    
    func getSprite(url: String) {
        var tempSprite: String?
        viewModel.fetchPokemonDetails(url: url) { sprite in
            tempSprite = sprite.front_default
            self.pokemonSprite = tempSprite ?? "placeholder"
        }
    }
}

extension PokemonImage {
    class ViewModel: ObservableObject {
        
        func fetchPokemonDetails(url: String, completion: @escaping (Sprites) -> ()) {
            guard let url = URL(string: url) else { return }
            
            URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                DispatchQueue.main.async {
                    if let data = data {
                        do {
                            let decoder = JSONDecoder()
                            let decodedData = try decoder.decode(Pokemon.self, from: data)
                            
                            completion(decodedData.sprites)
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
        PokemonImage()
    }
}
