//
//  Goal.swift
//  FlappySwift
//
//  Created by Selina Wang on 6/8/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import UIKit
import Foundation

class Goal: CCNode {
    func didLoadFromCCB() {
        self.physicsBody.sensor = true
    }
}
