//
//  Word.swift
//  Xpwords
//
//  Created by Yanggl on 15/11/13.
//  Copyright © 2015年 Yongl. All rights reserved.
//

import UIKit

class Word: NSObject {
    var title: String = ""
    var word: String = ""
    var rgb:Int = 0
    var image:String = ""
    
    init(word:String, title:String, rgb:Int, image:String) {
        self.word = word
        self.title = title
        self.rgb = rgb
        self.image = image
    }
    
    
}
