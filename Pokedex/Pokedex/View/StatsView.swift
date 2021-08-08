//
//  StatsView.swift
//  StatsView
//
//  Created by Larissa Uchoa on 08/08/21.
//

import SwiftUI

struct StatsView: View {
    var pokemon: Pokemon
    var statsName: String
    var statsColor: Color
    var statsValue: Int

    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Text(statsName)
                .font(.system(.body, design: .monospaced))
                .fontWeight(.medium)
                .frame(width: 80, alignment: .leading)

            Text("\(statsValue)")
                .font(.system(.body, design: .monospaced))
                .fontWeight(.semibold)
                .frame(width: 50, alignment: .leading)

            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.gray).opacity(0.35)
                    .frame(width: 180, height: 20)

                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(statsColor)
                    .frame(width: statsValue <= 100 ? 180 * (CGFloat(statsValue) / 100) : 180, height: 20)
            }
        }
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView(pokemon: PokemonViewModel().MOCK_POKEMON, statsName: "Attack", statsColor: .red, statsValue: 55)
    }
}
