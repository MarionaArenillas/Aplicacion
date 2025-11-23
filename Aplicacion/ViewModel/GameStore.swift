import Foundation

class GameStore: ObservableObject {
    /*
     game és el model principal del joc
     @Published --> fa que qualsevol canvi dins de game actualitzi la interficie dels usuaris directament
     private(set) --> altres classes poden llegir game, però només GameStore el pot modificar.
    */
    @Published private(set) var game = Game()
    
    // Llista de marques (top 5 millors puntuacions)
    @Published private(set) var marks: [Mark] = []
    
    // Calcula els punts i avança la ronda.
    func calculatePoints(value: Double){
        game.calculatePoints(sliderValue: value)
    }
    
    // Guarda la puntuació actual com a marca i manté només les 5 millors
    private func registreCurrentMark(){
        let newMark = Mark(value: game.points, date: Date())
        
        // Ordena de més punts a menys
        marks.sort { $0.value > $1.value }
        
        // Es queda només amb les 5 primeres millors puntuacions
        if marks.count > 5 {
            marks = Array(marks.prefix(5))
        }
    }
    
    // Reinicia TOT el joc
    func restartGame(){
        game.restartGame()
        // Buidem tot el rànquing
        marks.removeAll()
    }
    
    // Reinicia NOMÉS el número aleatori
    func restart(){
        game.restart()
    }
    
}
