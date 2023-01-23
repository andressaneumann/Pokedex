//
//  RowView.swift
//  Pokedex
//
//  Created by Andressa Neumann Silva on 19/01/23.
//

import SwiftUI

struct RowView: View {
    let cards: [PokemonCard]
    let width: CGFloat
    let height: CGFloat
    let horizontalSpacing: CGFloat
    var body: some View {
        HStack(spacing: horizontalSpacing) {
            ForEach(cards) { card in
                PokemonCardView(title: card.title)
                    .frame(width: width, height: height)
            }
        }
        .padding()
    }
}
