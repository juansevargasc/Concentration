//
//  ViewController.swift
//  Concentration
//
//  Created by Juanse Vargas on 7/31/19.
//  Copyright © 2019 Juanse Apps. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    lazy var game: Concentration = Concentration(numberOfPairOfCards: (cardButtons.count + 1) / 2)
    
    var flipCount: Int = 0
    {
        didSet
        {
             flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    //Also we can write:
    //var flipCount = 0
    
    @IBOutlet weak var flipCountLabel: UILabel!

    //[UIButton] Array of UIButtons
    @IBOutlet var cardButtons: [UIButton]!
    
    
    
    @IBAction func touchCard(_ sender: UIButton)
    {
        //print("Agh a ghost! 👻")
        flipCount += 1
        //let cardNumber be the index of the button 'sender'. It should have its index in the array
        if let cardNumber = cardButtons.index(of: sender)
        {
            //print("Card Number: \(cardNumber)")
            //flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else
        {
            print("Chosen card was not in cardButtons!")
        }
        
        //flipCard(withEmoji: "👻", on: sender)
    }
    
    func updateViewFromModel()
    {
        for index in cardButtons.indices
        {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp
            {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else
            {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0):#colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    //Array of string with emojis
    var emojiChoices = ["👻", "🎃", "😈", "🕷", "🦇", "🍭", "🍬", "🍎", "🙀"]
    //Dictionary can be also: [Int:String]()
    var emoji = Dictionary<Int, String>()
    
    func emoji(for card: Card) -> String
    {
        //emoji[number] is a dictionary that given a 'number' returns an String, but optional, it means it could not be set.
        /*
        if emoji[card.identifier] != nil
        {
            return emoji[card.identifier]!
        }else
        {
            return "?"
        }
        */
        if emoji[card.identifier] == nil, emojiChoices.count > 0
        {
            let randomIndex = Int( arc4random_uniform(UInt32(emojiChoices.count)) )
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        
        return emoji[card.identifier] ?? "?"
    }
    
    
}

