//
//  PokemonDetails.swift
//  Pokedex
//
//  Created by Andressa Neumann Silva on 27/01/23.
//

import Foundation

struct PokemonDetails: Decodable {
    var id: Int
    var name: String
    var abilities: [Abilities]
    var types: [Types]
}

struct Abilities: Decodable {
    var ability: Ability
}

struct Ability: Decodable {
    var name: String
    var url: String
}

struct Types: Decodable {
    var type: `Type`
}

struct `Type`: Decodable {
    var name: String
    var url: String
}
