//
//  Game.swift
//  Aplicacion
//
//  Created by alumne on 10/11/2025.
//

import Foundation

struct Game {
    static let lowNumber: Double = 1
    static let highNumber: Double = 100
    
    private(set) var guessNumber = Int.random(in: Int(lowNumber)...Int(highNumber))
    private(set) var points = 0
    
    mutating func calculatePoints(sliderValue: Double) {
        // Calcula els punts com a màxim menys la diferència absoluta
        self.points = Int(Game.highNumber) - abs(guessNumber-Int((round(sliderValue))))
    }
    
    mutating func restart(){
        self; guessNumber = Int.random(in: Int(Game.lowNumber)...Int(Game.highNumber))
    }
}
