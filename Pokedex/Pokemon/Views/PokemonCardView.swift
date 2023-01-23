//
//  PokemonCardView.swift
//  Pokedex
//
//  Created by Andressa Neumann Silva on 19/01/23.
//

import SwiftUI

struct PokemonCardView: View {
    let title: String
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 12).foregroundColor(.random)
            Text(title)
                .font(.title2)
        }
    }
}

struct PokemonCardView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCardView(title: "Hello world")
    }
}
