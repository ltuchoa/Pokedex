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
}
