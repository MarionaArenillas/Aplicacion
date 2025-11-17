//
//  ViewModel.swift
//  Aplicacion
//
//  Created by alumne on 17/11/2025.
//

import Foundation

class GameStore: ObservableObject {
    @Published private(set) var game = Game()
}
