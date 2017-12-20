//
//  UserAPI.swift
//  Xwords
//
//  Created by Yanggl on 15/11/9.
//  Copyright © 2015年 yangl. All rights reserved.
//

import UIKit
import Foundation

enum ErrorType {
    case Date
    case Count
}

class UserAPI: AnyObject {
    
//    var fullName:String { //当取值的时候赋值为“你好”
//        get {
//            return "你好"
//        }
//    }
    
    var name :String = "Genius" {
        willSet {//在该属性变化前做点什么
            //print("name")
        }
        didSet {//在该属性变化后做点什么
            //DataAPI.updateUser(name, sex: self.sex, age: self.age, coins: self.coins)
        }
    }
    var sex  :String = "男" {
        willSet {}
        didSet {
            //DataAPI.updateUser(self.name, sex: sex, age: self.age, coins: self.coins)
        }
    }
    var age  :String = "0" {
        willSet {}
        didSet {
            //DataAPI.updateUser(self.name, sex: self.sex, age: age, coins: self.coins)
        }
    }
    var coins:String = "100" {
        willSet {}
        didSet {
            //DataAPI.updateUser(nil, sex: nil, age: nil, coins: coins)
        }
    }
    
    var graphicState = "六边形"     //背景图形
    var chooseState = "移动"          //选择状态
    var audioState = "开启"              //音乐状态

    var photo:UIImage = UIImage()
    
    var rewardUsual: Int = 0        //得到三星奖章
    var rewardGood: Int = 0         //得到六星奖章
    var rewardExcell: Int = 0       //得到九星奖牌
    var rewardBest: Int = 0         //得到冠军杯     （连续五次三星）
    var rewardFinished : Int = 0    //连续完成三星多少次
    
    var sceneNum = Scene()
    var sceneAnimal = Scene()
    var sceneFruit = Scene()
    var sceneTraffic = Scene()

    //MARK: - ShareInstance Method
    
    //1
    class var sharedInstance: UserAPI {
        //2
        struct Singleton {
            //3
            static let instance = UserAPI()
        }
        //4
        return Singleton.instance
    }
    
    //MARK: - Init Methods
    
    init () {
//        let arrar = [["lock":false, "growth":0, "startNum":0],
//        ["lock":true, "growth":0, "startNum":0],
//        ["lock":true, "growth":0, "startNum":0],
//        ["lock":true, "growth":0, "startNum":0],
//        ["lock":true, "growth":0, "startNum":0],
//        ["lock":true, "growth":0, "startNum":0]]
//        
//        var data = NSData()
//        do{
//            data = try NSJSONSerialization.dataWithJSONObject(arrar, options: NSJSONWritingOptions.PrettyPrinted) 
//            if data.length > 0 {
//                let json = NSString(data: data, encoding: NSUTF8StringEncoding)
//                print("\(json)")
//            }
//
//        } catch let error as NSError {
//            print("Could not create lv1Dict: \(error)")
//        }
        
        
        let photoPath = NSHomeDirectory().stringByAppendingFormat("/Library/Caches/user_photo.png")
        let user = DataAPI.queryUser()
        
        self.name   = user["NAME"] as! String
        self.sex    = user["SEX"]  as! String
        self.age    = user["AGE"]  as! String
        self.coins  = user["COINS"]as! String
        
        self.rewardUsual = user["RUSUAL"]as! Int
        self.rewardGood = user["RGOOD"]as! Int
        self.rewardExcell = user["REXCELL"]as! Int
        self.rewardBest = user["RBEST"]as! Int
        
        self.graphicState = user["GRAPHIC"] as! String
        self.chooseState = user["CHOOSE"] as! String
        self.audioState = user["AUDIO"] as! String

        if UIImage(contentsOfFile: photoPath) == nil {
            self.photo  = UIImage(named: "user_photo")!
        }else {
            self.photo = UIImage(contentsOfFile: photoPath)!
        }
        
        let scenes = DataAPI.queryScene()
        
        for scene in scenes {
            let dict = scene as! Dictionary<String, String>
            
            let lv1Json = dict["LV1"]!.dataUsingEncoding(NSUTF8StringEncoding)! as NSData
            let lv2Json = dict["LV2"]!.dataUsingEncoding(NSUTF8StringEncoding)! as NSData
            let lv3Json = dict["LV3"]!.dataUsingEncoding(NSUTF8StringEncoding)! as NSData
            
            var lv1 = Dictionary<String, AnyObject>!()
            var lv2 = Dictionary<String, AnyObject>!()
            var lv3 = Dictionary<String, AnyObject>!()
            
            do{
                lv1 = try NSJSONSerialization.JSONObjectWithData(lv1Json, options: NSJSONReadingOptions.MutableLeaves) as! Dictionary<String, AnyObject>
                lv2 = try NSJSONSerialization.JSONObjectWithData(lv2Json, options: NSJSONReadingOptions.MutableLeaves) as! Dictionary<String, AnyObject>
                lv3 = try NSJSONSerialization.JSONObjectWithData(lv3Json, options: NSJSONReadingOptions.MutableLeaves) as! Dictionary<String, AnyObject>
            } catch let error as NSError {
                print("Could not create lv1Dict: \(error)")
            }

            if dict["TITLE"] == "SCENE1" {
                self.sceneNum.lv1 = Level(lock: lv1["lock"] as! Bool, completed: lv1["complete"] as! NSInteger, starNum: lv1["starNum"] as! NSInteger)
                self.sceneNum.lv2 = Level(lock: lv2["lock"] as! Bool, completed: lv2["complete"] as! NSInteger, starNum: lv2["starNum"] as! NSInteger)
                self.sceneNum.lv3 = Level(lock: lv3["lock"] as! Bool, completed: lv3["complete"] as! NSInteger, starNum: lv3["starNum"] as! NSInteger)
           
            }else if dict["TITLE"] == "SCENE2" {
                self.sceneFruit.lv1 = Level(lock: lv1["lock"] as! Bool, completed: lv1["complete"] as! NSInteger, starNum: lv1["starNum"] as! NSInteger)
                self.sceneFruit.lv2 = Level(lock: lv2["lock"] as! Bool, completed: lv2["complete"] as! NSInteger, starNum: lv2["starNum"] as! NSInteger)
                self.sceneFruit.lv3 = Level(lock: lv3["lock"] as! Bool, completed: lv3["complete"] as! NSInteger, starNum: lv3["starNum"] as! NSInteger)
            
            }else if dict["TITLE"] == "SCENE3" {
                self.sceneAnimal.lv1 = Level(lock: lv1["lock"] as! Bool, completed: lv1["complete"] as! NSInteger, starNum: lv1["starNum"] as! NSInteger)
                self.sceneAnimal.lv2 = Level(lock: lv2["lock"] as! Bool, completed: lv2["complete"] as! NSInteger, starNum: lv2["starNum"] as! NSInteger)
                self.sceneAnimal.lv3 = Level(lock: lv3["lock"] as! Bool, completed: lv3["complete"] as! NSInteger, starNum: lv3["starNum"] as! NSInteger)
           
            }else if dict["TITLE"] == "SCENE4" {
                self.sceneTraffic.lv1 = Level(lock: lv1["lock"] as! Bool, completed: lv1["complete"] as! NSInteger, starNum: lv1["starNum"] as! NSInteger)
                self.sceneTraffic.lv2 = Level(lock: lv2["lock"] as! Bool, completed: lv2["complete"] as! NSInteger, starNum: lv2["starNum"] as! NSInteger)
                self.sceneTraffic.lv3 = Level(lock: lv3["lock"] as! Bool, completed: lv3["complete"] as! NSInteger, starNum: lv3["starNum"] as! NSInteger)
            }
        }
        
        
    }
    
