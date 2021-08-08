//
//  PokemonCell.swift
//  PokemonCell
//
//  Created by Larissa Uchoa on 08/08/21.
//

import SwiftUI

struct PokemonCell: View {
    @State var pokemon: Pokemon

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(pokemon.name.capitalized)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                Text(pokemon.type.capitalized)
                    .italic()
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 4, leading: 12, bottom: 4, trailing: 12))
                    .background(
                        Capsule()
                            .foregroundColor(.white.opacity(0.25))
                    )
            }

            Spacer()

            PokemonImage(url: pokemon.imageUrl, width: 70, height: 70)
        }
        .padding(EdgeInsets(top: 5, leading: 16, bottom: 5, trailing: 16))
    }
}

//struct PokemonCell_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonCell()
//    }
//}
