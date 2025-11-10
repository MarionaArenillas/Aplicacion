//
//  ContentView.swift
//  Aplicacion
//
//  Created by alumne on 27/10/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color
                ("BackgroundColor")
                .ignoresSafeArea() // eliminar el margen superior
            VStack{
                Text("🎯🎯🎯").font(.largeTitle)
                Text("89")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .kerning(-1)
                
                HStack{
                    Text("1").fontWeight(.bold)
                    Slider(value: .constant(50),
                           in: 1...100)
                    Text("100").fontWeight(.bold)
                }.padding(.horizontal)
                
                Button("TRY"){}
                    .padding()
                    .font(.title3)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(21)
            }// .background(Color()) --> acabar la proxima classe
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
