//
//  NavigationPokemonCard.swift
//  Pokedex
//
//  Created by Andressa Neumann Silva on 30/01/23.
//

import SwiftUI

struct NavigationPokemonCard: View {
    let pokemonName: String
    let url: String
    
    var body: some View {
        NavigationLink(destination: PokemonDetailsView(url: url)) {
            CardView(pokemonName: pokemonName, imageURL: url)
        }
    }
}
