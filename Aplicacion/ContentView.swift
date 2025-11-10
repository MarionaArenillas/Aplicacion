//
//  ContentView.swift
//  Aplicacion
//
//  Created by alumne on 27/10/2025.
//

import SwiftUI

struct ContentView: View {
    @State var alertIsVisible = false
    var body: some View {
        ZStack{
            Color("BackgroundColor").ignoresSafeArea() // eliminar el margen superior
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
                
                Button("TRY"){
                    alertIsVisible = true
                }
                    .padding()
                    .font(.title3)
                    .foregroundColor(.white)
                    .background(Color.accentColor)
                    .cornerRadius(21)
                    .alert(isPresented: $alertIsVisible){
                        Alert(title: Text("Hello"),
                              message: Text("This is my first alert"),
                              dismissButton: .default(Text("Got it")))
                    }
            }// .background(Color()) --> acabar la proxima classe
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