    //MARK: - Public Methods
    
    func updateUser() {
        DataAPI.updateUser(self.name, sex: self.sex, age: self.age, coins: self.coins, rUsual: self.rewardUsual, rGood: self.rewardGood, rExcell: self.rewardExcell, rBest: self.rewardBest, graphic:self.graphicState, choose: self.chooseState, audio: self.audioState)
    }
    
    func updateScene(sceneType:SceneType, lvNum:String, lock:String, reward:(coin:String, grow:String, star:String)) {
        let (_, level) = HelperAPI.getCurrentScenelv(sceneType, lvName: lvNum)
        let grow = level.completed + Int(reward.grow)!
        
        level.completed = (grow >= 100) ? 100 : ((grow <= 0) ? 0 : grow)
        level.starNum = Int(reward.star)!
        level.lock = (lock == "true")
        
        self.coins = "\(Int(self.coins)! + Int(reward.coin)!)"
        
        DataAPI.updateScene("SCENE\(sceneType.rawValue)", lvName: lvNum, lock: lock,reward:(complete:"\(level.completed)", star:reward.star))
        updateUser()
    }
    
    func queryError(type: ErrorType) -> [ErrorList] {
        let array = DataAPI.queryError()
        
        var errArray = [Error]()
        for (word, count, date) in array {
            let error = Error()
            error.date = date
            error.count = count
            error.word = word
            errArray.append(error)
        }

        var listArray = [ErrorList]()
        switch type {
        case .Date:
            for date in HelperAPI.getTopDates() {
                var list = [Error]()
                for error in errArray {
                    if error.date == date {
                        list.append(error)
                    }
                }
                if list.count > 0 {
                    list.sortInPlace({$0.count > $1.count})
                    
                    let errorList = ErrorList()
                    errorList.listDate = date
                    errorList.listError = list
                    listArray.append(errorList)
                }
            }
        case .Count:
            var errorArray = errArray
            var tempArray = [Array<Error>]()
            
            for var i = 0; i < errorArray.count; i++ {
                let err = errorArray[i]
                var temp = [Error]()
                temp.append(err)
                
                for var j = i+1; j < errorArray.count; j++ {
                    let error = errorArray[j]
                    
                    if err.word == error.word {
                        temp.append(error)
                        errorArray.removeAtIndex(j)
                    }
                }
                tempArray.append(temp)
            }
            
            for array in tempArray {
                var count = 0
                for e in array {
                    count += Int(e.count)
                }
                
                let errorList = ErrorList()
                errorList.listWord = array[0].word
                errorList.listError = array
                errorList.listCount = count
                listArray.append(errorList)
            }
            listArray.sortInPlace({$0.listCount > $1.listCount})
        }
        
        return listArray
    }
    
}
