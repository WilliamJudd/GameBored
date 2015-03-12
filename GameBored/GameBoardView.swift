//
//  GameBoardView.swift
//  GameBored
//
//  Created by William Judd on 2/18/15.
//  Copyright (c) 2015 William Judd. All rights reserved.
//

import UIKit




@ IBDesignable class GameBoardView: UIView, GamePieceDelegate {
    
    let gridSize = 8
    
    override func layoutSubviews() {
    
        if let boardSquares = DataModel.mainData().currentGame?.boardSquares {
            
            for (rowIndex,rowArray) in enumerate(boardSquares)  {
                
                for (columnIndex,squarePieceType) in enumerate(rowArray) {
                    
                    
                    if squarePieceType == 0{continue}
                    
                    if let type = PieceType(rawValue: squarePieceType) {
                        
                        var piece = GamePeace(type: type)
                        
                        piece.square = (columnIndex,rowIndex)
                        
                        DataModel.mainData().currentGame?.boardPieces[rowIndex][columnIndex] = piece
                        
                        let cF = CGFloat(columnIndex)
                        let rF = CGFloat(rowIndex)
                        
                        println(frame.width)
                        
                        let squareSize = frame.width / CGFloat(gridSize)
                        
                        let x = cF * squareSize + squareSize / 2
                        let y = rF * squareSize + squareSize / 2
                        
                        piece.center = CGPointMake(x,y)
                        
                        addSubview(piece)
                        
                        
                    }
                    
                }
            }
            
        }
        
        
    }
    
    func piecesSelected(piece: GamePeace) {
        
        // piece.square is your start point
        
        let (c,r) = piece.square
        let squareTopRight = DataModel.mainData().currentGame?.boardPieces[c + 1][r - 1]
        
        
        // do something with piece
    
    
    }
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
    
        if let touch = touches.allObjects.last as? UITouch {
            
            let location = touch.locationInView(self)
            
            let squareSize = frame.width / CGFloat(gridSize)

            let col = Int(floor(location.x / squareSize))
            let row = Int(floor(location.y / squareSize))
            
            let selectedSquare = DataModel.mainData().currentGame?.boardPieces[row][col]
            
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
