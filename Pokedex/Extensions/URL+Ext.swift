//
//  URL+Ext.swift
//  Pokedex
//
//  Created by Andressa Neumann Silva on 27/01/23.
//

import Foundation

extension URL {
    static var pokemonEndpoint: URL {
        URL(string: "https://pokeapi.co/api/v2/pokemon")!
    }
}
