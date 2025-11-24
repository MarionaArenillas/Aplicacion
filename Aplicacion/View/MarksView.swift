import SwiftUI

// Formatador d'hora curt ("7:03 PM") per mostrar la data de cada marca
private let markDateFormatter: DateFormatter = {
    let df = DateFormatter()
    df.timeStyle = .short
    return df
}()

// Vista que mostra la segona pantalla amb el rànquing de les 5 millors puntuacions
struct MarksView: View {
    // Accés al GameStore per llegir les marques guardades
    @EnvironmentObject var gameStore: GameStore
    
    // Binding per permetre tancar aquesta pantalla des del botó "Close"
    @Binding var showMarks: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            // Capçalera amb el títol i el botó de tancar
            HStack {
                Text("MARKS")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer()
                
                // Tancar la pantalla de marques
                Button("Close") {
                    showMarks = false
                }.foregroundColor(.red)
            }
            .padding()
            
            // Llista de les 5 millors puntuacions guardades
            List {
                // Enumerated permet obtenir (posició, marca)
                ForEach(Array(gameStore.marks.enumerated()), id: \.element.id) { index, mark in
                    HStack {
                        
                        // Posició de la marca dins del rànquing (1, 2, 3...)
                        Text("\(index + 1)")
                            .frame(width: 32, height: 32)
                            .overlay(Circle().stroke())
                        
                        Spacer()
                                     
                        // Puntuació aconseguida en aquella marca
                        Text("\(mark.value)")
                        
                        Spacer()
                        
                        // Hora en què es va obtenir la marca
                        Text(mark.date, formatter: markDateFormatter)
                    }
                    .padding(.vertical, 4)
                }
            }
        }
        // Estil visual de la pantalla (fons, cantonades arrodonides i ombra)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(radius: 8)
        .padding()
    }
}
