//
//  Pokemon.swift
//  Pokedex
//
//  Created by Andressa Neumann Silva on 18/01/23.
//

import Foundation

struct PokemonImage: Decodable {
    var id: Int
    var sprites: Sprites
}

struct Sprites: Decodable {
    var front_default: String
    var back_default: String
}
