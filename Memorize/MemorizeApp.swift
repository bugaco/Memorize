//
//  MemorizeApp.swift
//  Memorize
//
//  Created by BugaCo on 5/18/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    var game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
