//
//  PokemonImage.swift
//  PokemonImage
//
//  Created by Larissa Uchoa on 08/08/21.
//

import SwiftUI

struct PokemonImage: View {
    var url: String
    var width: CGFloat
    var height: CGFloat

    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image.resizable()
                    .interpolation(.none)
                    .scaledToFill()
                    .frame(width: width, height: height)
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
            case .failure:
                Image(systemName: "photo").resizable()
                    .foregroundColor(.white)
                    .scaledToFill()
                    .frame(width: 75, height: 40)
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
            @unknown default:
                EmptyView()
            }
        }
    }
}
