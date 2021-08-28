//
//  MemoryGame.swift
//  Memorize
//
//  Created by BugaCo on 5/29/21.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int?  = nil
    
    mutating func choose(_ card: Card) {
        
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[potentialMatchIndex].content == cards[chosenIndex].content {
                    cards[potentialMatchIndex].isMatched = true
                    cards[chosenIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                for (index, _) in cards.enumerated() {
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            
            cards[chosenIndex].isFaceUp.toggle()
        }
        
        print(cards)
    }
    
    func index(of card: Card) -> Int? {
        for i in 0..<cards.count {
            let item = cards[i]
            if item.id == card.id {
                return i
            }
        }
        
        return nil
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int)-> CardContent) {
        cards = []
        
        // add numberOfPairsOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            cards.append(Card(id: pairIndex*2, content: createCardContent(pairIndex)))
            cards.append(Card( id: pairIndex*2+1, content: createCardContent(pairIndex)))
        }
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
        
        
    }
}
