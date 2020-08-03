//
//  Concentration.swift
//  Concentration
//
//  Created by Juanse Vargas on 8/14/19.
//  Copyright © 2019 Juanse Apps. All rights reserved.
//

import Foundation

class Concentration
{
    //var cards = Array<Card>()
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    init(numberOfPairOfCards: Int)
    {
        //1...numberOfPairOfCards
        for _ in 0..<numberOfPairOfCards
        {
            //NOTES
            //let matchingCard = card When you do this you get a copy of card in the variable matchingCard
            //cards.append(card)
            //cards.append(card)
            
            let card = Card()
            cards += [card, card]
            
        }
        // TODO: Shuffle the cards
        cards.shuffle()
        
    }
    
    func chooseCard(at index: Int)
    {
        /*
        if cards[index].isFaceUp
        {
            cards[index].isFaceUp = false
        }else{
            cards[index].isFaceUp = true
        }*/
        
        if !cards[index].isMatched
        {
            //If, there's one card faced up, and then you choose a card to face up
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index
            {
                //Check if cards match
                if cards[matchIndex].identifier == cards[index].identifier
                {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil //Updating the fact that after the last line now there are two cards faced up
            }else
            {
                //Either no cards or two cards are faced up
                //Facing down all
                for flipDownIndex in cards.indices
                {
                    cards[flipDownIndex].isFaceUp = false
                }
                //Now the card choosen is faced up
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
        
        
    }
    
    
}
