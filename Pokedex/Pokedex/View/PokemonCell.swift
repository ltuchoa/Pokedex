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
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white.opacity(0.25))
                    )
            }

            Spacer()

            AsyncImage(url: URL(string: pokemon.imageUrl)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image.resizable()
                        .interpolation(.none)
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                case .failure:
                    Image(systemName: "photo").resizable()
                        .foregroundColor(.white)
                        .scaledToFit()
                        .frame(width: 75, height: 40)
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                @unknown default:
                    EmptyView()
                }
            }
        }
        .padding(EdgeInsets(top: 5, leading: 16, bottom: 5, trailing: 16))
    }
}

//struct PokemonCell_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonCell()
//    }
//}
