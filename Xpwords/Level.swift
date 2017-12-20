//
//  Level.swift
//  Xpwords
//
//  Created by Yanggl on 15/11/9.
//  Copyright © 2015年 Yongl. All rights reserved.
//

import UIKit

class Level: AnyObject {

    var lock = true
    var completed = 0
    var starNum = 0
    
    init(lock:Bool, completed: NSInteger, starNum: NSInteger) {
        self.lock = lock
        self.completed = completed
        self.starNum = starNum
    }
    
    init() {
        
    }
    
    func description() -> String {
        return "block: \(lock)" +
            "level: \(completed)" +
        "num: \(starNum)"
    }

}
