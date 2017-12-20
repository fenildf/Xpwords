//
//  Sentence.swift
//  Xpwords
//
//  Created by Young on 15/11/14.
//  Copyright © 2015年 Yongl. All rights reserved.
//

import UIKit

class Sentence: NSObject {
    var sentences = [String]()
    var titles = [String]()
    var audios = [Array<String>]()
    
    init(sentences:[String], titles:[String], audios: [Array<String>]) {
        self.sentences = sentences
        self.titles = titles
        self.audios = audios
    }
}
