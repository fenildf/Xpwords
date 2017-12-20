//
//  DataAPI.swift
//  Xwords
//
//  Created by Yanggl on 15/11/9.
//  Copyright © 2015年 yangl. All rights reserved.
//

import UIKit


class DataAPI: AnyObject {
//    NULL. 空值
//    INTEGER. 整型
//    REAL.浮点型
//    TEXT.文本类型
//    BLOB. 二进制类型
    class func create() -> FMDatabase {
        let dbPath = NSHomeDirectory().stringByAppendingFormat("/Library/Caches/DB.db")
        let db = FMDatabase(path: dbPath)
        
        if !NSFileManager.defaultManager().fileExistsAtPath(dbPath) {
            if db.open() {
                let sql = "CREATE TABLE USER (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT, SEX TEXT, AGE TEXT, COINS TEXT, RUSUAL INTEGER, RGOOD INTEGER, REXCELL INTEGER, RBEST INTEGER, GRAPHIC TEXT, CHOOSE TEXT, AUDIO TEXT)"
                let sql2 = "CREATE TABLE SCENE (ID INTEGER PRIMARY KEY AUTOINCREMENT,TITLE TEXT, LV1 TEXT, LV2 TEXT, LV3 TEXT)"
                let sql3 = "CREATE TABLE ERROR (ID INTEGER PRIMARY KEY AUTOINCREMENT,ERROR TEXT, COUNT INTEGER, DATE TEXT)"

                let res = db.executeUpdate(sql, withArgumentsInArray: nil)
                let res2 = db.executeUpdate(sql2, withArgumentsInArray: nil)
                let res3 = db.executeUpdate(sql3, withArgumentsInArray: nil)

                if !res || !res2 || !res3 {
                    print("error when creating db table")
                }else {
                    print("success when creating db table")
                    insert()
                }
                db.close()
            }
        }
        return db
    }
    
    class func insert() {
        let db = self.create()
        if db.open() {
            let sqlInsert = "INSERT INTO USER (NAME, SEX, AGE, COINS, RUSUAL, RGOOD, REXCELL, RBEST, GRAPHIC, CHOOSE, AUDIO) VALUES ('Genius', '男', '0', '100', '2', '0', '0', '0', '六边形', '移动', '开启') "
            let sqlInsert1 = "INSERT INTO SCENE (TITLE, LV1, LV2, LV3) VALUES ('SCENE1', '{\"complete\":0,\"lock\":false,\"starNum\":0}', '{\"complete\":0,\"lock\":true,\"starNum\":0}', '{\"complete\":0,\"lock\":true,\"starNum\":0}') "
            let sqlInsert2 = "INSERT INTO SCENE (TITLE, LV1, LV2, LV3) VALUES ('SCENE2', '{\"complete\":0,\"lock\":true,\"starNum\":0}', '{\"complete\":0,\"lock\":true,\"starNum\":0}', '{\"complete\":0,\"lock\":true,\"starNum\":0}') "
            let sqlInsert3 = "INSERT INTO SCENE (TITLE, LV1, LV2, LV3) VALUES ('SCENE3', '{\"complete\":0,\"lock\":true,\"starNum\":0}', '{\"complete\":0,\"lock\":true,\"starNum\":0}', '{\"complete\":0,\"lock\":true,\"starNum\":0}') "
            let sqlInsert4 = "INSERT INTO SCENE (TITLE, LV1, LV2, LV3) VALUES ('SCENE4', '{\"complete\":0,\"lock\":true,\"starNum\":0}', '{\"complete\":0,\"lock\":true,\"starNum\":0}', '{\"complete\":0,\"lock\":true,\"starNum\":0}') "

            let res = db.executeUpdate(sqlInsert, withArgumentsInArray: nil)
            let res1 = db.executeUpdate(sqlInsert1, withArgumentsInArray: nil)
            let res2 = db.executeUpdate(sqlInsert2, withArgumentsInArray: nil)
            let res3 = db.executeUpdate(sqlInsert3, withArgumentsInArray: nil)
            let res4 = db.executeUpdate(sqlInsert4, withArgumentsInArray: nil)
            
            if !res || !res1 || !res2 || !res3 || !res4 {
                print("error when insert db table")
            }else {
                print("success when insert db table")
            }
            
            db.close()
        }
    }
    
    class func queryUser() -> Dictionary<String, AnyObject> {
        let db = self.create()
        var userDict = Dictionary<String, AnyObject>()

