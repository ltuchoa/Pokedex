//
//  PokemonViewModel.swift
//  PokemonViewModel
//
//  Created by Larissa Uchoa on 08/08/21.
//

import SwiftUI

class PokemonViewModel: ObservableObject {
    @Published var pokemons = [Pokemon]()

    init() {
        Task.init {
            pokemons = try await getPokemon()
        }
    }

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

    let MOCK_POKEMON = Pokemon(id: 0, name: "Bulbasaur", imageUrl: "https://firebasestorage.googleapis.com/v0/b/pokedex-bb36f.appspot.com/o/pokemon_images%2F2CF15848-AAF9-49C0-90E4-28DC78F60A78?alt=media&token=15ecd49b-89ff-46d6-be0f-1812c948e334", type: "poison", description: "This is a test example of what the text in the description would look like for the given pokemon. This is a test example of what the text in the description would look like for the given pokemon.", attack: 49, defense: 52, height: 10, weight: 98)
}
