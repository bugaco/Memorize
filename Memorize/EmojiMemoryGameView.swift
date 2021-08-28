//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by BugaCo on 5/18/21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(game.cards) { card in
                        CardView(card).aspectRatio(2 / 3, contentMode: .fit)
                            .onTapGesture {
                                game.choose(card)
                            }
                    }
                }
                .foregroundColor(.red)
            }
        }
        .padding()
        .font(.largeTitle)
    }
}

struct CardView: View {
    private var card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 20)
        ZStack {
            if card.isFaceUp {
                shape.strokeBorder(lineWidth: 3)
                Text(card.content)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape
            }
        }
    }
}












struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(game: EmojiMemoryGame())
            .previewDevice("iPhone 8")
    }
}
