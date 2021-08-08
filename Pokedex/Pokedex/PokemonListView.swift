//
//  PokemonListView.swift
//  Pokedex
//
//  Created by Larissa Uchoa on 08/08/21.
//

import SwiftUI

struct PokemonListView: View {

    var pokemonVM = PokemonViewModel()
    @State private var pokemons = [Pokemon]()

    var body: some View {
        NavigationView {
            List(pokemons) { pokemon in
                PokemonCell(pokemon: pokemon)
                    .background(pokemon.typeColor)
                    .cornerRadius(20)
            }
            .listStyle(.plain)
            .navigationTitle("Pokedex")
        }
        .onAppear {
            Task.init {
                pokemons = try! await pokemonVM.getPokemon()
            }
        }
        .preferredColorScheme(.dark)
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
