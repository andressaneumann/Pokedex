//
//  PokeViewModel.swift
//  Pokedex
//
//  Created by Andressa Neumann Silva on 18/01/23.
//

import Foundation

class PokedexViewModel: ObservableObject {
    @Published var pokemonList: PokemonList = PokemonList(results: [])
    
    func getPokemonData() {
        let urlString = "https://pokeapi.co/api/v2/pokemon"
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url!) { data, _, error in
            DispatchQueue.main.async {
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let decodedData = try decoder.decode(PokemonList.self, from: data)
                        self.pokemonList = decodedData
                    } catch {
                        print("Something went wrong..." )
                    }
                }
            }
        }.resume()
    }
}
