import Foundation

// GUarda cada puntuació amb la seva data i hora
struct Mark: Identifiable {
    let id = UUID()     // perque SwiftUI pugui identificar cada fila de la llista
    let value: Int      // punts aconseguits en aquella ronda
    let date: Date      // hora exacta del moment en què el jugador ha fet la ronda
}
