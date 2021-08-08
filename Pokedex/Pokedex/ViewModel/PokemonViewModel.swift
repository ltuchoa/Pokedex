//
//  PokemonViewModel.swift
//  PokemonViewModel
//
//  Created by Larissa Uchoa on 08/08/21.
//

import SwiftUI

class PokemonViewModel {

    func getPokemon() async throws -> [Pokemon] {
        guard let url = URL(string: "https://pokedex-bb36f.firebaseio.com/pokemon.json") else {
            throw FetchError.badUrl
        }

        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw FetchError.badResponse
        }

        guard let data = data.removeNullsFrom(string: "null,") else {
            throw FetchError.badData
        }

        let pokemonData = try JSONDecoder().decode([Pokemon].self, from: data)
        return pokemonData

    }
}
