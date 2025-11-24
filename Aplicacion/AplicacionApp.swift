// Projecte creat per Evelyn Aguayo i Mariona Arenillas

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
