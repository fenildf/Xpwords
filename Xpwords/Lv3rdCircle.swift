//
//  Lv3rdCircle.swift
//  Xpwords
//
//  Created by Yanggl on 15/11/12.
//  Copyright © 2015年 Yongl. All rights reserved.
//

import UIKit

protocol Lv3rdDelegate {
    func monitoring(isMonitor: Bool, isOnly:Bool, show: String) -> Bool
}

class Lv3rdCircle: Circle {
    var sentenceTitle: String!
    var sentenceWords: [String]!
    var delegate:Lv3rdDelegate?
    
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
        let numbers = NSMutableArray(array: NUMBERS)//全部的数字
        numbers.removeObjectsInArray(["Zero", "One"])
        sentenceNums.removeAll()
        
        switch index {
        case 0:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index] 
            sentenceNums.append(num)
            
            let words = ["I have", "\((sentenceNums[0]).lowercaseString)", "dollars"]
            let title = "我有?块钱。"
            
            return (cnTitle: title, words: words)
        case 1:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["I am", "\((sentenceNums[0]).lowercaseString)","years old"]
            let title = "我?岁了。"
            
            return (cnTitle: title, words: words)
        case 2:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["I have", "\((sentenceNums[0]).lowercaseString)", "brothers"]
            let title = "我有?个兄弟。"
            
            return (cnTitle: title, words: words)
        case 3:
            numbers.addObjectsFromArray(["One"])
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["I'm in grade three class", "\((sentenceNums[0]).lowercaseString)"]
            let title = "我在三年级?班。"
            
            return (cnTitle: title, words: words)
        case 4:
            numbers.addObjectsFromArray(["One"])
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["My grandmother left", "\((sentenceNums[0]).lowercaseString)", "teeth"]
            let title = "奶奶剩下?颗牙。"
            
            return (cnTitle: title, words: words)
        case 5:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["He has", "\((sentenceNums[0]).lowercaseString)", "cars"]
            let title = "他有?辆车。"
            
            return (cnTitle: title, words: words)
        case 6:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["Give me", "\((sentenceNums[0]).lowercaseString)", "apples"]
            let title = "给我?个苹果。"
            
            return (cnTitle: title, words: words)
        case 7:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["She lent me", "\((sentenceNums[0]).lowercaseString)", "rubbers"]
            let title = "她借给我?块橡皮。"
            
            return (cnTitle: title, words: words)
        case 6:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["There are", "\((sentenceNums[0]).lowercaseString)", "watermelons left"]
            let title = "这里剩下?个西瓜。"
            
            return (cnTitle: title, words: words)
        case 7:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["The sky over", "\((sentenceNums[0]).lowercaseString)", "birds"]
            let title = "天空飞过?只鸟。"
            
            return (cnTitle: title, words: words)
        case 8:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["We have", "\((sentenceNums[0]).lowercaseString)", "people"]
            let title = "我们有?个人。"
            
            return (cnTitle: title, words: words)
        case 9:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["Mother bought", "\((sentenceNums[0]).lowercaseString)", "bananas"]
            let title = "妈妈买了?个香蕉。"
            
            return (cnTitle: title, words: words)
        case 10:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["I have", "\((sentenceNums[0]).lowercaseString)", "pigeons"]
            let title = "我养了?只鸽子。"
            
            return (cnTitle: title, words: words)
        case 11:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["\((sentenceNums[0]).lowercaseString)", "kilometers from my home"]
            let title = "这里离我家?公里。"
            
            return (cnTitle: title, words: words)
        case 12:
            numbers.addObjectsFromArray(["Zero", "One"])
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["There will be rain tomorrow at", "\((sentenceNums[0]).lowercaseString)"]
            let title = "明天?点有雨。"
            
            return (cnTitle: title, words: words)
        case 13:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["\((sentenceNums[0]).lowercaseString)", "days a month"]
            let title = "一个月有?天吗？"
            
