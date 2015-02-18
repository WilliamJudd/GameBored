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

class GamePeace: UIView {

    var type: PieceType!
    
    init(type: PieceType) {
        
        super.init()
        self.type = type
        
        backgroundColor = type.hashValue % 2 == 0 ? UIColor.cyanColor() : UIColor.yellowColor()
        
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
