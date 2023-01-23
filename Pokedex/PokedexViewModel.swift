//
//  PokeViewModel.swift
//  Pokedex
//
//  Created by Andressa Neumann Silva on 18/01/23.
//

import Foundation

class PokedexViewModel: ObservableObject {
    @Published var pokemonList: PokemonList = PokemonList(results: [])
    
    func fetchPokemonList() {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon") else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let decodedData = try decoder.decode(PokemonList.self, from: data)
                        self?.pokemonList = decodedData
                    } catch {
                        print("Something went wrong..." )
                    }
                }
            }
        }.resume()
    }
}
