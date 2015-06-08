//
//  Obstacle.swift
//  FlappySwift
//
//  Created by Selina Wang on 6/7/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import UIKit
import Foundation

class Obstacle: CCNode {
    var _topPipe: CCNode!
    var _bottomPipe: CCNode!
    
    let topPipeMinPositionY : CGFloat = 128
    let bottomPipeMaxPositionY : CGFloat = 440
    let _pipeDistance : CGFloat = 142
    
    func didLoadFromCCB() {
        _topPipe.physicsBody.sensor = true
        _bottomPipe.physicsBody.sensor = true
    }
    
    func setupRandomPosition() {
        let _randomPrecision : UInt32 = 100
        let random = CGFloat(arc4random_uniform(_randomPrecision)) / CGFloat(_randomPrecision)
        let range = bottomPipeMaxPositionY - _pipeDistance - topPipeMinPositionY
        _topPipe.position = ccp(_topPipe.position.x, topPipeMinPositionY + (random * range))
        _bottomPipe.position = ccp(_bottomPipe.position.x, _topPipe.position.y + _pipeDistance)
    }
}
