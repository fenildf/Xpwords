//
//  LevelButton.swift
//  Xpwords
//
//  Created by Young on 15/11/9.
//  Copyright © 2015年 Yongl. All rights reserved.
//

import UIKit

enum DifficultyType: Int {
    case easy = 1
    case normal
    case hard
}

//金币 和 成长度 和 星级没关系
//growth 成长度为0 - 40 鸡蛋，成长度50 - 70 小鸡，成长度80-90 大鸡， 成长度100， 母鸡，大于100 鸡行不变
//start ,星级：0星级，过关失败，抠成长度10，不扣金币
//0星级，过关成功，没有成长度，金币 + 0
//1星级，过关成功，没有成长度，金币 + 10
//2星级，过关成功，成长度+ 10，金币 + 20
//3星级，过关成功，成长度+ 20，金币 + 30
//星级评价：半分钟内 3星；1分钟内，2星；1.5分钟内，1星；其他，
//在没有失误额情况下才有星级：30s 40s 50s

//for fontfamilyname in UIFont.familyNames() {
//    print("family: \(fontfamilyname) ")
//    
//    let fonts = UIFont.fontNamesForFamilyName(fontfamilyname)
//    for fontName in fonts
//    {
//        print("\tfont: \(fontName)")
//    }
//    print("-------------")
//}

class LevelButton: UIButton {

    var completed: NSInteger = 0
    private var labCompleted : UILabel = UILabel()

    func loading(difficulty: DifficultyType, lock: Bool, completed: NSInteger, starNum: NSInteger) {

        self.completed = completed

        if self.viewWithTag(222) == nil {
            labCompleted = UILabel(frame: CGRect(x: 0, y: 150.0, width: self.frame.size.width, height: 82.0))
            labCompleted.textAlignment = NSTextAlignment.Center
            labCompleted.font = UIFont(name: "Tensentype-JiaLiXiYuanJ", size: 58.0)
            labCompleted.textColor = UIColor.whiteColor()
            labCompleted.tag = 222
            self.addSubview(labCompleted)
        }else {
            labCompleted.text = ""
        }
        
        switch difficulty {
        case .easy:
            if lock == true {
                self.setImage(UIImage(named: "home_easy_lock"), forState: UIControlState.Normal)
                self.setImage(UIImage(named: "home_easy_lock"), forState: UIControlState.Highlighted)

                return
            }
            labCompleted.text = "\(self.completed)\\100"
            
            switch starNum {
            case 0:
                self.setImage(UIImage(named: "home_easy_0"), forState: UIControlState.Normal)
                self.setImage(UIImage(named: "home_easy_0"), forState: UIControlState.Highlighted)
                
            case 1:
                self.setImage(UIImage(named: "home_easy_1"), forState: UIControlState.Normal)
                self.setImage(UIImage(named: "home_easy_1"), forState: UIControlState.Highlighted)
                
            case 2:
                self.setImage(UIImage(named: "home_easy_2"), forState: UIControlState.Normal)
                self.setImage(UIImage(named: "home_easy_2"), forState: UIControlState.Highlighted)
                
            case 3:
                self.setImage(UIImage(named: "home_easy_3"), forState: UIControlState.Normal)
                self.setImage(UIImage(named: "home_easy_3"), forState: UIControlState.Highlighted)
                
            default:
                break
            }
        case .normal:
            if lock == true {
                self.setImage(UIImage(named: "home_normal_lock"), forState: UIControlState.Normal)
                self.setImage(UIImage(named: "home_normal_lock"), forState: UIControlState.Highlighted)

                return
            }
            labCompleted.text = "\(self.completed)\\100"

            switch starNum {
            case 0:
                self.setImage(UIImage(named: "home_normal_0"), forState: UIControlState.Normal)
                self.setImage(UIImage(named: "home_normal_0"), forState: UIControlState.Highlighted)
                
            case 1:
                self.setImage(UIImage(named: "home_normal_1"), forState: UIControlState.Normal)
                self.setImage(UIImage(named: "home_normal_1"), forState: UIControlState.Highlighted)
                
            case 2:
                self.setImage(UIImage(named: "home_normal_2"), forState: UIControlState.Normal)
                self.setImage(UIImage(named: "home_normal_2"), forState: UIControlState.Highlighted)
                
            case 3:
                self.setImage(UIImage(named: "home_normal_3"), forState: UIControlState.Normal)
                self.setImage(UIImage(named: "home_normal_3"), forState: UIControlState.Highlighted)
                
            default:
                break
            }
        case .hard:
            if lock == true {
                self.setImage(UIImage(named: "home_hard_lock"), forState: UIControlState.Normal)
                self.setImage(UIImage(named: "home_hard_lock"), forState: UIControlState.Highlighted)

                return
            }
            labCompleted.text = "\(self.completed)\\100"

            switch starNum {
            case 0:
                self.setImage(UIImage(named: "home_hard_0"), forState: UIControlState.Normal)
                self.setImage(UIImage(named: "home_hard_0"), forState: UIControlState.Highlighted)
                
            case 1:
                self.setImage(UIImage(named: "home_hard_1"), forState: UIControlState.Normal)
                self.setImage(UIImage(named: "home_hard_1"), forState: UIControlState.Highlighted)
                
            case 2:
                self.setImage(UIImage(named: "home_hard_2"), forState: UIControlState.Normal)
                self.setImage(UIImage(named: "home_hard_2"), forState: UIControlState.Highlighted)
                
            case 3:
                self.setImage(UIImage(named: "home_hard_3"), forState: UIControlState.Normal)
                self.setImage(UIImage(named: "home_hard_3"), forState: UIControlState.Highlighted)
                
            default:
                break
            }

        }
        
        
        //        let tap = UITapGestureRecognizer(target: self, action: Selector("lockTap"))
        //        self.addGestureRecognizer(tap)
    }
    
    func lockTap() {
        print("this is lock, please unlock it")
    }
    

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
