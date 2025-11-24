import SwiftUI

struct BackgroundView: View {
    //@Binding var game:Game
    
    // Accés al GameStore compartit per tota l'app (conté score, rouns...)
    @EnvironmentObject var gameStore:GameStore
    
    // Binding per obrir/tancar la pantalla de marks
    @Binding var showMarks:Bool
    
    var body: some View {
        ZStack {
            // Color del fons personalitzat
            Color("BackgroundColor")
            VStack {
                HStack {
                    // Botó per reiniciar tota la partida (score, rounds, numero aleatori...)
                    Button(action:{gameStore.restartGame()}) {
                        RoundedImageView(imageName: "arrow.clockwise")
                    }
                    
                    Spacer()
                    
                    // Botó que mostra la segona pantalla
                    Button(action:{showMarks = true}) {
                        RoundedImageView(imageName: "list.dash")
                    }
                }
                
                Spacer()
                HStack {
                    // Mostra la puntuació total acumulada
                    RoundedTextView(text: "SCORE", value: gameStore.game.score)
                    Spacer()
                    
                    // Mostra el numero de rondes jugades
                    RoundedTextView(text: "ROUND", value: gameStore.game.rounds)
                }
            }.padding()
        }
    }
}

struct RoundedTextView: View {
    let text: String    // Títol: ROUND, SCORE...
    let value: Int      // Valor numèric a mostrar
    
    var body: some View {
        VStack {
            Text(text)
            Text("\(value)")
                .frame(width: 66, height: 66)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke())
        }
    }
}

struct RoundedImageView: View {
    let imageName: String   // Nom del símbol SF Symbol
    
    var body: some View {
        Image(systemName: imageName)
            .font(.title)
            .frame(width: 56, height: 56)
            .overlay(Circle().stroke())
            .foregroundColor(.primary)
    }
}

// Previsualització per XCode, no per l'app real. Permet veure com queda el fons i les targetes
struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(showMarks: .constant(false)).environmentObject(GameStore())
    }
}
