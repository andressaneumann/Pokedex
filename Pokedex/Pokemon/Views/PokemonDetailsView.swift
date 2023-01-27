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
        Text("Pokemon Details here")
    }
}

extension PokemonDetailsView {
    class ViewModel: ObservableObject {
        func fetchPokemonDetails(url: String, completion: @escaping (PokemonDetails) -> ()) {
            guard let url = URL(string: url) else { return }
            
            URLSession.shared.dataTask(with: url) { data, _, error in
                DispatchQueue.main.async {
                    if let data = data {
                        do {
                            let decoder = JSONDecoder()
                            let decodedData = try decoder.decode(PokemonDetails.self, from: data)
                            
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
