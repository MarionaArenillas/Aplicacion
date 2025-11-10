//
//  ContentView.swift
//  Aplicacion
//
//  Created by alumne on 27/10/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").ignoresSafeArea() // eliminar el margen superior
            
            VStack(spacing: 20) {
                Text("🎯🎯🎯")
                    .font(.largeTitle)
                
                Text("89")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .kerning(-1)
                
                SliderView(value: $sliderValue, lowValue: 1, highValue: 100)
                
                Text("Slider value tracking \(Int(sliderValue))")
                
                Button("TRY") {
                    alertIsVisible = true
                }
                .padding()
                .font(.title3)
                .foregroundColor(.white)
                .background(Color.accentColor)
                .cornerRadius(21)
                .alert(isPresented: $alertIsVisible) {
                    Alert(
                        title: Text("Hello"),
                        message: Text("This is my first alert"),
                        dismissButton: .default(Text("Got it"))
                    )
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SliderView: View {
    @Binding var value: Double
    let lowValue: Double
    let highValue: Double
    
    var body: some View {
        HStack {
            Text("\(Int(lowValue))").fontWeight(.bold)
            Slider(value: $value, in: lowValue...highValue)
            Text("\(Int(highValue))").fontWeight(.bold)
        }
        .padding(.horizontal)
    }
}
