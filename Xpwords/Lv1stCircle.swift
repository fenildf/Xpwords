//
//  Lv1stCircle.swift
//  Xpwords
//
//  Created by Yanggl on 15/11/12.
//  Copyright © 2015年 Yongl. All rights reserved.
//

import UIKit

protocol Lv1stDelegate {
    func monitoring(isMonitor: Bool) -> Bool
}

enum CircleType: Int {
    case Pic = 1
    case Audio
    case PicAudio
}

class Lv1stCircle: Circle {
    
    var circleType: CircleType = CircleType.Pic                 //显示类型，（只显示图片，只显示声音，显示声音和图片）
    var delegate: Lv1stDelegate?
    
    //MARK: Init Methods
    
    override init(radiusValue: CGFloat, inView: UIView) {
        super.init(radiusValue: radiusValue, inView: inView)
        
    }
    
    //MARK: Private Methods
    
    func addBubbleWithAnimation(sender: String) {
        
        var button = BubbleButton()
        if self.circleType == .Pic {
            button = BubbleButton(frame: CGRectMake(self.centerPoint.x - self.bubbleRadius, self.centerPoint.y + 20.0 - self.bubbleRadius, 2 * self.bubbleRadius, 2 * self.bubbleRadius), rgb: 0xd8d8d8, title: sender)
        }else {
            button = BubbleButton(frame: CGRectMake(self.centerPoint.x - self.bubbleRadius, self.centerPoint.y + 20.0 - self.bubbleRadius, 2 * self.bubbleRadius, 2 * self.bubbleRadius), rgb: 0xd8d8d8, audioUrl: sender.lowercaseString)
            button.audios = [sender.lowercaseString]
        }
        
        button.transform = CGAffineTransformMakeScale(0.001, 0.001)
        button.tag = 666
        self.parentView.addSubview(button)
        
        UIView.animateWithDuration(0.2, animations: {
            button.transform = CGAffineTransformMakeScale(1.0, 1.0)
        })
    }
    
    override func show(view:UIView) {
        centerNums = (centerNums.count == 0) ? getTitles() : centerNums
        let indexInCenterNums = Int(arc4random_uniform(UInt32(centerNums.count))) //随机一个中间显示的数
        let centerTitle = centerNums[indexInCenterNums] as! String
        centerNums.removeAtIndex(indexInCenterNums)
        
//        self.performSelector(Selector("addBubbleWithAnimation:"), withObject: "\(centerTitle)", afterDelay: 0.0)
        addBubbleWithAnimation("\(centerTitle)")

        let rgbs = NSMutableArray(array: COLORS)                    //全部的颜色
        let titles = NSMutableArray(array: getTitles())             //全部的单词
        let arcIndex = Int(arc4random_uniform(UInt32(9)))           //随机的关卡里数量的第几个
        titles.removeObject(centerTitle)                            //去掉中间数
        
        var rgb = 100
        var title = ""
        for var i = 0; i < 9; i++ {
            if rgb != 100 || title != ""  {
                rgbs.removeObject(rgb)
                titles.removeObject(title)
            }
            
            var index = Int(arc4random_uniform(UInt32(rgbs.count)))
            rgb = rgbs[index] as! Int
            index = Int(arc4random_uniform(UInt32(titles.count)))
            title = titles[index] as! String
            if arcIndex == i {title = centerTitle}
            
            let button = BubbleButton(frame: CGRectMake(0, 0, 2 * self.bubbleRadius, 2 * self.bubbleRadius), rgb: rgb, title: title, icon:UIImage(named: getImageName(title)))
            button.contactView = self.parentView.viewWithTag(666)!
            bubbles.append(button)
            self.parentView.addSubview(button)
        }
        
        showFirstAnimationType()
        
        var inetratorI = 0
        for bubble in bubbles {
            let delayTime = (NSTimeInterval) (CGFloat( inetratorI ) * 0.1)
            self.performSelector(Selector("showBubbleWithAnimation:"), withObject: bubble, afterDelay: delayTime)
            ++inetratorI
            
            if self.circleType == .Audio || self.circleType == .Pic {
                bubble.clkBlock = { bubble in
                    print("\(bubble.eleName) \(centerTitle) ")
                    let isTrue = bubble.eleName == centerTitle
                    let monitor = self.delegate!.monitoring(isTrue)
                    if (monitor &&  !isTrue){
                        DataAPI.insertError(centerTitle, date: NSDate())
                    }
                }
            }else if self.circleType == .PicAudio{
                bubble.setTitle(bubble.eleName, forState: UIControlState.Normal)
                bubble.titleLabel!.font = bubble.convertToFont(bubble.eleName)
                bubble.viewWithTag(688)?.removeFromSuperview()
                bubble.clkBlock = { bubble in
                    print("\(bubble.eleName) \(centerTitle) ")
                    let isTrue = bubble.eleName == centerTitle
                    let monitor = self.delegate!.monitoring(isTrue)
                    if (monitor &&  !isTrue) {
                        DataAPI.insertError(centerTitle, date: NSDate())
                    }
                    
                }
            }
        }
        
    }
    

}