            return (cnTitle: title, words: words)
        case 14:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["I lost", "\((sentenceNums[0]).lowercaseString)", "dollars"]
            let title = "我丢了?块钱。"
            
            return (cnTitle: title, words: words)
        case 15:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["Let's wait for him for", "\((sentenceNums[0]).lowercaseString)", "minutes"]
            let title = "让我们等他?分钟。"
            
            return (cnTitle: title, words: words)
        case 16:
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
            
            let words = ["Please trun to page", "\((sentenceNums[0]).lowercaseString)", "and", "\((sentenceNums[1]).lowercaseString)"]
            let title = "请翻到?页和?页。"
            
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
            
            let words = ["There are", "\((sentenceNums[0]).lowercaseString)", "boys", "and", "\((sentenceNums[1]).lowercaseString)", "girls in the class"]
            let title = "班里有?个男生，?个女生。"
            
            return (cnTitle: title, words: words)
        case 18:
            var num = ""
            for var i = 0; i < 3; i++ {
                if num != "" {
                    numbers.removeObject(num)
                }
                let index = Int(arc4random_uniform(UInt32(numbers.count)))
                num = numbers[index] as! String
                sentenceNums.append(num)
            }
            
            let words = ["There are", "\((sentenceNums[0]).lowercaseString)", "lions in the zoo", "\((sentenceNums[1]).lowercaseString)", "monkeys and", "\((sentenceNums[2]).lowercaseString)", "tigers"]
            let title = "动物园里有?只狮子，?只猴子，?只老虎。"
            
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
            
            let words = ["There are", "\((sentenceNums[0]).lowercaseString)", "pencils in the pencil box", "\((sentenceNums[1]).lowercaseString)", "pens"]
            let title = "铅笔盒里有?支铅笔，?支钢笔。"
            
            return (cnTitle: title, words: words)
        case 20:
            var num = ""
            for var i = 0; i < 3; i++ {
                if num != "" {
                    numbers.removeObject(num)
                }
                let index = Int(arc4random_uniform(UInt32(numbers.count)))
                num = numbers[index] as! String
                sentenceNums.append(num)
            }
            
            let words = ["There are", "\((sentenceNums[0]).lowercaseString)", "birds on the tree", "\((sentenceNums[1]).lowercaseString)", "monkeys", "\((sentenceNums[2]).lowercaseString)", "cats"]
            let title = "树上有?只鸟，?只猴，?只猫。"
            
            return (cnTitle: title, words: words)
        case 21:
            var num = ""
            for var i = 0; i < 3; i++ {
                if num != "" {
                    numbers.removeObject(num)
                }
                let index = Int(arc4random_uniform(UInt32(numbers.count)))
                num = numbers[index] as! String
                sentenceNums.append(num)
            }
            
            let words = ["He has", "\((sentenceNums[0]).lowercaseString)", "dollars", "I have", "\((sentenceNums[1]).lowercaseString)", "and you have", "\((sentenceNums[2]).lowercaseString)"]
            let title = "他有?块钱，我有?块，你有?块。"
            
            return (cnTitle: title, words: words)
        case 22:
            var num = ""
            for var i = 0; i < 3; i++ {
                if num != "" {
                    numbers.removeObject(num)
                }
                let index = Int(arc4random_uniform(UInt32(numbers.count)))
                num = numbers[index] as! String
                sentenceNums.append(num)
            }
            
            let words = ["He has", "\((sentenceNums[0]).lowercaseString)", "dollars", "I have", "\((sentenceNums[1]).lowercaseString)", "and you have", "\((sentenceNums[2]).lowercaseString)"]
            let title = "他有?块钱，我有?块，你有?块。"
            
            return (cnTitle: title, words: words)
        case 23:
            numbers.addObjectsFromArray(["Zero", "One"])
            var nums = [String]()
            var num = ""
            for var i = 0; i < 2; i++ {
                if num != "" {
                    numbers.removeObject(num)
                }
                let index = Int(arc4random_uniform(UInt32(numbers.count)))
                num = numbers[index] as! String
                nums.append(num)
            }
            
