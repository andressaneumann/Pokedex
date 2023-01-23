//
//  Card.swift
//  Pokedex
//
//  Created by Andressa Neumann Silva on 19/01/23.
//

import Foundation

struct PokemonCard: Identifiable {
    var id = UUID()
    
    let title: String
    let url: String
}
