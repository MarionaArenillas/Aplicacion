// TOKEN GITHUB --> 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

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
