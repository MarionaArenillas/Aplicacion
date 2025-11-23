import Foundation

class GameStore: ObservableObject {
    /*
     game és el model principal del joc
     @Published --> fa que qualsevol canvi dins de game actualitzi la interficie dels usuaris directament
     private(set) --> altres classes poden llegir game, però només GameStore el pot modificar.
    */
    @Published private(set) var game = Game()
    
    // Calcula els punts i avança la ronda.
    func calculatePoints(value: Double){
        game.calculatePoints(sliderValue: value)
    }
    
    // Reinicia TOT el joc
    func restartGame(){
        game.restartGame()
    }
    
    // Reinicia NOMÉS el número aleatori
    func restart(){
        game.restart()
    }
    
}
