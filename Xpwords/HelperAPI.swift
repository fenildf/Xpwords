//
//  HelperAPI.swift
//  Xpwords
//
//  Created by Yanggl on 15/11/9.
//  Copyright © 2015年 Yongl. All rights reserved.
//

import UIKit
import Foundation
import AudioToolbox
import AVFoundation

class HelperAPI: NSObject {

    //MARK: - 得到正在运行的viewController
    class func currentViewController() -> UIViewController {
        
        var topVC = UIApplication.sharedApplication().keyWindow?.rootViewController
        while topVC?.presentedViewController != nil {
            topVC = topVC?.presentedViewController
        }
        return (topVC)!
    }

    //MARK: - 得到是哪一个场景，哪一个关卡
    class func getCurrentScenelv(type:SceneType, lvName:String) -> (scene: Scene, level: Level) {
        
        var curScene: Scene!
        switch type {
        case .Num:
            curScene = UserAPI.sharedInstance.sceneNum
        case .Animal:
            curScene = UserAPI.sharedInstance.sceneAnimal
        case .Fruit:
            curScene = UserAPI.sharedInstance.sceneFruit
        case .Traffic:
            curScene = UserAPI.sharedInstance.sceneTraffic
        }
        
        let lvNum = Int((lvName as NSString).substringFromIndex(2))!
        var curLevel:Level!
        switch lvNum {
        case 1:
            curLevel = curScene.lv1
        case 2:
            curLevel = curScene.lv2
        case 3:
            curLevel = curScene.lv3
        default:
            break
        }
        
        return (scene: curScene, level: curLevel)
    }
    
    //MARK: - 英文转中文
    class func converEnToCn(type:SceneType, title:String) ->String {
        switch type{
        case .Num:
            return converNumToCn(title)
        case .Animal:
            return converAnimalToCn(title)
        case .Fruit:
            return converFruitToCn(title)
        case .Traffic:
            return converTrafficToCn(title)
        }
    }
    
    class func converTrafficToCn(title: String) -> String {
        switch title {
        case "Boat":
            return "小船"
        case "Ship":
            return "轮船"
        case "Bike":
            return "自行车"
        case "Train":
            return "火车"
        case "Bus":
            return "巴士"
        case "Car":
            return "轿车"
        case "Truck":
            return "卡车"
        case "Motorcycle":
            return "摩托车"
        case "Submarine":
            return "潜艇"
        case "Helicopter":
            return "直升机"
        case "Airship":
            return "飞艇"
        case "Spaceship":
            return "宇宙飞船"
        case "Plane":
            return "飞机"
        case "Balloon":
            return "热气球"
        default:
            return ""
        }
    }

    class func converFruitToCn(title: String) -> String {
        switch title {
        case "Apple":
            return "苹果"
        case "Pear":
            return "梨"
        case "Banana":
            return "香蕉"
        case "Cherry":
            return "樱桃"
        case "Watermelon":
            return "西瓜"
        case "Grape":
            return "葡萄"
        case "Orange":
            return "橙子"
        case "Mandarin":
            return "橘子"
        case "Strawberry":
            return "草莓"
        case "Pineapple":
            return "菠萝"
        case "Peach":
            return "桃子"
        case "Kiwi":
            return "猕猴桃"
        case "Pomegranate":
            return "石榴"
        case "Plum":
            return "李子"
        case "Lemon":
            return "柠檬"
        case "Hamimelon":
            return "哈密瓜"
        default:
            return ""
        }
    }

    class func converAnimalToCn(title: String) -> String {
        switch title {
        case "Fox":
            return "狐狸"
        case "Cow":
            return "牛"
        case "Donkey":
            return "驴"
        case "Deer":
            return "鹿"
        case "Cat":
            return "猫"
        case "Dog":
            return "狗"
        case "Pig":
            return "猪"
        case "Sheep":
            return "羊"
        case "Rabbit":
            return "兔子"
        case "Chicken":
            return "鸡"
        case "Zebra":
            return "斑马"
        case "Penguin":
            return "企鹅"
        case "Horse":
            return "马"
        case "Panda":
            return "熊猫"
        case "Monkey":
            return "猴子"
        case "Gorilla":
            return "大猩猩"
        case "Tiger":
            return "老虎"
        case "Elephant":
            return "大象"
        case "Leopard":
            return "豹子"
        case "Lion":
            return "狮子"
        default:
            return ""
        }
    }

    class func converNumToCn(title: String) -> String {
        switch title {
        case "Zero":
            return "零"
        case "One":
            return "一"
        case "Two":
            return "二"
        case "Three":
            return "三"
        case "Four":
            return "四"
        case "Five":
            return "五"
        case "Six":
            return "六"
        case "Seven":
            return "七"
        case "Eight":
            return "八"
        case "Nine":
            return "九"
        case "Ten":
            return "十"
        case "Eleven":
            return "十一"
        case "Twelve":
            return "十二"
        case "Thirteen":
            return "十三"
        case "Fourteen":
            return "十四"
        case "Fifteen":
            return "十五"
        case "Sixteen":
            return "十六"
        case "Seventeen":
            return "十七"
        case "Eightteen":
            return "十八"
        case "Nineteen":
            return "十九"
        case "Twenty":
            return "二十"
        default:
            return ""
        }
        
    }

