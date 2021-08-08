//
//  StatsViewGroup.swift
//  StatsViewGroup
//
//  Created by Larissa Uchoa on 08/08/21.
//

import SwiftUI

struct StatsViewGroup: View {
    var pokemon: Pokemon

    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            StatsView(pokemon: pokemon, statsName: "Attack", statsColor: .red, statsValue: pokemon.attack)
            StatsView(pokemon: pokemon, statsName: "Defense", statsColor: .blue, statsValue: pokemon.defense)
            StatsView(pokemon: pokemon, statsName: "Height", statsColor: .orange, statsValue: pokemon.height)
            StatsView(pokemon: pokemon, statsName: "Weight", statsColor: .purple, statsValue: pokemon.weight)
        }
    }
}

struct StatsViewGroup_Previews: PreviewProvider {
    static var previews: some View {
        StatsViewGroup(pokemon: PokemonViewModel().MOCK_POKEMON)
    }
}
