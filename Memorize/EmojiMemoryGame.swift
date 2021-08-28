//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by BugaCo on 5/29/21.
//

import Foundation

class EmojiMemoryGame: ObservableObject  {
    
    typealias Card = MemoryGame<String>.Card
    
    static let emojis = [ "🚗", "🚕", "🚙", "🚌", "🚎",  "🏎",  "🚓",  "🚑",  "🚒",  "🚐",  "🛻",  "🚚",  "🚛",  "🚜",  "🦯",  "🦽",  "🦼",  "🛴",  "🚲",  "🛵", "🚍", "🚔", "🛺", "🏍"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
         
     var cards: Array<Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    func choose(_ card: Card) {
        objectWillChange.send()
        model.choose(card)
    }
} 
