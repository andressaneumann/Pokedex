//
//  ContentView.swift
//  Pokedex
//
//  Created by Andressa Neumann Silva on 18/01/23.
//

import SwiftUI

struct PokedexView: View {
    
    @State var pokemonData = PokemonList(results: [Pokemon(name: "name", url: "test.com")])
    
    func getPokemonData() {
        let urlString = "https://pokeapi.co/api/v2/pokemon"
        
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url!) { data, _, error in
            
            DispatchQueue.main.async {
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let decodedData = try decoder.decode(PokemonList.self, from: data)
                        self.pokemonData = decodedData
                    } catch {
                        print("Something went wrong..." )
                    }
                }
            }
        }.resume()
        
    }
    
    var body: some View {
        VStack {
            Button("Refresh data") {self.getPokemonData()}
            Text(pokemonData.results.first?.name ?? "error")
        }
        .padding()
    }
}
