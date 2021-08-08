//
//  PokemonDetailView.swift
//  PokemonDetailView
//
//  Created by Larissa Uchoa on 08/08/21.
//

import SwiftUI

struct PokemonDetailView: View {
    var pokemon: Pokemon
    @State private var scale: CGFloat = 0

    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 20) {
                ZStack {
                    Rectangle()
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: geo.size.width, height: geo.size.height*0.2)
                        .foregroundColor(pokemon.typeColor)
                        .scaleEffect(scale)

                    PokemonImage(url: pokemon.imageUrl, width: 150, height: 150)
                        .padding(.bottom, -(geo.size.height*0.06))
                }

                VStack(spacing: 10) {
                    Text(pokemon.name.capitalized)
                        .font(.largeTitle)


                    Text(pokemon.type.capitalized)
                        .italic()
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 4, leading: 12, bottom: 4, trailing: 12))
                        .background(
                            Capsule()
                                .foregroundColor(pokemon.typeColor)
                                .shadow(color: pokemon.typeColor, radius: 3)
                        )

                    Text(pokemon.description.replacingOccurrences(of: "\n", with: ""))
                        .font(.body)
                        .padding([.top, .bottom], 16)
                        .padding([.leading, .trailing], 12.3)
                    

                    StatsViewGroup(pokemon: pokemon)
                        .padding()
                }
                .padding(.top, 10)
            }
            .animate {
                scale = 1
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
extension View {
    func animate(using animation: Animation = .easeInOut(duration: 1), _ action: @escaping () -> Void) -> some View {
        onAppear {
            withAnimation(animation) {
                action()
            }
        }
    }
}


struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: PokemonViewModel().MOCK_POKEMON)
            .preferredColorScheme(.dark)
    }
}
