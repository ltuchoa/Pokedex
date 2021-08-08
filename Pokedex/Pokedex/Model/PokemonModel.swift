//
//  PokemonModel.swift
//  PokemonModel
//
//  Created by Larissa Uchoa on 08/08/21.
//

import SwiftUI

struct Pokemon: Identifiable, Codable {
    let pokeID = UUID()

    let id: Int
    let name: String
    let imageUrl: String
    let type: String
    let description: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case imageUrl
        case type
        case description
    }

    var typeColor: Color {
        switch type {
        case "fire":
            return Color(.systemRed)
        case "poison":
            return Color(.systemGreen)
        case "water":
            return Color(.systemTeal)
        case "electric":
            return Color(.systemYellow)
        case "psychic":
            return Color(.systemPurple)
        case "normal":
            return Color(.systemOrange)
        case "ground":
            return Color(.systemBrown)
        case "flying":
            return Color(.systemBlue)
        case "fairy":
            return Color(.systemPink)
        default:
            return Color(.systemIndigo)
        }
    }
}
