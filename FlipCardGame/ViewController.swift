//
//  ViewController.swift
//  FlipCardGame
//
//  Created by 한상진 on 2020/09/29.
//

import UIKit

class ViewController: UIViewController {
    //type inferences -> no need to write :Concentration
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    var flipCount = 0 {
        //Property Observer
        didSet {
            flipCountLabel.text = "Flips : \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        
        //data driven
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("card is not in cardButtons")
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = .black
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? .clear : .orange
            }
        }
    }
    
    var emojiChoises = ["🦇","👻","🎃","👿","🍪","☁","🥝"]
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoises.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoises.count)))
            emoji[card.identifier] = emojiChoises.remove(at: randomIndex)
        }
        
        return emoji[card.identifier] ?? "?"
    }
    
    func flipCard(withEmoji emoji: String,on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = UIColor.orange
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = UIColor.black
        }
    }
}