            if Int(HelperAPI.converEnToNum(nums[0])) >= Int(HelperAPI.converEnToNum(nums[1])) {
                sentenceNums.append(HelperAPI.converNumToEn(Int(HelperAPI.converEnToNum(nums[0]))! - Int(HelperAPI.converEnToNum(nums[1]))!))
                sentenceNums.append(nums[1])
                sentenceNums.append(nums[0])
            }else {
                sentenceNums.append(HelperAPI.converNumToEn(Int(HelperAPI.converEnToNum(nums[1]))! - Int(HelperAPI.converEnToNum(nums[0]))!))
                sentenceNums.append(nums[0])
                sentenceNums.append(nums[1])
            }
            
            let words = ["\((sentenceNums[0]).lowercaseString)", "plus", "\((sentenceNums[1]).lowercaseString)", "is", "\((sentenceNums[2]).lowercaseString)"]
            let title = "?加?等于?。"
            
            return (cnTitle: title, words: words)
        case 24:
            numbers.addObjectsFromArray(["Zero", "One"])
            var nums = [String]()
            var num = ""
            for var i = 0; i < 2; i++ {
                if num != "" {
                    numbers.removeObject(num)
                }
                let index = Int(arc4random_uniform(UInt32(numbers.count)))
                num = numbers[index] as! String
                nums.append(num)
            }
            
            if Int(HelperAPI.converEnToNum(nums[0])) >= Int(HelperAPI.converEnToNum(nums[1])) {
                sentenceNums.append(nums[0])
                sentenceNums.append(nums[1])
                sentenceNums.append(HelperAPI.converNumToEn(Int(HelperAPI.converEnToNum(nums[0]))! - Int(HelperAPI.converEnToNum(nums[1]))!))
            }else {
                sentenceNums.append(nums[1])
                sentenceNums.append(nums[0])
                sentenceNums.append(HelperAPI.converNumToEn(Int(HelperAPI.converEnToNum(nums[1]))! - Int(HelperAPI.converEnToNum(nums[0]))!))
            }
            
            let words = ["\((sentenceNums[0]).lowercaseString)", "minus", "\((sentenceNums[1]).lowercaseString)", "is", "\((sentenceNums[2]).lowercaseString)"]
            let title = "?减?等于?。"
            
            return (cnTitle: title, words: words)
        case 25:
            numbers.addObjectsFromArray(["Zero", "One"])
            var nums = [String]()
            var num = ""
            for var i = 0; i < 2; i++ {
                if num != "" {
                    numbers.removeObject(num)
                }
                let index = Int(arc4random_uniform(UInt32(numbers.count)))
                num = numbers[index] as! String
                nums.append(num)
            }
            
            if Int(HelperAPI.converEnToNum(nums[0]))! * Int(HelperAPI.converEnToNum(nums[1]))! <= 20 {
                sentenceNums.append(nums[0])
                sentenceNums.append(nums[1])
                sentenceNums.append(HelperAPI.converNumToEn(Int(HelperAPI.converEnToNum(nums[0]))! * Int(HelperAPI.converEnToNum(nums[1]))!))
            }else {
                sentenceNums.append(nums[0])
                sentenceNums.append(HelperAPI.converNumToEn(20 / Int(HelperAPI.converEnToNum(nums[0]))!))
                sentenceNums.append(HelperAPI.converNumToEn(20 / Int(HelperAPI.converEnToNum(nums[0]))! * Int(HelperAPI.converEnToNum(nums[0]))!))
            }
            
            let words = ["\((sentenceNums[0]).lowercaseString)", "times", "\((sentenceNums[1]).lowercaseString)", "is", "\((sentenceNums[2]).lowercaseString)"]
            let title = "?乘以?等于?。"
            
            return (cnTitle: title, words: words)
        default:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["The sky over", "\((sentenceNums[0]).lowercaseString)", "birds"]
            let title = "天空飞过?只鸟。"
            
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
            
