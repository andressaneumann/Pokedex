//
//  PokemonImage.swift
//  Pokedex
//
//  Created by Andressa Neumann Silva on 23/01/23.
//

import SwiftUI

struct PokemonImage: View {
    @StateObject var viewModel = ViewModel()
    var imageLink = ""
    @State private var pokemonSprite = ""
    
    var body: some View {
        AsyncImage(url: URL(string: pokemonSprite))
            .frame(width: 75, height: 75)
            .onAppear {
                let loadedData = UserDefaults.standard.string(forKey: imageLink)
                
                if loadedData == nil {
                    getSprite(url: imageLink)
                    UserDefaults.standard.set(imageLink, forKey: imageLink)
                } else {
                    getSprite(url: loadedData!)
                }
            }
            .clipShape(Circle())
            .foregroundColor(Color.gray.opacity(0.6))
    }
    
    func getSprite(url: String) {
        var tempSprite: String?
        viewModel.fetchPokemonDetails(url: url)
        tempSprite = viewModel.pokemonDetails.sprites.front_default
        self.pokemonSprite = tempSprite ?? "placeholder"
    }
}

extension PokemonImage {
    class ViewModel: ObservableObject {
        @Published var pokemonDetails = Pokemon(id: 1, name: "", sprites: Sprites(front_default: "", back_default: ""))
        
        func fetchPokemonDetails(url: String) {
            guard let url = URL(string: url) else { return }
            
            URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                DispatchQueue.main.async {
                    if let data = data {
                        do {
                            let decoder = JSONDecoder()
                            let decodedData = try decoder.decode(Pokemon.self, from: data)
                            self?.pokemonDetails = decodedData
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
