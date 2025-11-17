//
//  AplicacionApp.swift
//  Aplicacion
//
//  Created by alumne on 27/10/2025.
//

import SwiftUI

@main
struct AplicacionApp: App {
    @StateObject var gameStore = GameStore()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(gameStore)
        }
    }
}
