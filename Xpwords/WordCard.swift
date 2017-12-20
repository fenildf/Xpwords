//
//  WordCard.swift
//  Xpwords
//
//  Created by Yanggl on 15/11/13.
//  Copyright © 2015年 Yongl. All rights reserved.
//

import UIKit

class WordCard: UIButton {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var word: UILabel!
    
    func layoutWord(WROD: Word) {
        title.text = WROD.title
        word.text = WROD.word
        
        let button = BubbleButton(frame: CGRectMake(10.5, 55, 198.0, 198.0), rgb: WROD.rgb, title: WROD.word, image:UIImage(named: WROD.image))
        button.tag = 666
        self.addSubview(button)
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
