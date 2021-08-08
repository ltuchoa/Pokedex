//
//  PokemonListView.swift
//  Pokedex
//
//  Created by Larissa Uchoa on 08/08/21.
//

import SwiftUI
import UIKit

struct PokemonListView: View {
    @ObservedObject var pokemonVM = PokemonViewModel()
    @State private var searchText = ""

    private var filteredPokemon: [Pokemon] {
        if searchText == ""{ return pokemonVM.pokemons }

        return pokemonVM.pokemons.filter {
            $0.name.lowercased()
            .contains(searchText.lowercased())
        }
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(filteredPokemon) { pokemon in
                        NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                            PokemonCell(pokemon: pokemon)
                                .background(pokemon.typeColor)
                                .cornerRadius(20)
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("Pokedex")
            .searchable(text: $searchText)
        }
        .preferredColorScheme(.dark)
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
