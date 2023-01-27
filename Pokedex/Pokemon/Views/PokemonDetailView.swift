//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Andressa Neumann Silva on 26/01/23.
//

import Foundation
import SwiftUI

struct PokemonDetailView: View {
    @StateObject var viewModel = ViewModel()
    var url = ""
    
    var body: some View {
        Text("Pokemon Details here")
    }
}

extension PokemonDetailView {
    class ViewModel: ObservableObject {
        
    }
}
