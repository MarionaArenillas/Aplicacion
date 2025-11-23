import Foundation

struct Game {
    
    // Valors mínim i màxim del rang del joc (del 1 al 100)
    static let lowNumber: Double = 1
    static let highNumber: Double = 100
    
    /*
     Número aleatori que el jugador ha d'intentar encertar amb el slider.
     És private perque es pot llegir des de fora però només modificar dins de Game
    */
    private(set) var guessNumber = Int.random(in: Int(lowNumber)...Int(highNumber))
    
    // Punts aconseguits en l'última ronda
    private(set) var points = 0
    
    // Puntuació total acumulada
    private(set) var score = 0
    
    // Número de rondes jugades
    private(set) var rounds = 0
    
    // Calcula els punts obtinguts segons la posició del slieder i actualitza score i rounds
    mutating func calculatePoints(sliderValue: Double) {
        // Calcula els punts. Punts = màxim (100) - diferència absoluta entre número i slider
        self.points = Int(Game.highNumber) - abs(guessNumber-Int((round(sliderValue))))
        
        // Actualitza la puntuació acumulada
        self.score+=self.points
        
        // Suma una nova ronada
        self.rounds+=1
    }
    
    // Reinicia només el número aleatori per jugar una nova ronda (botó try)
    mutating func restart(){
        self.guessNumber = Int.random(in: Int(Game.lowNumber)...Int(Game.highNumber))
    }
    
    // Reinicia completament el joc: número, puntuació i rondes (botó reiniciar)
    mutating func restartGame(){
        self.guessNumber = Int.random(in: Int(Game.lowNumber)...Int(Game.highNumber))
        self.score = 0
        self.rounds = 0
    }
}
