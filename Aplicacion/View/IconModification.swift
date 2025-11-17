//
//  IconModification.swift
//  Aplicacion
//
//  Created by alumne on 17/11/2025.
//

import Foundation
import SwiftUI

struct BackgroundView: View {
    let game: Game
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Button(action: {
                        game.restart()
                    }) {
                        RoundedImageView(imageName: "arrow.clockwise")
                    }
                    
                    Spacer()
                    
                    RoundedImageView(imageName: "list.dash")
                }
                
                Spacer()
                
                HStack {
                    RoundedTextView(text: "SCORE", value: game.score)
                    Spacer()
                    RoundedTextView(text: "ROUND", value: game.round)
                }
            }
            .padding()
        }
    }
}

struct RoundedTextView: View {
    let text: String
    let value: Int
    
    var body: some View {
        VStack {
            Text(text)
                .font(.caption)
                .foregroundColor(.secondary)
            
            Text("\(value)")
                .font(.title2)
                .bold()
                .frame(width: 56, height: 56)
                .overlay(Circle().stroke(lineWidth: 2))
        }
    }
}

struct RoundedImageView: View {
    let imageName: String
    
    var body: some View {
        Image(systemName: imageName)
            .font(.title)
            .frame(width: 56, height: 56)
            .overlay(Circle().stroke(lineWidth: 2))
            .foregroundColor(.primary)
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: Game())
    }
}
