//
//  GamePeace.swift
//  GameBored
//
//  Created by William Judd on 2/18/15.
//  Copyright (c) 2015 William Judd. All rights reserved.
//

import UIKit


enum PieceType: Int {
    
    case Empty
    case Player1
    case Player2
    
    case Player1King
    case Player2King
    
}

protocol GamePieceDelegate {
    // why did we make this a delegate method?
    
    
    func piecesSelected(piece: GamePeace)
    
    
}

class GamePeace: UIView {

    var type: PieceType!
    var player: Player? {
        
        var index = 0
        switch type! {
            
        case .Player1, .Player1King :
            
            index = 0
            
        case .Player2, .Player2King :
        
            index = 1
            
        case .Empty :
            
            index = 0
            
        }

        
        let playerIndex = (type.rawValue - 1) % 2
        return DataModel.mainData().currentGame?.players[playerIndex]
        
    }
    
    /// (col,row)
    var square: (Int,Int)!
    
    var delegate: GamePieceDelegate?
    
    init(type: PieceType) {
        
        super.init(frame: CGRectMake(0, 0, 20, 20))
        self.type = type
        
        backgroundColor = type.hashValue % 2 == 0 ? UIColor.blueColor() : UIColor.greenColor()
        
        layer.cornerRadius = 10
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")

    
    
    }
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        // pieces selected
        delegate?.piecesSelected(self)
        
        
        // change color for selection
        
    }

    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
