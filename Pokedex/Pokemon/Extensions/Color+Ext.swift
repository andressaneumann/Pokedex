//
//  Color+Ext.swift
//  Pokedex
//
//  Created by Andressa Neumann Silva on 19/01/23.
//

import SwiftUI

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
