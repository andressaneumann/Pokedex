//
//  Pokemon.swift
//  Pokedex
//
//  Created by Andressa Neumann Silva on 18/01/23.
//

import Foundation

struct PokemonList: Decodable {
    var results: [PokemonResults]
}

struct PokemonResults: Decodable, Identifiable {
    let id = UUID()
    var name: String
    var url: String
}