            let words = ["the", "\((sentenceNums[0]).lowercaseString)", "is very lovely"]
            let title = "这只?真可爱。"
            
            return (cnTitle: title, words: words)
        case 1:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)

            let words = ["I am", HelperAPI.chooseQuantifiers(sentenceNums[0] as! String)]
            let title = "我是一只?。"
            
            return (cnTitle: title, words: words)
        case 2:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["I have", "two", HelperAPI.getThePlural(sentenceNums[0] as! String)]
            let title = "我养了两只?。"
            
            return (cnTitle: title, words: words)
        case 3:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["There are", "four", HelperAPI.getThePlural(sentenceNums[0] as! String), "in the zoo"]
            let title = "动物园里有四只?。"
            
            return (cnTitle: title, words: words)
        case 4:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["A big", "\((sentenceNums[0]).lowercaseString)", "over there"]
            let title = "那边有一只?。"
            
            return (cnTitle: title, words: words)
        case 5:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["I want to see", "the", "\((sentenceNums[0]).lowercaseString)"]
            let title = "我想看?。"
            
            return (cnTitle: title, words: words)
        case 6:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["I can see", HelperAPI.chooseQuantifiers(sentenceNums[0] as! String)]
            let title = "我看见了一只?。"
            
            return (cnTitle: title, words: words)
        case 7:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["Do you like", "the", "\((sentenceNums[0]).lowercaseString)"]
            let title = "你喜欢?吗。"
            
            return (cnTitle: title, words: words)
        case 8:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["I like", HelperAPI.getThePlural(sentenceNums[0] as! String)]
            let title = "我喜欢?吗。"
            
            return (cnTitle: title, words: words)
        case 9:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["It's", "A big", "\((sentenceNums[0]).lowercaseString)"]
            let title = "他是一只大?。"
            
            return (cnTitle: title, words: words)
        case 10:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["\((sentenceNums[0]).lowercaseString)", "\((sentenceNums[0]).lowercaseString)", "where are you",]
            let title = "?，你在哪？"
            
            return (cnTitle: title, words: words)
        case 11:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["Can", "the", "\((sentenceNums[0]).lowercaseString)", "climb a tree"]
            let title = "?会爬树吗？"
            
            return (cnTitle: title, words: words)
        case 12:
            var num = ""
            for var i = 0; i < 2; i++ {
                if num != "" {
                    numbers.removeObject(num)
                }
                let index = Int(arc4random_uniform(UInt32(numbers.count)))
                num = numbers[index] as! String
                sentenceNums.append(num)
            }
            
            let words = ["three", HelperAPI.getThePlural(sentenceNums[0] as! String), "and", "two", HelperAPI.getThePlural(sentenceNums[1] as! String), "over there"]
            let title = "那边有三只?和两只?。"
            
            return (cnTitle: title, words: words)
        case 13:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["the", "\((sentenceNums[0]).lowercaseString)", "is crying, what's the matter"]
            let title = "这只?在叫，她怎么了？"
            
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
            
            let words = ["What animals do you like", "\((sentenceNums[0]).lowercaseString)", "or","\((sentenceNums[1]).lowercaseString)"]
            let title = "你喜欢什么动物？?还是?？"
            
            return (cnTitle: title, words: words)
        case 15:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["My favorite animals is", "\((sentenceNums[0]).lowercaseString)"]
            let title = "我最喜欢的动物是?。"
            
            return (cnTitle: title, words: words)
        case 16:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["the", "\((sentenceNums[0]).lowercaseString)", "is a very fierce animal"]
            let title = "?是非常凶猛的动物。"
            
            return (cnTitle: title, words: words)
        case 17:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = [HelperAPI.getThePlural(sentenceNums[0] as! String), "are very friendly to humans"]
            let title = "?是非常温和的动物。"
            
            return (cnTitle: title, words: words)
        case 18:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["the", "\((sentenceNums[0]).lowercaseString)", "runs very fast"]
            let title = "?跑起来非常快。"
            
            return (cnTitle: title, words: words)
        case 19:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["\((sentenceNums[0]).lowercaseString)", "is a good friend of mankind"]
            let title = "?是人类的好朋友。"
            
            return (cnTitle: title, words: words)
        case 20:
            var num = ""
            for var i = 0; i < 3; i++ {
                if num != "" {
                    numbers.removeObject(num)
                }
                let index = Int(arc4random_uniform(UInt32(numbers.count)))
                num = numbers[index] as! String
                sentenceNums.append(num)
            }
            
            let words = ["The old man likes raising", HelperAPI.getThePlural(sentenceNums[0] as! String), HelperAPI.getThePlural(sentenceNums[1] as! String), "and", HelperAPI.getThePlural(sentenceNums[2] as! String)]
            let title = "这个老人喜欢养?、?和?。"
            
            return (cnTitle: title, words: words)
        case 21:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["Her", "\((sentenceNums[0]).lowercaseString)", "came up and rubbed itself against their legs"]
            let title = "她的?跑上前来，在他们腿上蹭来蹭去。"
            
            return (cnTitle: title, words: words)
        case 22:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["My", "\((sentenceNums[0]).lowercaseString)", "Xiaomao was the only thing I had"]
            let title = "我的?小毛是我唯一拥有的。"
            
            return (cnTitle: title, words: words)
        case 23:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["She fought like", HelperAPI.chooseQuantifiers(sentenceNums[0] as! String)]
            let title = "她勇猛地像一头?。"
            
            return (cnTitle: title, words: words)
        case 24:
            var num = ""
            for var i = 0; i < 2; i++ {
                if num != "" {
                    numbers.removeObject(num)
                }
                let index = Int(arc4random_uniform(UInt32(numbers.count)))
                num = numbers[index] as! String
                sentenceNums.append(num)
            }
            
            let words = ["Which has spots", "the", "\((sentenceNums[0]).lowercaseString)", "or", "the", "\((sentenceNums[1]).lowercaseString)"]
            let title = "有斑点的是?还是?？"
            
            return (cnTitle: title, words: words)
        case 25:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["She fought like", HelperAPI.chooseQuantifiers(sentenceNums[0] as! String)]
            let title = "她战斗起来地像一头?。"
            
            return (cnTitle: title, words: words)
        default:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["\((sentenceNums[0]).lowercaseString)", "is a good friend of mankind"]
            let title = "?是人类的好朋友。"
            
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
            
            let words = ["I like", HelperAPI.getThePlural(sentenceNums[0] as! String)]
            let title = "我喜欢?。"
            
            return (cnTitle: title, words: words)
        case 1:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["the", "\((sentenceNums[0]).lowercaseString)", "is very sweet"]
            let title = "这个?很甜。"
            
            return (cnTitle: title, words: words)
        case 2:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["It is", HelperAPI.chooseQuantifiers(sentenceNums[0] as! String)]
            let title = "那是一个?。"
            
            return (cnTitle: title, words: words)
        case 3:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["the", "\((sentenceNums[0]).lowercaseString)", "is so big"]
            let title = "这个?很大。"
            
            return (cnTitle: title, words: words)
        case 4:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["Taste", "the", "\((sentenceNums[0]).lowercaseString)", "what about it"]
            let title = "尝尝这个?，好吃吗？"
            
            return (cnTitle: title, words: words)
        case 5:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["the", "\((sentenceNums[0]).lowercaseString)", "is red and round"]
            let title = "这个?很红很圆。"
            
            return (cnTitle: title, words: words)
        case 6:
            numbers.removeObject("peach")
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["I have", "two", HelperAPI.getThePlural(sentenceNums[0] as! String), "and you"]
            let title = "我有两个?，你呢？"
            
            return (cnTitle: title, words: words)
        case 7:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["How lovely", HelperAPI.chooseQuantifiers(sentenceNums[0] as! String), "I like it"]
            let title = "好可爱的?，我喜欢。"
            
            return (cnTitle: title, words: words)
        case 8:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["I'd like to eat", HelperAPI.getThePlural(sentenceNums[0] as! String)]
            let title = "我想吃?。"
            
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
            
            let words = ["I like eating", HelperAPI.getThePlural(sentenceNums[0] as! String), "but now I like to eat", HelperAPI.chooseQuantifiers(sentenceNums[1] as! String)]
            let title = "我喜欢吃?，但是现在我想吃一个?。"
            
            return (cnTitle: title, words: words)
        case 10:
            var num = ""
            for var i = 0; i < 3; i++ {
                if num != "" {
                    numbers.removeObject(num)
                }
                let index = Int(arc4random_uniform(UInt32(numbers.count)))
                num = numbers[index] as! String
                sentenceNums.append(num)
            }
            
            let words = ["Yes,I do", "I like", HelperAPI.getThePlural(sentenceNums[0] as! String), HelperAPI.getThePlural(sentenceNums[1] as! String), "and", HelperAPI.getThePlural(sentenceNums[2] as! String)]
            let title = "是的, 我喜欢. 我喜欢?, ?和?。"
            
            return (cnTitle: title, words: words)
        case 11:
            var num = ""
            for var i = 0; i < 2; i++ {
                if num != "" {
                    numbers.removeObject(num)
                }
                let index = Int(arc4random_uniform(UInt32(numbers.count)))
                num = numbers[index] as! String
                sentenceNums.append(num)
            }
            
            let words = ["I like", "\((sentenceNums[0]).lowercaseString)", "rather than", "\((sentenceNums[2]).lowercaseString)"]
            let title = "我喜欢?,而不是?。"
            
            return (cnTitle: title, words: words)
        case 12:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["It's", HelperAPI.chooseQuantifiers(sentenceNums[0] as! String), "I like", HelperAPI.getThePlural(sentenceNums[0] as! String)]
            let title = "这是一个?. 我喜欢?。"
            
            return (cnTitle: title, words: words)
        case 13:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["I saw a nice red delicious", "\((sentenceNums[0]).lowercaseString)"]
            let title = "我看见了一个漂亮的可口的?。"
            
            return (cnTitle: title, words: words)
        case 14:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["His face is like", HelperAPI.chooseQuantifiers(sentenceNums[0] as! String)]
            let title = "他的脸像?。"
            
            return (cnTitle: title, words: words)
        case 15:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["There are", "five", HelperAPI.getThePlural(sentenceNums[0] as! String), "on the tree"]
            let title = "树上有五个?。"
            
            return (cnTitle: title, words: words)
        case 16:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["My father bought", "six", HelperAPI.getThePlural(sentenceNums[0] as! String)]
            let title = "我爸买了六个?。"
            
            return (cnTitle: title, words: words)
        case 17:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["We have", "five", HelperAPI.getThePlural(sentenceNums[0] as! String), "left"]
            let title = "我们还剩下五个?。"
            
            return (cnTitle: title, words: words)
        case 18:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["There are", "two", HelperAPI.getThePlural(sentenceNums[0] as! String), "trees in my yard"]
            let title = "我院子里有两棵?树。"
            
            return (cnTitle: title, words: words)
        case 19:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["He pulled", HelperAPI.chooseQuantifiers(sentenceNums[0] as! String), "from the tree"]
            let title = "他从树上摘下一只?。"
            
            return (cnTitle: title, words: words)
        case 20:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["The following summer", "the", "\((sentenceNums[0]).lowercaseString)", "tree was laden with fruit"]
            let title = "第二年夏天树上就结满了?。"
            
            return (cnTitle: title, words: words)
        case 21:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["\((sentenceNums[0]).lowercaseString)", "fruit are just the thing for a healthy snack"]
            let title = "?正是健康的小点心。"
            
            return (cnTitle: title, words: words)
        case 22:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["Eating", HelperAPI.getThePlural(sentenceNums[0] as! String), "is good for your health"]
            let title = "?正是健康的小点心。"
            
            return (cnTitle: title, words: words)
        case 23:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["\((sentenceNums[0]).lowercaseString)", "is one of the fruits that I like the most"]
            let title = "?是我最喜欢水果中的一个。"
            
            return (cnTitle: title, words: words)
        case 24:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = [HelperAPI.chooseQuantifiers(sentenceNums[0] as! String), "is a kind of fruit"]
            let title = "?是一种水果。"
            
            return (cnTitle: title, words: words)
        case 25:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["My favorite fruit is", "\((sentenceNums[0]).lowercaseString)"]
            let title = "我最喜欢的水果是?。"
            
            return (cnTitle: title, words: words)

        default:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["My favorite fruit is", "\((sentenceNums[0]).lowercaseString)"]
            let title = "我最喜欢的水果是?。"
            
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
            
            let words = ["Let's go", "\(HelperAPI.getTraffic(sentenceNums[0] as! String))"]
            let title = "我们去乘?。"
            
            return (cnTitle: title, words: words)
        case 1:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["It is", HelperAPI.chooseQuantifiers(sentenceNums[0] as! String)]
            let title = "那是一个?。"
            
            return (cnTitle: title, words: words)
        case 2:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["Where is", "the", "\((sentenceNums[0]).lowercaseString)", "going"]
            let title = "这个?要去哪？"
            
            return (cnTitle: title, words: words)
        case 3:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["I will go to Beijing", "\(HelperAPI.getTraffic(sentenceNums[0] as! String))"]
            let title = "我要乘?去北京。"
            
            return (cnTitle: title, words: words)
        case 4:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["I saw a beautiful", "\((sentenceNums[0]).lowercaseString)"]
            let title = "我看到了一辆非常漂亮的?。"
            
            return (cnTitle: title, words: words)
        case 5:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = [HelperAPI.chooseQuantifiers(sentenceNums[0] as! String), "is a fast way to go to school"]
            let title = "乘?是一种去很快的去学校的方式。"
            
            return (cnTitle: title, words: words)
        case 6:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["Too many", HelperAPI.getThePlural(sentenceNums[0] as! String), "on the road would cause traffic jams"]
            let title = "路上?太多会导致交通堵塞。"
            
            return (cnTitle: title, words: words)
        case 7:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["\((sentenceNums[0]).lowercaseString)", "produces bad gases"]
            let title = "?会生产有害气体。"
            
            return (cnTitle: title, words: words)
        case 8:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["Going on foot is the slower than", HelperAPI.chooseQuantifiers(sentenceNums[0] as! String)]
            let title = "走路比乘?慢。"
            
            return (cnTitle: title, words: words)
        case 9:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["We have to spend a lot money to buy", HelperAPI.chooseQuantifiers(sentenceNums[0] as! String)]
            let title = "我们必须花很多钱去买一个?。"
            
            return (cnTitle: title, words: words)
        case 10:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["the", "\((sentenceNums[0]).lowercaseString)", "produces gases that pollute the air"]
            let title = "?会生产一些气体释放到空气里。"
            
            return (cnTitle: title, words: words)
        case 11:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["Many students can go to school", "\(HelperAPI.getTraffic(sentenceNums[0] as! String))"]
            let title = "很多学生会乘?去学校。"
            
            return (cnTitle: title, words: words)
        case 12:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["I dont have so much money to afford such", HelperAPI.chooseQuantifiers(sentenceNums[0] as! String)]
            let title = "我负担不起这个?。"
            
            return (cnTitle: title, words: words)
        case 13:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["Driving", HelperAPI.chooseQuantifiers(sentenceNums[0] as! String), "is not the same as driving a car"]
            let title = "驾?和开车不是一回事。"
            
            return (cnTitle: title, words: words)
        case 14:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = [HelperAPI.chooseQuantifiers(sentenceNums[0] as! String), "is something in which people can travel across water"]
            let title = "?是带人们过河的一种东西。"
            
            return (cnTitle: title, words: words)
        case 15:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = [HelperAPI.chooseQuantifiers(sentenceNums[0] as! String), "is on the water"]
            let title = "?在水上。"
            
            return (cnTitle: title, words: words)
        case 16:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = [HelperAPI.chooseQuantifiers(sentenceNums[0] as! String), "is on the road"]
            let title = "?在路上。"
            
            return (cnTitle: title, words: words)
        case 17:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["the", "\((sentenceNums[0]).lowercaseString)", "is in the air"]
            let title = "?在天空飞行。"
            
            return (cnTitle: title, words: words)
        case 18:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["Driving", HelperAPI.chooseQuantifiers(sentenceNums[0] as! String), "is really a lot of fun"]
            let title = "驾?很有趣。"
            
            return (cnTitle: title, words: words)
        case 19:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["Many children like", HelperAPI.getThePlural(sentenceNums[0] as! String)]
            let title = "很多孩子喜欢?。"
            
            return (cnTitle: title, words: words)
        case 20:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = [HelperAPI.chooseQuantifiers(sentenceNums[0] as! String), "is far much cheaper than any of the other three means of transportation"]
            let title = "?是远比其他三个更便宜的交通工具。"
            
            return (cnTitle: title, words: words)
        case 21:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["I will have", HelperAPI.chooseQuantifiers(sentenceNums[0] as! String), "of my own"]
            let title = "我会有自己的?。"
            
            return (cnTitle: title, words: words)
        case 22:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["The taxi is faster and more convient than", "\((sentenceNums[0]).lowercaseString)"]
            let title = "出租车比?更快和更方便。"
            
            return (cnTitle: title, words: words)
        case 23:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["My", "\((sentenceNums[0]).lowercaseString)", "was stolen"]
            let title = "我的?被偷了。"
            
            return (cnTitle: title, words: words)
        case 24:
            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            let num = numbers[index]
            sentenceNums.append(num)
            
            let words = ["Your", "\((sentenceNums[0]).lowercaseString)", "is more beautiful than mine"]
            let title = "你的?比我的漂亮。"
            
            return (cnTitle: title, words: words)
        case 25:
            var num = ""
            for var i = 0; i < 2; i++ {
                if num != "" {
                    numbers.removeObject(num)
                }
                let index = Int(arc4random_uniform(UInt32(numbers.count)))
                num = numbers[index] as! String
                sentenceNums.append(num)
            }
            
            let words = ["Which one do you like model", "\((sentenceNums[0]).lowercaseString)", "or", HelperAPI.chooseQuantifiers(sentenceNums[1] as! String)]
            let title = "你喜欢哪一个模型，?或者?？"
            
            return (cnTitle: title, words: words)

        default:
            var num = ""
            for var i = 0; i < 2; i++ {
                if num != "" {
                    numbers.removeObject(num)
                }
                let index = Int(arc4random_uniform(UInt32(numbers.count)))
                num = numbers[index] as! String
                sentenceNums.append(num)
            }
            
            let words = ["Which one do you like model", "\((sentenceNums[0]).lowercaseString)", "or", HelperAPI.chooseQuantifiers(sentenceNums[1] as! String)]
            let title = "你喜欢哪一个模型，?或者?？"
            
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
                print("\(bubble.eleName)")
                let isTrue = bubble.eleName == "\(self.sentenceNums[0])"
                let monitor = self.delegate!.monitoring(isTrue, isOnly: self.sentenceNums.count == 1, show: HelperAPI.converEnToCn(self.sceneType, title: self.sentenceNums[0] as! String))

                if monitor && !isTrue {
                    DataAPI.insertError("\(self.sentenceNums[0])", date: NSDate())
                }

                
                if monitor && isTrue && self.sentenceNums.count > 0 {
                    self.sentenceNums.removeAtIndex(0)
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