        if db.open() {
            let sqlQuery = "SELECT * FROM USER"
            let rSet = db.executeQuery(sqlQuery, withArgumentsInArray: nil)
            
            while rSet.next() {
                userDict = ["NAME":rSet.stringForColumn("NAME"),
                    "SEX" :rSet.stringForColumn("SEX"),
                    "AGE" :rSet.stringForColumn("AGE"),
                    "COINS" :rSet.stringForColumn("COINS"),
                    "RUSUAL" :Int(rSet.intForColumn("RUSUAL")),
                    "RGOOD" :Int(rSet.intForColumn("RGOOD")),
                    "REXCELL" :Int(rSet.intForColumn("REXCELL")),
                    "RBEST" :Int(rSet.intForColumn("RBEST")),
                    "GRAPHIC" :rSet.stringForColumn("GRAPHIC"),
                    "CHOOSE" :rSet.stringForColumn("CHOOSE"),
                    "AUDIO" :rSet.stringForColumn("AUDIO")]

            }
            
            db.close()
        }
        
        return userDict
    }
    
    class func queryScene() -> Array<AnyObject> {
        let db = self.create()
        var sceneArray = Array<AnyObject>()
        
        if db.open() {
            let sqlQuery = "SELECT * FROM SCENE"
            let rSet = db.executeQuery(sqlQuery, withArgumentsInArray: nil)
            
            while rSet.next() {
                let scene = ["TITLE":rSet.stringForColumn("TITLE"),
                    "LV1" :rSet.stringForColumn("LV1"),
                    "LV2" :rSet.stringForColumn("LV2"),
                    "LV3" :rSet.stringForColumn("LV3")]
                sceneArray.append(scene)
            }
            
            db.close()
        }
        
        return sceneArray
    }
    
    class func queryError() -> [(word:String, count:Int32, date: String)] {
        let db = self.create()
        var errorArray = Array<(word:String, count:Int32, date: String)>()
        
        if db.open() {
            let sqlQuery = "SELECT * FROM ERROR"
            let rSet = db.executeQuery(sqlQuery, withArgumentsInArray: nil)
            
            while rSet.next() {
                let scene = (word:rSet.stringForColumn("ERROR")! ,
                    count:rSet.intForColumn("COUNT"),
                    date:rSet.stringForColumn("DATE")!)
                errorArray.append(scene)
            }
            
            db.close()
        }        
        
        return errorArray
    }
    
    class func updateUser(name:String, sex:String, age:String, coins:String, rUsual:Int, rGood:Int, rExcell:Int, rBest:Int, graphic:String, choose:String, audio:String) {
        let db = self.create()
        
        if db.open() {
            let sqlUpdate = "UPDATE USER SET NAME = '\(name)', SEX = '\(sex)', AGE = '\(age)', COINS = '\(coins)', RUSUAL = '\(rUsual)', RGOOD = '\(rGood)', REXCELL = '\(rExcell)', RBEST = '\(rBest)', GRAPHIC = '\(graphic)', CHOOSE = '\(choose)', AUDIO = '\(audio)' "
            let rSet = db.executeUpdate(sqlUpdate, withArgumentsInArray: nil )

            if !rSet {
                print("error when update db table")
            }else {
                print("success when update db table")
            }
            db.close()
        }
    }
    
    class func updateScene(title:String, lvName:String, lock:String, reward:(complete:String, star:String)) {
        let db = self.create()
        
        if db.open() {
            let sqlUpdate = "UPDATE SCENE SET '\(lvName)' = '{\"complete\":\(reward.complete),\"lock\":\(lock),\"starNum\":\(reward.star)}' WHERE TITLE = '\(title)' "
            let rSet = db.executeUpdate(sqlUpdate, withArgumentsInArray: nil )
            
            if !rSet {
                print("error when update db table")
            }else {
                print("success when update db table")
            }
            db.close()
        }
    }

    class func insertError(error: String, date: NSDate) {
        let db = self.create()
        
        let dateStr = HelperAPI.getTime(date, dateFormat: "yyyy年MM月dd日")
        if db.open() {
            let sqlSelect = "SELECT COUNT FROM ERROR WHERE ERROR = '\(error)' AND DATE = '\(dateStr)' "
            let sSet = db.executeQuery(sqlSelect, withArgumentsInArray: nil)

            var count:Int32 = 0
            while sSet.next() {
                count = sSet.intForColumn("COUNT")
                
                let sqlUpdate = "UPDATE ERROR SET COUNT = '\(count + 1)' WHERE ERROR = '\(error)' AND DATE = '\(dateStr)' "
                let rSet = db.executeUpdate(sqlUpdate, withArgumentsInArray: nil )
                
                if !rSet {
                    print("error when update db table")
                }else {
                    print("success when update db table")
                }
            }
            if count == 0 {
                let sqlInsert = "INSERT INTO ERROR (ERROR, DATE, COUNT) VALUES ('\(error)', '\(dateStr)', '\(1)') "
                let rSet = db.executeUpdate(sqlInsert, withArgumentsInArray: nil )
                
                if !rSet {
                    print("error when update db table")
                }else {
                    print("success when update db table")
                }
            }

            db.close()
        }
    }
}
