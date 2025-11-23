import SwiftUI

struct ContentView: View {
    
    //@State var game = Game()
    // Accés al GameStore compartit per tota l'app
    @EnvironmentObject var gameStore:GameStore
    
    // Controla si es mostra l'alerta
    @State var alertIsVisible = false
    
    // Valor inicial del slider (a la meitat del rang)
    @State var sliderValue = (Game.highNumber-Game.lowNumber) / 2
    
    var body: some View {
        ZStack {
            
            // Fons personalitzat de l'app
            BackgroundView().ignoresSafeArea()
            
            VStack{
                Text("🎯🎯🎯").font(.largeTitle)
                
                // Número que el jugador ha d'encertar
                Text("\(gameStore.game.guessNumber)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .kerning(-1)
                
                // Slider per escollir el valor
                SliderView(value: $sliderValue, lowValue: Game.lowNumber, highValue: Game.highNumber)
                
                // Mostra el valor del slider en tems real
                Text("Slider value tracking \(sliderValue)")
                
                // Botó principal del joc
                Button("TRY") {
                    alertIsVisible = true // mostra l'alerta
                    gameStore.calculatePoints(value: sliderValue) // Calcula punt i suma rondes
                    // self.game.calculatePoints(sliderValue: sliderValue)
                }
                .padding()
                .font(.title3)
                .foregroundColor(.white)
                .background(Color.accentColor)
                .cornerRadius(21)
            }
        }
        // Alerta que mostra els punts aconseguits
        .alert(isPresented: $alertIsVisible){
            Alert(title: Text("Congratulations"),
                  message: Text("Your points are \(gameStore.game.points)"),
                  dismissButton: .default(Text("OK")){
                    //game.restart()
                
                    // Reinicia només la ronda i el target del joc
                    gameStore.restart()
                
                    // Torna el slider al valor del mig
                    sliderValue = (Game.highNumber-Game.lowNumber)/2
                  }
            )
         }
    }
}

/*
 Previsualització utilitzada per Xcode per mostrar la vista al canvas.
 No s'executa a l'app real. Serveix per provar la Interficie de l'Usuari mentre programes.
 S'injecta un GameStore perquè la vista funcioni igual que en execució real. 
 */
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().environmentObject(GameStore())
        }
    }
}


// Vista personalitzada que mostra un Slider amb el valor mínim i màxim.
// Rep el valor del Slider com a @Binding per poder modificar la variable del ContentView
struct SliderView: View {
    
    // Enllaça el valor del Slider amb una variable externa (ContentView)
    @Binding var value: Double
    
    // Limits inferior i superior del Slider
    let lowValue: Double
    let highValue: Double
    
    var body: some View {
        HStack {
            // Mostra el valor mínim
            Text("\(Int(lowValue))").fontWeight(.bold)
            // Slider que es mou dins del rang indicat
            Slider(value: $value, in: lowValue...highValue)
            // Mostra el valor màxim
            Text("\(Int(highValue))").fontWeight(.bold)
        }
        .padding(.horizontal)
    }
}
