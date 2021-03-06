//
//  GameModel.swift
//  GameBored
//
//  Created by William Judd on 2/19/15.
//  Copyright (c) 2015 William Judd. All rights reserved.
//

import UIKit

private let _mainData = DataModel()

class DataModel: NSObject {
    
    var allGames: [GameModel] = []
    var currentGame: GameModel?
    
    class func mainData() -> DataModel {return _mainData}
    
}

class GameModel: NSObject {
    /// 0 = empty, 1 = player1, 2 = player2
    
    let boardSquares = [
        
        [0,1,0,1,0,1,0,1],
        [1,0,1,0,1,0,1,0],
        [0,1,0,1,0,1,0,1],
        [0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0],
        [2,0,2,0,2,0,2,0],
        [0,2,0,2,0,2,0,2],
        [2,0,2,0,2,0,2,0]
        
    ]
    
    var boardPieces: [[GamePeace?]] = Array(count: 8, repeatedValue: Array(count: 8, repeatedValue: nil))
    
    // board squares [row][col]
 
    var players: [Player] = [Player(direction: 1),Player(direction: -1)]
    
    // board position
    var winner: Player?
    var isDraw = false
    // players
    // winner
    // moves made
    // kings per player
    // 
    
    
}
// var oppositeRow = player.direction == 1 ? 7 : 0

class Player: NSObject {
    
    var direction = 1
    
    init(direction: Int) {
        
        super.init()
        self.direction = direction
        
    }
    
}
