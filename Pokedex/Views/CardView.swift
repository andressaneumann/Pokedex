//
//  CardView.swift
//  Pokedex
//
//  Created by Andressa Neumann Silva on 30/01/23.
//

import SwiftUI

struct CardView: View {
    let pokemonName: String
    let imageURL: String
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                CustomColor.customGreen
                HStack(alignment: .center) {
                    Text("\(pokemonName.capitalized)")
                        .font(.system(size: 13, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.leading)
                        .fixedSize()
                    PokemonImageView(imageLink: imageURL)
                        .padding(.trailing, -8)
                }
            }
            .cornerRadius(15)
        }
    }
}
