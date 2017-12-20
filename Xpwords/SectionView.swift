//
//  SectionView.swift
//  Xpwords
//
//  Created by Yanggl on 15/11/17.
//  Copyright © 2015年 Yongl. All rights reserved.
//

import UIKit
import Foundation

typealias CloseBlock = (view: SectionView, section: NSInteger) -> Void
typealias OpenBlock = (view: SectionView, section: NSInteger) -> Void

class SectionView: UITableViewCell {

    var closeBlock = CloseBlock?()
    var opneBlock = OpenBlock?()
    var section:NSInteger = 0
    var dropButton:UIButton = UIButton()
    
    func loadAll(title:String, count:String, section:NSInteger, isOpen:Bool, closeBlock:CloseBlock, openBlock:OpenBlock){
        (self.viewWithTag(11) as! UILabel).text = title
        (self.viewWithTag(12) as! UILabel).text = count

        self.closeBlock = closeBlock
        self.opneBlock = openBlock
        self.section = section
        self.dropButton = (self.viewWithTag(13) as! UIButton)
        self.dropButton.selected = isOpen
        self.dropButton.addTarget(self, action: Selector("touchSection:"), forControlEvents: UIControlEvents.TouchUpInside)
        
        let tap = UITapGestureRecognizer(target: self, action: Selector("touchSection:"))
        self.addGestureRecognizer(tap)
    }
    
    func touchSection(sender: UIGestureRecognizer) {
        if self.dropButton.selected {
            self.closeBlock!(view: self, section: self.section)
        }else {
            self.opneBlock!(view: self, section: self.section)
        }
        
        self.dropButton.selected = !self.dropButton.selected
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
