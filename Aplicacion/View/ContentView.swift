import SwiftUI

struct ContentView: View {
    
    //@State var game = Game()
    @EnvironmentObject var gameStore:GameStore
    
    @State var alertIsVisible = false
    @State var sliderValue = (Game.highNumber-Game.lowNumber) / 2
    
    var body: some View {
        ZStack {
            BackgroundView().ignoresSafeArea()
            
            VStack{
                Text("🎯🎯🎯").font(.largeTitle)
                Text("\(gameStore.game.guessNumber)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .kerning(-1)
                
                SliderView(value: $sliderValue, lowValue: Game.lowNumber, highValue: Game.highNumber)
                
                Text("Slider value tracking \(sliderValue)")
                Button("TRY") {
                    alertIsVisible = true
                    gameStore.calculatePoints(value: sliderValue)
                    // self.game.calculatePoints(sliderValue: sliderValue)
                    
                }
                .padding()
                .font(.title3)
                .foregroundColor(.white)
                .background(Color.accentColor)
                .cornerRadius(21)
            }
        }.alert(isPresented: $alertIsVisible){
            Alert(title: Text("Congratulations"),
                  message: Text("Your points are \(gameStore.game.points)"),
                  dismissButton: .default(Text("OK")){
                    //game.restart()
                    gameStore.restart()
                    sliderValue = (Game.highNumber-Game.lowNumber)/2
                  }
            )
         }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().environmentObject(GameStore())
        }
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
