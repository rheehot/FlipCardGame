//
//  Card.swift
//  FlipCardGame
//
//  Created by 한상진 on 2020/09/30.
//

import Foundation

/**
 Differences between struct and class
 1. struct has no inheritance
 2. structs are value types and classes are reference types ⭐️
     2-1) value type : copy-on-write
     2-2) reference type : passing pointers
 */
struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    //init usually has the same internal and external name
    init() {
        identifier = Card.getUniqueIdentifier()
    }
}
