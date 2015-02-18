//
//  GameBoardView.swift
//  GameBored
//
//  Created by William Judd on 2/18/15.
//  Copyright (c) 2015 William Judd. All rights reserved.
//

import UIKit

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

// board squares [row][col]


@ IBDesignable class GameBoardView: UIView {
    
    let gridSize = 8
    
    override func awakeFromNib() {
    
        for (rowIndex,rowArray) in enumerate(boardSquares)  {
            
            for (columnIndex,squarePieceType) in enumerate(rowArray) {
                
                println(squarePieceType)
                if let type = PieceType(rawValue: squarePieceType) {
                    
                    var piece = GamePeace(type: type)
                    
                }
                
                
//                var piece = GamePeace(type: PieceType.Player1)
                
                
            }
        }
    }
    
    
    
    override func drawRect(rect: CGRect) {
    
        var context = UIGraphicsGetCurrentContext()
        
        
            // loop through cols
        
        for c in 0..<gridSize {
            
            // loop through rows
    
            for r in 0..<gridSize {
                
                
                // you have to have an INT, not a float, so we have to convert the INT into a float.
        
                let cF = CGFloat(c)
                let rF = CGFloat(r)
                
                let squareSize = rect.width / CGFloat(gridSize)
                
                let x = cF * squareSize
                let y = rF * squareSize
            
                let color = (c + r) % 2 == 0 ? UIColor.redColor() : UIColor.lightGrayColor()
                color.set()
                
                CGContextFillRect(context, CGRectMake(x, y, squareSize, squareSize))
                
                
            
            
            
            }
            
            
        }
        
    
    }
    

}
