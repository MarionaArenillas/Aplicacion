import Foundation

class GameStore: ObservableObject {
    @Published private(set) var game = Game()
    
    func calculatePoints(value: Double){
        game.calculatePoints(sliderValue: value)
    }
    
    func restartGame(){
        game.restartGame()
    }
    
    func restart(){
        game.restart()
    }
}