    class func converEnToNum(title: String) -> String {
        switch title {
        case "Zero":
            return "0"
        case "One":
            return "1"
        case "Two":
            return "2"
        case "Three":
            return "3"
        case "Four":
            return "4"
        case "Five":
            return "5"
        case "Six":
            return "6"
        case "Seven":
            return "7"
        case "Eight":
            return "8"
        case "Nine":
            return "9"
        case "Ten":
            return "10"
        case "Eleven":
            return "11"
        case "Twelve":
            return "12"
        case "Thirteen":
            return "13"
        case "Fourteen":
            return "14"
        case "Fifteen":
            return "15"
        case "Sixteen":
            return "16"
        case "Seventeen":
            return "17"
        case "Eightteen":
            return "18"
        case "Nineteen":
            return "19"
        case "Twenty":
            return "20"
        default:
            return ""
        }
    }
    
    class func converNumToEn(cnTitle: AnyObject) -> String {
        let title = cnTitle as! Int
        
        if Int(title) != nil {
            switch title {
            case 0:
                return "Zero"
            case 1:
                return "One"
            case 2:
                return "Two"
            case 3:
                return "Three"
            case 4:
                return "Four"
            case 5:
                return "Five"
            case 6:
                return "Six"
            case 7:
                return "Seven"
            case 8:
                return "Eight"
            case 9:
                return "Nine"
            case 10:
                return "Ten"
            case 11:
                return "Eleven"
            case 12:
                return "Twelve"
            case 13:
                return "Thirteen"
            case 14:
                return "Fourteen"
            case 15:
                return "Fifteen"
            case 16:
                return "Sixteen"
            case 17:
                return "Seventeen"
            case 18:
                return "Eightteen"
            case 19:
                return "Nineteen"
            case 20:
                return "Twenty"
            default:
                break
            }
            
        }
        
        return ""
    }
    
    //MARK: - 第一个字母大写
    class func upperFirstLetter(var some: String) -> String {
        let index = some.startIndex.advancedBy(1)
        let firstLetter = some.substringToIndex(index)
        
        some = some.stringByReplacingCharactersInRange(Range(start: some.startIndex, end: some.startIndex.advancedBy(1)), withString: firstLetter.uppercaseString)
//        some = some.stringByReplacingOccurrencesOfString(firstLetter, withString: firstLetter.uppercaseString)
        
        return some
    }
    
    //MARK: - 加上a或an
    class func chooseQuantifiers(word: String) -> String {
        let index = word.startIndex.advancedBy(1)
        
        if word.substringToIndex(index) == "A" ||
            word.substringToIndex(index) == "E" ||
            word.substringToIndex(index) == "I" ||
            word.substringToIndex(index) == "O" ||
            word.substringToIndex(index) == "U" {
                return "an \(word)".lowercaseString
        }else {
            return "a \(word)".lowercaseString
        }
    }
    
    //MARK: - 得到a或an
    class func getAan(word: String) -> String {
        let index = word.startIndex.advancedBy(1)
        
        if word.substringToIndex(index) == "A" ||
            word.substringToIndex(index) == "E" ||
            word.substringToIndex(index) == "I" ||
            word.substringToIndex(index) == "O" ||
            word.substringToIndex(index) == "U" {
                return "an"
        }else {
            return "a"
        }
    }
    
    //MARK: - 加上by
    class func getTraffic(traffic: String) -> String {
//        if traffic == "Helicopter" {
//            return "take a helicopter"
//        }else if traffic == "submarine" {
//            return "take the submarine"
//        }else {
            return "by \(traffic.lowercaseString)"
//        }
    }
    
    //MARK: - 得到复数
    class func getThePlural(word: String) -> String {
        if word == "Fox" || word == "Peach" || word == "Bus" {
            return "\(word)es".lowercaseString
        }else {
            return "\(word)s".lowercaseString
        }
    }
    
    //MARK: - 得到高度
    class func getWidth(height: CGFloat, text: NSString, font: UIFont) -> CGSize {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = NSLineBreakMode.ByWordWrapping
        
        let size =  CGSizeMake(2000.0, height)
        let attributes = [NSFontAttributeName:font,NSParagraphStyleAttributeName:paragraphStyle.copy()]
        let options = NSStringDrawingOptions.UsesLineFragmentOrigin //| NSStringDrawingOptions.UsesFontLeading
        
        let labelSize = text.boundingRectWithSize(size, options: options, attributes: attributes, context: nil).size
        
        return labelSize
    }

    //MARK: - 时间转换为字符串
    class func getTime(date: NSDate, dateFormat: String) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = dateFormat
        
        let dateString = dateFormatter.stringFromDate(date)
        return dateString
    }
    
    class func getTopDates() -> [String] {
        let secondsPerDay:NSTimeInterval = 24 * 60 * 60
        
        let today = NSDate()
//        let yesterday = today.dateByAddingTimeInterval(-secondsPerDay)

        var dates = [String]()
        dates.append(getTime(today, dateFormat: "yyyy年MM月dd日"))
        for var i:NSTimeInterval = 1; i < 10; i++ {
            let day = today.dateByAddingTimeInterval(-secondsPerDay * i)
            dates.append(getTime(day, dateFormat: "yyyy年MM月dd日"))
        }
        
        return dates
    }
    
    //MARK: - 音频播放
    
    class func systemSound(sender: String) {
        if UserAPI.sharedInstance.audioState == "开启" {
            //建立的SystemSoundID对象
            var soundID:SystemSoundID = 0
            //获取声音地址
            let path = NSBundle.mainBundle().pathForResource("MP3/\(sender)", ofType: nil)
            //地址转换
            let baseURL = NSURL(fileURLWithPath: path!)
            //赋值
            AudioServicesCreateSystemSoundID(baseURL, &soundID)
            //播放声音
            AudioServicesPlaySystemSound(soundID)
        }
    }
    
}
