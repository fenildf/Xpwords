//
//  Lv2ndCircle.swift
//  Xpwords
//
//  Created by Yanggl on 15/11/12.
//  Copyright © 2015年 Yongl. All rights reserved.
//

import UIKit

protocol Lv2ndDelegate {
    func monitoring(isMonitor: Bool) -> Bool
}

class Lv2ndCircle: Circle {

    var sentenceTitle: String!
    var sentenceWords: [String]!
    var delegate:Lv2ndDelegate?

    private var sentenceNums = [AnyObject]()
    private var sentenceIndexs = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25]

    //MARK: - Init Methods
    
    override init(radiusValue: CGFloat, inView: UIView) {
        super.init(radiusValue: radiusValue, inView: inView)
        
    }

    func getSentence(index: Int) -> (cnTitle: String, words:[String]) {
        switch self.sceneType {
        case .Num:
            return getNumSentence(index)
        case .Animal:
            return getAnimalSentence(index)
        case .Fruit:
            return getFruitSentence(index)
        case .Traffic:
            return getTrafficSentence(index)
        }
    }
    
    func getNumSentence(index: Int) -> (cnTitle: String, words:[String])  {
        let numbers = NSMutableArray(array: NUMBERS)
        numbers.removeObjectsInArray(["Zero", "One"])
        sentenceNums.removeAll()
        
        switch index {
        case 0:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "请问李多大了？"
            let words = ["- Good morning, Liming.","- Good morning, \((sentenceNums[0]).lowercaseString) years old Lee."]
            
            return (cnTitle: title, words: words)
        case 1:
            numbers.addObject("One")
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "今天是几号？"
            let words = ["- What is the date today?","- Today is the number \((sentenceNums[0]).lowercaseString)."]
            
            return (cnTitle: title, words: words)
        case 2:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "我有几块蛋糕？"
            let words = ["- I have \((sentenceNums[0]).lowercaseString) pieces of cake. Do you want one？" ]
            
            return (cnTitle: title, words: words)
        case 3:
            numbers.addObject("One")
            numbers.removeObjectsInArray(["Zero","One","Two","Three"])
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "我们有多少人？"
            let words = ["- Welcome to China!", "- We have \((sentenceNums[0]).lowercaseString) people,Please follow me, Thank you." ]
            
            return (cnTitle: title, words: words)
        case 4:
            numbers.addObject("One")
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index] as! String
            sentenceNums.append(num)
            
            let title = "我多大了？"
            let words = ["- How old are you?", "- I am \((sentenceNums[0]).lowercaseString)." ]
            
            return (cnTitle: title, words: words)
        case 5:
            numbers.addObjectsFromArray(["Zero", "One"])
            var num = ""
            for var i = 0; i < 2; i++ {
                if num != "" {
                    numbers.removeObject(num)
                }
                let index = Int(arc4random_uniform(UInt32(numbers.count)))
                num = numbers[index] as! String
                sentenceNums.append(num)
            }
            
            let title = "老师提到了第几页？"
            let words = ["- It's time for class. ", "- Please trun to page \((sentenceNums[0]).lowercaseString) and \((sentenceNums[1]).lowercaseString). " ]
            
            return (cnTitle: title, words: words)
        case 6:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index] as! String
            sentenceNums.append(num)
            
            let title = "我丢了多少钱？"
            let words = ["- What's wrong with you?", "- I lost \((sentenceNums[0]).lowercaseString) dollars." ]
            
            return (cnTitle: title, words: words)
        case 7:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index] as! String
            sentenceNums.append(num)
            
            let title = "我们几个人要进去？"
            let words = ["- Can we come in \((sentenceNums[0]).lowercaseString)？", "- Come in please."]
            
            return (cnTitle: title, words: words)
        case 8:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index] as! String
            sentenceNums.append(num)
            
            let title = "让他们再等几分钟？"
            let words = ["- They are waiting for you.", "- Let them wait for \((sentenceNums[0]).lowercaseString) minutes."]
            
            return (cnTitle: title, words: words)
        case 9:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index] as! String
            sentenceNums.append(num)
            
            let title = "一天吃几次药？"
            let words = ["- Take this medicine \((sentenceNums[0]).lowercaseString) times a day."]
            
            return (cnTitle: title, words: words)
        case 10:
            numbers.addObjectsFromArray(["Zero", "One"])
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index] as! String
            sentenceNums.append(num)
            
            let title = "睡觉的时间是几点？"
            let words = ["- Now it's \((sentenceNums[0]).lowercaseString) o'clock, please go to sleep."]
            
            return (cnTitle: title, words: words)
        case 11:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index] as! String
            sentenceNums.append(num)
            
            let title = "我们有多少个梨？"
            let words = ["- One bye one please. no pushing. We have \((sentenceNums[0]).lowercaseString) pears."]
            
            return (cnTitle: title, words: words)
        case 12:
            numbers.addObjectsFromArray(["One"])
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index] as! String
            sentenceNums.append(num)
            
            let title = "还有几个？"
            let words = ["- And \((sentenceNums[0]).lowercaseString) more, please eat up."]
            
            return (cnTitle: title, words: words)
        case 13:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index] as! String
            sentenceNums.append(num)
            
            let title = "还有几分钟？"
            let words = ["- There are \((sentenceNums[0]).lowercaseString) minutes, let me try."]
            
            return (cnTitle: title, words: words)
        case 14:
            numbers.addObjectsFromArray(["Zero", "One"])
            var num = ""
            for var i = 0; i < 2; i++ {
                if num != "" {
                    numbers.removeObject(num)
                }
                let index = Int(arc4random_uniform(UInt32(numbers.count)))
                num = numbers[index] as! String
                sentenceNums.append(num)
            }
            
            let title = "那是几？"
            let words = ["- Look carefully, it is \((sentenceNums[0]).lowercaseString), isn't \((sentenceNums[1]).lowercaseString)."]
            sentenceNums.removeAtIndex(1)
            
            return (cnTitle: title, words: words)
        case 15:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index] as! String
            sentenceNums.append(num)
            
            let title = "要洗几次手？"
            let words = ["- Wash your hands \((sentenceNums[0]).lowercaseString) times."]
            
            return (cnTitle: title, words: words)
        case 16:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index] as! String
            sentenceNums.append(num)
            
            let title = "黎明多大了？"
            let words = ["- This is my friend, Liming , he is \((sentenceNums[0]).lowercaseString) years old."]
            
            return (cnTitle: title, words: words)
        case 17:
            var num = ""
            for var i = 0; i < 2; i++ {
                if num != "" {
                    numbers.removeObject(num)
                }
                let index = Int(arc4random_uniform(UInt32(numbers.count)))
                num = numbers[index] as! String
                sentenceNums.append(num)
            }
            
            let title = "你有几个兄弟？"
            let words = ["- Do you have \((sentenceNums[0]).lowercaseString) brithers?", "- No, I have \((sentenceNums[1]).lowercaseString)."]
            sentenceNums.removeAtIndex(0)
            
            return (cnTitle: title, words: words)
        case 18:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index] as! String
            sentenceNums.append(num)
            
            let title = "我要了几个苹果？"
            let words = ["- Give me \((sentenceNums[0]).lowercaseString) apples, please."]
            
            return (cnTitle: title, words: words)
        case 19:
            var num = ""
            for var i = 0; i < 2; i++ {
                if num != "" {
                    numbers.removeObject(num)
                }
                let index = Int(arc4random_uniform(UInt32(numbers.count)))
                num = numbers[index] as! String
                sentenceNums.append(num)
            }
            
            let titles = ["树上有几只鸟？", "树上有几只猴子？"]
            let title = titles[Int(arc4random_uniform(UInt32(titles.count)))]
            let words = ["- What are those on the tree?", "- \(sentenceNums[0]) birds, \((sentenceNums[1]).lowercaseString) monkeys."]
            
            if title == titles[0] {
                sentenceNums.removeAtIndex(1)
            }else {
                sentenceNums.removeAtIndex(0)
            }
            
            return (cnTitle: title, words: words)
        case 20:
            numbers.addObjectsFromArray(["One"])
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index] as! String
            sentenceNums.append(num)
            
            let title = "过了生日，你多大了？"
            let words = ["- Happy birthday to you! After this day you are \((sentenceNums[0]).lowercaseString)."]
            
            return (cnTitle: title, words: words)
        case 21:
            numbers.addObjectsFromArray(["Zero", "One"])
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index] as! String
            sentenceNums.append(num)
            
            let title = "你剩多少钱？"
            let words = ["- How much money we have?", "- \(sentenceNums[0]) left."]
            
            return (cnTitle: title, words: words)
        case 22:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index] as! String
            sentenceNums.append(num)
            
            let title = "等几分钟可以进去？"
            let words = ["- Excuse me, may I come in?", "- Wait \((sentenceNums[0]).lowercaseString) minutes."]
            
            return (cnTitle: title, words: words)
        case 23:
            numbers.addObjectsFromArray(["Zero", "One"])
            var num = ""
            for var i = 0; i < 2; i++ {
                if num != "" {
                    numbers.removeObject(num)
                }
                let index = Int(arc4random_uniform(UInt32(numbers.count)))
                num = numbers[index] as! String
                sentenceNums.append(num)
            }
            
            let title = "提到了几？"
            let words = ["- Who can tell me? Is that \((sentenceNums[0]).lowercaseString) or \((sentenceNums[1]).lowercaseString)?"]
            
            sentenceNums.removeAtIndex(Int(arc4random_uniform(UInt32(2))))
            
            return (cnTitle: title, words: words)
        case 24:
            numbers.removeObjectsInArray(["Two","Three"])
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index] as! String
            
            let titles = ["我需要几个男孩帮忙？", "我需要几个女孩帮忙？", "我需要几个人帮忙？"]
            let titleIndex = Int(arc4random_uniform(UInt32(titles.count)))
            let title = titles[titleIndex]
            let boys = Int(HelperAPI.converEnToNum(num))! / 2
            let girls = Int(HelperAPI.converEnToNum(num))! - Int(HelperAPI.converEnToNum(num))! / 2
            let words = ["- I need \(num.lowercaseString) people, \(HelperAPI.converNumToEn(boys).lowercaseString) boys and \(HelperAPI.converNumToEn(girls).lowercaseString) girls, who can do it?"]
            
            if titleIndex == 0 {
                sentenceNums.append(HelperAPI.converNumToEn(boys))
            }else if titleIndex == 1 {
                sentenceNums.append(HelperAPI.converNumToEn(girls))
            }else {
                sentenceNums.append(num)
            }
            
            return (cnTitle: title, words: words)
        case 25:
            numbers.addObjectsFromArray(["One"])
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index] as! String
            
            let titles = ["现在几点了？", "几点前必须到学校？"]
            let titleIndex = Int(arc4random_uniform(UInt32(titles.count)))
            let title = titles[titleIndex]
            let now = Int(HelperAPI.converEnToNum(num))! - 1
            let words = ["- Listen to me, we have to go to school before \(num.lowercaseString). Now it's \(HelperAPI.converNumToEn(now).lowercaseString). "]
            
            if titleIndex == 0 {
                sentenceNums.append(HelperAPI.converNumToEn(now))
            }else {
                sentenceNums.append(num)
            }
            
            return (cnTitle: title, words: words)
            
        default:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index] as! Int
            sentenceNums.append(num)
            
            let title = "黎明多大了？"
            let words = ["- This is my friend, Liming , he is \((sentenceNums[0]).lowercaseString) years old."]
            
            return (cnTitle: title, words: words)
        }
        
    }
    
    func getAnimalSentence(index: Int) -> (cnTitle: String, words:[String])  {
        let numbers = NSMutableArray(array: ANIMALS)
        sentenceNums.removeAll()
        
        switch index {
        case 0:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "你看到什么？"
            let a = HelperAPI.chooseQuantifiers(sentenceNums[0] as! String)
            let words = ["- Did you see the animal?", "- \(HelperAPI.upperFirstLetter(a))?"]
            
            return (cnTitle: title, words: words)
        case 1:
            var num = ""
            for var i = 0; i < 3; i++ {
                if num != "" {
                    numbers.removeObject(num)
                }
                let index = Int(arc4random_uniform(UInt32(numbers.count)))
                num = numbers[index] as! String
                sentenceNums.append(num)
            }
            
            let title = "大森林里有什么？"
            let words = ["- What animals in the forest?","- \(sentenceNums[0]), \((sentenceNums[1]).lowercaseString) and \((sentenceNums[2]).lowercaseString)."]
            
            return (cnTitle: title, words: words)
        case 2:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "提到了什么动物？"
            let words = ["- What animals in the zoo?","- There are many, such as \((sentenceNums[0]).lowercaseString)."]
            
            return (cnTitle: title, words: words)
        case 3:
            var num = ""
            for var i = 0; i < 2; i++ {
                if num != "" {
                    numbers.removeObject(num)
                }
                let index = Int(arc4random_uniform(UInt32(numbers.count)))
                num = numbers[index] as! String
                sentenceNums.append(num)
            }
            
            let title = "那是什么动物？"
            let words = ["- Look, \(HelperAPI.chooseQuantifiers(sentenceNums[0] as! String))!","- NO, it is \(HelperAPI.chooseQuantifiers(sentenceNums[1] as! String))."]
            sentenceNums.removeAtIndex(0)
            
            return (cnTitle: title, words: words)
        case 4:
            var num = ""
            for var i = 0; i < 2; i++ {
                if num != "" {
                    numbers.removeObject(num)
                }
                let index = Int(arc4random_uniform(UInt32(numbers.count)))
                num = numbers[index] as! String
                sentenceNums.append(num)
            }
            
            let titles = ["什么动物有三只？", "什么动物有四只？"]
            let title = titles[Int(arc4random_uniform(UInt32(titles.count)))]
            let words = ["- What animals over there?", "- Three \(HelperAPI.getThePlural(sentenceNums[0] as! String)), four \(HelperAPI.getThePlural(sentenceNums[1] as! String))."]
            
            if title == titles[0] {
                sentenceNums.removeAtIndex(1)
            }else {
                sentenceNums.removeAtIndex(0)
            }

            return (cnTitle: title, words: words)
        case 5:
            numbers.removeObject("Elephant")
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "谁在跟大象比重量？"
            let words = ["- The elephant is some times heavier than the \((sentenceNums[0]).lowercaseString)."]
            
            return (cnTitle: title, words: words)
        case 6:
            numbers.removeObject("Elephant")
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "谁在鼻子短？"
            let words = ["- Whose nose is longer?", "- The \((sentenceNums[0]).lowercaseString)'s nose is shorter than the elephant."]
            
            return (cnTitle: title, words: words)
        case 7:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "什么很凶？"
            let words = ["- My \((sentenceNums[0]).lowercaseString) is very fierce.", "- Thit's not true."]
            
            return (cnTitle: title, words: words)
        case 8:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "图片上画的是什么？"
            let a = HelperAPI.chooseQuantifiers(sentenceNums[0] as! String)
            let words = ["- Please look at the picture. What's this?", "- \(HelperAPI.upperFirstLetter(a))!"]
            
            return (cnTitle: title, words: words)
        case 9:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "我们昨天学习了什么？"
            let words = ["- Yesterday we have learnt some animal's name.", "- Yes, I know the \((sentenceNums[0]).lowercaseString)!"]
            
            return (cnTitle: title, words: words)
        case 10:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "我想要看什么？"
            let words = ["- I will take you to the zoo, do you want to go?", "- Yes, I want to see the \((sentenceNums[0]).lowercaseString)."]
            
            return (cnTitle: title, words: words)
        case 11:
            var num = ""
            for var i = 0; i < 3; i++ {
                if num != "" {
                    numbers.removeObject(num)
                }
                let index = Int(arc4random_uniform(UInt32(numbers.count)))
                num = numbers[index] as! String
                sentenceNums.append(num)
            }
            
            let title = "我看到了什么？"
            let words = ["- What can you see?", "- I can see \(HelperAPI.getThePlural(sentenceNums[0] as! String)), \(HelperAPI.getThePlural(sentenceNums[1] as! String)), \(HelperAPI.getThePlural(sentenceNums[2] as! String)) and so on."]
            
            return (cnTitle: title, words: words)
        case 12:
            numbers.removeObject("fox")
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "我喜欢什么动物？"
            let words = ["- Do you like the fox?", "- NO, he is sly, I like \(HelperAPI.getThePlural(sentenceNums[0] as! String))."]
            
            return (cnTitle: title, words: words)
        case 13:
            var num = ""
            for var i = 0; i < 2; i++ {
                if num != "" {
                    numbers.removeObject(num)
                }
                let index = Int(arc4random_uniform(UInt32(numbers.count)))
                num = numbers[index] as! String
                sentenceNums.append(num)
            }
            
            let title = "我们读了哪些动物的名字？"
            let words = ["- Now, let's read them together. \(sentenceNums[0]), \((sentenceNums[0]).lowercaseString).", "- \(sentenceNums[0])! \(sentenceNums[1])!"]
            
            return (cnTitle: title, words: words)
        case 14:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "我们看到了什么？"
            let words = ["- Look! What's this?", "- It's \(HelperAPI.chooseQuantifiers(sentenceNums[0] as! String))."]
            
            return (cnTitle: title, words: words)
        case 15:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "我在跟谁问好？"
            let words = ["- Hello, \((sentenceNums[0]).lowercaseString)!", "- Who are you talking to hello?"]
            
            return (cnTitle: title, words: words)
        case 16:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "我们要跟谁再见？"
            let words = ["- Ok, it's time to say bye-bye to \((sentenceNums[0]).lowercaseString), we must to go."]
            
            return (cnTitle: title, words: words)
        case 17:
            var num = ""
            for var i = 0; i < 2; i++ {
                if num != "" {
                    numbers.removeObject(num)
                }
                let index = Int(arc4random_uniform(UInt32(numbers.count)))
                num = numbers[index] as! String
                sentenceNums.append(num)
            }
            
            let title = "谁在河里？"
            let words = ["- Is there \(HelperAPI.chooseQuantifiers(sentenceNums[0] as! String)) in the river?", "- No, it is \(HelperAPI.chooseQuantifiers(sentenceNums[1] as! String))."]
            sentenceNums.removeAtIndex(0)
            
            return (cnTitle: title, words: words)
        case 18:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "谁在哭？"
            let words = ["- Keep guiet! Listen carefully!", "- Oh, \(HelperAPI.chooseQuantifiers(sentenceNums[0] as! String)) is crying! What's the matter?"]
            
            return (cnTitle: title, words: words)

        case 19:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "什么很吓人？"
            let words = ["- Do you want to play with the lovely \((sentenceNums[0]).lowercaseString)?", "- No, it is really sick!"]
            
            return (cnTitle: title, words: words)
        case 20:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "我演的是什么？"
            let words = ["- \(sentenceNums[0]) \((sentenceNums[0]).lowercaseString) Where are you?", "- I am here!"]
            
            return (cnTitle: title, words: words)
        case 21:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "我是什么？"
            let words = ["- I am \(HelperAPI.chooseQuantifiers(sentenceNums[0] as! String)), nice to meet you !", "- Nice to meet you too."]
            
            return (cnTitle: title, words: words)
        case 22:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "谁是愚蠢的？"
            let words = ["- I will catch you!", "- You'll never catch me, stupid \((sentenceNums[0]).lowercaseString)!"]
            
            return (cnTitle: title, words: words)
        case 23:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "谁说他会飞？"
            let words = ["- I can fly!", "- Are you sure, \((sentenceNums[0]).lowercaseString)?"]
            
            return (cnTitle: title, words: words)
        case 24:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "提到了哪种动物？"
            let words = ["- Can the \((sentenceNums[0]).lowercaseString) swimming?"]
            
            return (cnTitle: title, words: words)
        case 25:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "你是什么？"
            let words = ["- I am a tiger!", "- NO, you are \(HelperAPI.chooseQuantifiers(sentenceNums[0] as! String))."]
            
            return (cnTitle: title, words: words)

        default:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "你是什么？"
            let words = ["- I am a tiger!", "- NO, you are \(HelperAPI.chooseQuantifiers(sentenceNums[0] as! String))."]
            
            return (cnTitle: title, words: words)
        }
    }
    
    func getFruitSentence(index: Int) -> (cnTitle: String, words:[String])  {
        let numbers = NSMutableArray(array: FRUITS)
        sentenceNums.removeAll()
        
        switch index {
        case 0:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "我喜欢什么？"
            let words = ["- What do you like？.","- I like \(HelperAPI.getThePlural(sentenceNums[0] as! String))."]
            
            return (cnTitle: title, words: words)
        case 1:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "我喜欢吃什么？"
            let words = ["- Wash your hands！ It's time to eat.","- Oh, I like \(HelperAPI.getThePlural(sentenceNums[0] as! String))."]
            
            return (cnTitle: title, words: words)
        case 2:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "提到了什么？"
            let words = ["- Who likes \((sentenceNums[0]).lowercaseString)? Stand up!"]
            
            return (cnTitle: title, words: words)
        case 3:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "那是什么？"
            let words = ["- What is this？","- It is \(HelperAPI.chooseQuantifiers(sentenceNums[0] as! String))."]
            
            return (cnTitle: title, words: words)
        case 4:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "我喜欢什么水果？"
            let words = ["- I like this \((sentenceNums[0]).lowercaseString), it's small."]
            
            return (cnTitle: title, words: words)
            
        case 5:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "我在吃什么？"
            let words = ["- What are you doing?","- Eatting \(HelperAPI.chooseQuantifiers(sentenceNums[0] as! String))."]
            
            return (cnTitle: title, words: words)
        case 6:
            var num = ""
            for var i = 0; i < 2; i++ {
                if num != "" {
                    numbers.removeObject(num)
                }
                let index = Int(arc4random_uniform(UInt32(numbers.count)))
                num = numbers[index] as! String
                sentenceNums.append(num)
            }
            
            let title = "我更喜欢什么？"
            let words = ["- I like \(HelperAPI.getThePlural(sentenceNums[0] as! String)) better than \(HelperAPI.getThePlural(sentenceNums[1] as! String))."]
            sentenceNums.removeAtIndex(1)
            
            return (cnTitle: title, words: words)
        case 7:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "赢的人将获得什么？"
            let words = ["- Let us play a game, win will get \(HelperAPI.chooseQuantifiers(sentenceNums[0] as! String))."]
            
            return (cnTitle: title, words: words)
        case 8:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "我摸到了什么？"
            let a = HelperAPI.chooseQuantifiers(sentenceNums[0] as! String)
            let words = ["- Close your eyes, and hold out your hand, touch what is this?", "- \(HelperAPI.upperFirstLetter(a))."]
            
            return (cnTitle: title, words: words)
        case 9:
            var num = ""
            for var i = 0; i < 2; i++ {
                if num != "" {
                    numbers.removeObject(num)
                }
                let index = Int(arc4random_uniform(UInt32(numbers.count)))
                num = numbers[index] as! String
                sentenceNums.append(num)
            }
            
            let title = "哪个比较甜？"
            let a = HelperAPI.getThePlural(sentenceNums[0] as! String)
            let words = ["- \(HelperAPI.upperFirstLetter(a)) are sweeter than \(HelperAPI.getThePlural(sentenceNums[1] as! String))."]
            sentenceNums.removeAtIndex(1)
            
            return (cnTitle: title, words: words)
        case 10:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "什么很大？"
            let words = ["- The \((sentenceNums[0]).lowercaseString) is big. Let's eat it."]
            
            return (cnTitle: title, words: words)
        case 11:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "我要了什么？"
            let words = ["- Give me three \(HelperAPI.getThePlural(sentenceNums[0] as! String))."]
            
            return (cnTitle: title, words: words)
        case 12:
            var num = ""
            for var i = 0; i < 3; i++ {
                if num != "" {
                    numbers.removeObject(num)
                }
                let index = Int(arc4random_uniform(UInt32(numbers.count)))
                num = numbers[index] as! String
                sentenceNums.append(num)
            }
            
            let title = "提到了哪些？"
            let words = ["- Smell the \((sentenceNums[0]).lowercaseString). Feel the \((sentenceNums[1]).lowercaseString). Taste the \((sentenceNums[2]).lowercaseString)."]
            
            return (cnTitle: title, words: words)
        case 13:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "拿起什么？"
            let words = ["- Hold up \(HelperAPI.chooseQuantifiers(sentenceNums[0] as! String))."]
            
            return (cnTitle: title, words: words)
        case 14:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "我喜欢什么水果？"
            let words = ["- What fruit do you like？"," - \(sentenceNums[0])s."]
            
            return (cnTitle: title, words: words)
        case 15:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "我说的是什么？"
            let words = ["- Let's me say, it's red and round. What's it?", "- It is \(HelperAPI.chooseQuantifiers(sentenceNums[0] as! String))!"]
            
            return (cnTitle: title, words: words)
        case 16:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "什么很甜？"
            let words = ["- Why do you like \(HelperAPI.getThePlural(sentenceNums[0] as! String))?", "- Because It's very sweet."]
            
            return (cnTitle: title, words: words)
        case 17:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "我说的是什么？"
            let words = ["- Do you know what fruit is very sweet?","- \(sentenceNums[0])s?"]
            
            return (cnTitle: title, words: words)
        case 18:
            var num = ""
            for var i = 0; i < 2; i++ {
                if num != "" {
                    numbers.removeObject(num)
                }
                let index = Int(arc4random_uniform(UInt32(numbers.count)))
                num = numbers[index] as! String
                sentenceNums.append(num)
            }
            
            let title = "提到了什么？"
            let words = ["- Is that \(HelperAPI.chooseQuantifiers(sentenceNums[0] as! String))?","- NO, it is \(HelperAPI.chooseQuantifiers(sentenceNums[1] as! String))."]
            
            return (cnTitle: title, words: words)
        case 19:
            var num = ""
            for var i = 0; i < 2; i++ {
                if num != "" {
                    numbers.removeObject(num)
                }
                let index = Int(arc4random_uniform(UInt32(numbers.count)))
                num = numbers[index] as! String
                sentenceNums.append(num)
            }
            
            let title = "那是什么？"
            let words = ["- Look, \(HelperAPI.getAan(sentenceNums[0] as! String)) big \((sentenceNums[0]).lowercaseString)!","- NO, it is \(HelperAPI.getAan(sentenceNums[1] as! String)) big \((sentenceNums[1]).lowercaseString)."]
            sentenceNums.removeAtIndex(0)
            
            return (cnTitle: title, words: words)
        case 20:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "我看到了什么？"
            let words = ["- What do you see?","- I can see some \(HelperAPI.getThePlural(sentenceNums[0] as! String))."]
            
            return (cnTitle: title, words: words)
        case 21:
            var num = ""
            for var i = 0; i < 2; i++ {
                if num != "" {
                    numbers.removeObject(num)
                }
                let index = Int(arc4random_uniform(UInt32(numbers.count)))
                num = numbers[index] as! String
                sentenceNums.append(num)
            }
            
            let title = "说了哪种水果？"
            let words = ["- Please speak two kinds of fruit?","- \(sentenceNums[0]) and \((sentenceNums[1]).lowercaseString)."]
            
            return (cnTitle: title, words: words)
        case 22:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "我喜欢什么？"
            let words = ["- How beautiful \(HelperAPI.chooseQuantifiers(sentenceNums[0] as! String)), I like it."]
            
            return (cnTitle: title, words: words)
        case 23:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "我在画什么？"
            let a = HelperAPI.chooseQuantifiers(sentenceNums[0] as! String)
            let words = ["- What are you drawing?","- \(HelperAPI.upperFirstLetter(a))."]
            
            return (cnTitle: title, words: words)

        case 24:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "尝尝什么？"
            let words = ["- Taste the \((sentenceNums[0]).lowercaseString), very good."]
            
            return (cnTitle: title, words: words)

        case 25:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "你看到了什么？"
            let a = HelperAPI.chooseQuantifiers(sentenceNums[0] as! String)
            let words = ["- Look at the picture, what can you see?"," - \(HelperAPI.upperFirstLetter(a))."]
            
            return (cnTitle: title, words: words)

        default:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "你看到了什么？"
            let a = HelperAPI.chooseQuantifiers(sentenceNums[0] as! String)
            let words = ["- Look at the picture, what can you see?"," - \(HelperAPI.upperFirstLetter(a))."]
            
            return (cnTitle: title, words: words)
        }
    }

    func getTrafficSentence(index: Int) -> (cnTitle: String, words:[String])  {
        let numbers = NSMutableArray(array: TRAFFICS)
        sentenceNums.removeAll()
        
        switch index {
        case 0:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "我们怎么走？"
            let words = ["- Let's go \(HelperAPI.getTraffic(sentenceNums[0] as! String)), OK?.","- Yes, of course."]
            
            return (cnTitle: title, words: words)
        case 1:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "那是什么？"
            let words = ["- What is it?","- It is \(HelperAPI.chooseQuantifiers(sentenceNums[0] as! String))."]
            
            return (cnTitle: title, words: words)
        case 2:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "问了什么？"
            let words = ["- Where is the \((sentenceNums[0]).lowercaseString) going?"]
            
            return (cnTitle: title, words: words)
        case 3:
            numbers.removeObjectsInArray(["Spaceship", "Submarine"])
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "我要怎么去上海？"
            let words = ["- I will go to Shanghai \(HelperAPI.getTraffic(sentenceNums[0] as! String)).","- How about sitting in my car?"]
            
            return (cnTitle: title, words: words)
        case 4:
            numbers.removeObjectsInArray(["Spaceship", "Submarine","Helicopter",
                "Plane"])
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "我们怎么去公园？"
            let words = ["- Let's go to the park \(HelperAPI.getTraffic(sentenceNums[0] as! String))!"]
            
            return (cnTitle: title, words: words)
        case 5:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "什么很大？"
            let words = ["- The \((sentenceNums[0]).lowercaseString) is very big!", "- Yes, it is."]
            
            return (cnTitle: title, words: words)
        case 6:
            numbers.removeObjectsInArray(["Submarine", "Spaceship"])
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "怎么去学校？"
            let words = ["- How do you go to school?", "- I go to school \(HelperAPI.getTraffic(sentenceNums[0] as! String))."]
            
            return (cnTitle: title, words: words)
        case 7:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "我看到了什么？"
            let words = ["- What do you see?", "- I see \(HelperAPI.chooseQuantifiers(sentenceNums[0] as! String))."]
            
            return (cnTitle: title, words: words)
        case 8:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "什么非常棒？"
            let words = ["- The \((sentenceNums[0]).lowercaseString) is great."]
            
            return (cnTitle: title, words: words)
        case 9:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "正在读什么？"
            let words = ["- Read after me, \((sentenceNums[0]).lowercaseString).", "- \(sentenceNums[0])!"]
            
            return (cnTitle: title, words: words)
        case 10:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "什么很漂亮？"
            let words = ["- The \((sentenceNums[0]).lowercaseString) is beauful!", "- Yes, it is. "]
            
            return (cnTitle: title, words: words)
        case 11:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "我打算怎么去北京？"
            let by = HelperAPI.getTraffic(sentenceNums[0] as! String)
            let words = ["- How are you going to Beijing?", "- \(HelperAPI.upperFirstLetter(by))."]
            
            return (cnTitle: title, words: words)
        case 12:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "怎么去西藏？"
            let words = ["- How about we go to Tibet \(HelperAPI.getTraffic(sentenceNums[0] as! String))?"]
            
            return (cnTitle: title, words: words)
        case 13:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "我们怎么去火星？"
            let words = ["- We will go to Mars \(HelperAPI.getTraffic(sentenceNums[0] as! String)).", "- Really?"]
            
            return (cnTitle: title, words: words)
        case 14:
            var num = ""
            for var i = 0; i < 2; i++ {
                if num != "" {
                    numbers.removeObject(num)
                }
                let index = Int(arc4random_uniform(UInt32(numbers.count)))
                num = numbers[index] as! String
                sentenceNums.append(num)
            }
            
            let title = "什么更快？"
            let words = ["- It's faster to go \(HelperAPI.getTraffic(sentenceNums[0] as! String)) than \(HelperAPI.getTraffic(sentenceNums[1] as! String))."]
            
            return (cnTitle: title, words: words)
        case 15:
            numbers.removeObjectsInArray(["Boat", "Ship", "Bike", "Train", "Bus", "Car", "Truck", "Motorcycle", "Submarine"])
            var num = ""
            for var i = 0; i < 2; i++ {
                if num != "" {
                    numbers.removeObject(num)
                }
                let index = Int(arc4random_uniform(UInt32(numbers.count)))
                num = numbers[index] as! String
                sentenceNums.append(num)
            }
            
            let title = "什么可以在天上飞？"
            let words = ["- What can fly in the sky?", "- \(sentenceNums[0]) and \((sentenceNums[1]).lowercaseString)."]
            
            return (cnTitle: title, words: words)
        case 16:
            numbers.removeObjectsInArray(["Bike", "Train", "Bus", "Car", "Truck", "Motorcycle",
                "Helicopter", "Airship", "Spaceship", "Plane", "Balloon"])
            var num = ""
            for var i = 0; i < 2; i++ {
                if num != "" {
                    numbers.removeObject(num)
                }
                let index = Int(arc4random_uniform(UInt32(numbers.count)))
                num = numbers[index] as! String
                sentenceNums.append(num)
            }
            
            let title = "什么东西可以水里游？"
            let words = ["- What can swim in the water?", "- \(sentenceNums[0]) and \((sentenceNums[1]).lowercaseString)."]
            
            return (cnTitle: title, words: words)
        case 17:
            numbers.removeObjectsInArray(["Boat", "Ship", "Submarine", "Helicopter", "Airship", "Spaceship", "Plane", "Balloon"])
            var num = ""
            for var i = 0; i < 2; i++ {
                if num != "" {
                    numbers.removeObject(num)
                }
                let index = Int(arc4random_uniform(UInt32(numbers.count)))
                num = numbers[index] as! String
                sentenceNums.append(num)
            }
            
            let title = "什么东西可以路上行？"
            let words = ["- What can run on the road?", "- \(sentenceNums[0]) and \((sentenceNums[1]).lowercaseString)."]
            
            return (cnTitle: title, words: words)
        case 18:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "哪种交通工具最快？"
            let words = ["- What kind of transportation is the fastest?", "- \(sentenceNums[0])."]
            
            return (cnTitle: title, words: words)
        case 19:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "希望以后有什么？"
            let words = ["- I want to have \(HelperAPI.chooseQuantifiers(sentenceNums[0] as! String)) in the future."]
            
            return (cnTitle: title, words: words)
        case 20:
            numbers.removeObjectsInArray(["Submarine", "Spaceship"])
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "喜欢怎么去？"
            let words = ["- How are you going?", "- I like to go anywhere \(HelperAPI.getTraffic(sentenceNums[0] as! String))."]
            
            return (cnTitle: title, words: words)
        case 21:
            numbers.removeObject("Bike")
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "在问什么交通工具？"
            let words = ["- Which \((sentenceNums[0]).lowercaseString) goes to Xi'an?"]
            
            return (cnTitle: title, words: words)
        case 22:
            numbers.removeObjectsInArray(["Submarine", "Spaceship"])
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "最快的方式是什么？"
            let by = HelperAPI.getTraffic(sentenceNums[0] as! String)
            let words = ["- What's the quickest way to get there?", "- \(HelperAPI.upperFirstLetter(by))."]
            
            return (cnTitle: title, words: words)
        case 23:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "我喜欢什么？"
            let words = ["- I'm going \(HelperAPI.getTraffic(sentenceNums[0] as! String)). I like \((sentenceNums[0]).lowercaseString)."]
            
            return (cnTitle: title, words: words)
        case 24:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "你的什么很漂亮？"
            let words = ["- Your \((sentenceNums[0]).lowercaseString) is so beautiful, I love it.", "- Thanks."]
            
            return (cnTitle: title, words: words)
        case 25:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "刚刚过去了什么？"
            let words = ["- Just past \(HelperAPI.chooseQuantifiers(sentenceNums[0] as! String))."]
            
            return (cnTitle: title, words: words)

        default:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let title = "刚刚过去了什么？"
            let words = ["- Just past \(HelperAPI.chooseQuantifiers(sentenceNums[0] as! String))."]
            
            return (cnTitle: title, words: words)
        }
    }
    
    //MARK: - Public Methods

    override func show(view:UIView) {
        let rgbs = NSMutableArray(array: COLORS) //全部的颜色
        let numbers = NSMutableArray(array: getTitles())//全部的数字
        
        var count = [0, 1, 2, 3, 4, 5]
        var arcIndexs = [Int]()
        for var i = 0; i < sentenceNums.count; i++ {
            numbers.removeObject(sentenceNums[i])
            let arcIndex = Int(arc4random_uniform(UInt32(count.count)))//随机的关卡里数量的第几个
            arcIndexs.append(count[arcIndex])
            count.removeAtIndex(arcIndex)
        }
        
        var rgb = 100
        var title = ""
        for var i = 0; i < 6; i++ {
            if rgb != 100 || title != ""  {
                rgbs.removeObject(rgb)
                numbers.removeObject(title)
            }
            
            var index = Int(arc4random_uniform(UInt32(rgbs.count)))
            rgb = rgbs[index] as! Int
            index = Int(arc4random_uniform(UInt32(numbers.count)))
            title = numbers[index] as! String
            for arcIndex in arcIndexs {
                if arcIndex == i {
                    title = sentenceNums[arcIndexs.indexOf(arcIndex)!] as! String
                    print(" \(arcIndex) \(title), \(sentenceNums) ")
                }
            }
            
            let button = BubbleButton(frame: CGRectMake(0, 0, 2 * self.bubbleRadius, 2 * self.bubbleRadius), rgb: rgb, title:title, icon:UIImage(named: getImageName(title)))
            button.contactView = view
            bubbles.append(button)
            self.parentView.addSubview(button)
        }
        
        showAfterAnimationType()
        
        var inetratorI = 0
        for bubble in bubbles {
            let delayTime = (NSTimeInterval) (CGFloat( inetratorI ) * 0.1)
            self.performSelector(Selector("showBubbleWithAnimation:"), withObject: bubble, afterDelay: delayTime)
            ++inetratorI
            
            bubble.clkBlock = { bubble in
                print("\(bubble.eleName) ")
                let isTrue = bubble.eleName == "\(self.sentenceNums[0])"
                let isOther = (self.sentenceNums.count > 1) ? bubble.eleName == "\(self.sentenceNums[1])" : false
                let isAnyOther = (self.sentenceNums.count > 2) ? bubble.eleName == "\(self.sentenceNums[2])" : false
                let monitor =  self.delegate!.monitoring(isTrue || isOther || isAnyOther)
                
                if monitor && !(isTrue || isOther || isAnyOther) {
                    DataAPI.insertError("\(self.sentenceNums[0])", date: NSDate())
                }
            }
        }
    }
    
    func showChioce() {
        sentenceIndexs = (sentenceIndexs.count == 0) ? letIndexs : sentenceIndexs
        let sentenceIndex = Int(arc4random_uniform(UInt32(sentenceIndexs.count))) //随机的选择显示那一句话
        let (title, words) = getSentence(sentenceIndexs[sentenceIndex])
        sentenceIndexs.removeAtIndex(sentenceIndex)
        
        sentenceTitle = title
        sentenceWords = words
    }


}
