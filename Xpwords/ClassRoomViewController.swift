//
//  ClassRoomViewController.swift
//  Xpwords
//
//  Created by Yanggl on 15/11/13.
//  Copyright © 2015年 Yongl. All rights reserved.
//

import UIKit

class ClassRoomViewController: UIViewController {

    @IBOutlet weak var hScrollView: UIScrollView!

    var sceneType:SceneType = SceneType.Num

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var models = [Word]()
        var rgbs = NSMutableArray(array: COLORS)
        let words = getWords()
        
        var rgb = 100
        for var i = 0; i < words.count; i++ {
            if rgb != 100 {
                rgbs.removeObject(rgb)
                rgbs = (rgbs.count == 0) ? NSMutableArray(array: COLORS) : rgbs
            }
            let index = Int(arc4random_uniform(UInt32(rgbs.count)))
            rgb = rgbs[index] as! Int
            
            let word = Word(word: words[i], title:HelperAPI.converEnToCn(sceneType, title: words[i]), rgb: rgb, image:getImageName(words[i]))
            models.append(word)
        }

        let classRoom1 = NSBundle.mainBundle().loadNibNamed("RoomView", owner: nil, options: nil)[0] as! RoomView
        classRoom1.frame = CGRectMake(0, 0, self.view.frame.width, hScrollView.frame.height)
        classRoom1.roomType = RoomType.wordRoom
        classRoom1.words = models
        classRoom1.title.text = "单词"
        hScrollView.addSubview(classRoom1)
        
        let classRoom2 = NSBundle.mainBundle().loadNibNamed("RoomView", owner: nil, options: nil)[0] as! RoomView
        classRoom2.frame = CGRectMake(self.view.frame.width, 0, self.view.frame.width, hScrollView.frame.height)
        classRoom2.roomType = RoomType.sentenceRoom1
        classRoom2.sentences = getSentence1()
        classRoom2.title.text = "句子（一）"
        hScrollView.addSubview(classRoom2)
        
        let classRoom3 = NSBundle.mainBundle().loadNibNamed("RoomView", owner: nil, options: nil)[0] as! RoomView
        classRoom3.frame = CGRectMake(self.view.frame.width * 2, 0, self.view.frame.width, hScrollView.frame.height)
        classRoom3.roomType = RoomType.sentenceRoom2
        classRoom3.sentences = getSentence2()
        classRoom3.title.text = "句子（二）"
        hScrollView.addSubview(classRoom3)

        hScrollView.contentSize = CGSizeMake(self.view.frame.width * 3, 0.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Landscape
    }

    internal func getImageName(name: String) ->String {
        switch self.sceneType {
        case .Num:
            return name
        case .Animal:
            return ("animal_\(name)").lowercaseString
        case .Fruit:
            return ("fruit_\(name)").lowercaseString
        case .Traffic:
            return ("traffic_\(name)").lowercaseString
        }
    }
    
    internal func getWords() ->[String] {
        switch self.sceneType {
        case .Num:
            return NUMBERS
        case .Animal:
            return ANIMALS
        case .Fruit:
            return FRUITS
        case .Traffic:
            return TRAFFICS
        }
    }
    
    internal func getSentence1() -> [Sentence] {
        switch self.sceneType {
        case .Num:
            return sentence1Num()
        case .Animal:
            return sentence1Animal()
        case .Fruit:
            return sentence1Fruit()
        case .Traffic:
            return sentence1Traffic()
        }
    }
    
    internal func getSentence2() -> [Sentence] {
        switch self.sceneType {
        case .Num:
            return sentence2Num()
        case .Animal:
            return sentence2Animal()
        case .Fruit:
            return sentence2Fruit()
        case .Traffic:
            return sentence2Traffic()
        }
    }

    internal func sentence1Num() -> [Sentence] {
        var s = [Sentence]()
        
        var sentences = ["- Good morning, Liming.", "- Good morning, three years old Lee."]
        var titles = ["早上好，李明。", "早上好，三岁的李。"]
        var sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)
        
        sentences = ["- What is the date today?","- Today is the number one."]
        titles = ["今天是什么日子？", "今天一号。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)

        sentences = ["- I have two pieces of cake. Do you want one?"]
        titles = ["我有两块蛋糕，你是否要一个？"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[0]]])
        s.append(sentence)
        
        sentences = ["- Welcome to China!", "- We have three people, Please follow me, Thank you." ]
        titles = ["欢迎来到中国！","我们有三个人，请跟上我，谢谢。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)

        sentences = ["- How old are you?", "- I am two."]
        titles = ["你多大了？","我两岁。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)

        sentences = ["- It's time for class.", "- Please trun to page one and two." ]
        titles = ["上课了。","请翻到第一页和第二页。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)
        
        sentences = ["- What's wrong with you?", "- I lost three dollars."  ]
        titles = ["你怎么了？","我丢了三块钱。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)

        sentences = ["- Can we come in three?", "- Come in please."]
        titles = ["我们三个能进了吗？","请进。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)

        sentences = ["- They are waiting for you.", "- Let them wait for two minutes."]
        titles = ["他们在等你。","让他们再等两分钟。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)
        
        sentences = ["- Take this medicine three times a day."]
        titles = ["这个药一天吃三次。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[0]]])
        s.append(sentence)

        sentences = ["- Now it's eight o'clock, please go to sleep."]
        titles = ["现在八点了，去睡觉吧。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[0]]])
        s.append(sentence)

        sentences = ["- One bye one please, no pushing. We have four pears."]
        titles = ["一个一个来，不要挤，我们还有四个梨子。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[0]]])
        s.append(sentence)
        
        sentences = ["- And two more, please eat up."]
        titles = ["还剩两个了，吃光它。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[0]]])
        s.append(sentence)

        sentences = ["- There are six minutes, let me try."]
        titles = ["还有六分钟，让我试试。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[0]]])
        s.append(sentence)
        
        sentences = ["- Look carefully, it is one, isn't zero."]
        titles = ["看仔细了，那是一，不是零。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[0]]])
        s.append(sentence)
        
        sentences = ["- Wash your hands three times."]
        titles = ["请洗三次手。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[0]]])
        s.append(sentence)

        sentences = ["- This is my friend, Liming, he is three years old."]
        titles = ["这是我的朋友，李明，他三岁了。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[0]]])
        s.append(sentence)
        
        sentences = ["- Do you have two brithers?", "- No, I have three."]
        titles = ["你又两个兄弟？", "不，我有三个。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)

        sentences = ["- Give me two apples, please."]
        titles = ["请给我两个苹果。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[0]]])
        s.append(sentence)
        
        sentences = ["- What are those on the tree?", "- Three birds, two monkeys."]
        titles = ["树上的那些是什么？", "三只鸟，两只猴子。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)

        sentences = ["- Happy birthday to you! After this day you are three."]
        titles = ["生日快乐！过了今天你就三岁了。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[0]]])
        s.append(sentence)

        sentences = ["- How much money we have?", "- Three left."]
        titles = ["我们还有多少钱？", "剩下三块了。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)

        sentences = ["- Excuse me, may I come in?", "- Wait two minutes."]
        titles = ["打扰了，请问我能进来吗？", "再等两分钟。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)

        sentences = ["- Who can tell me? Is that one or two?"]
        titles = ["谁能告诉我？那是一还是二？"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[0]]])
        s.append(sentence)

        sentences = ["- I need four people, two boys and two girls, who can do it?"]
        titles = ["我需要四个人，两个男孩，两个女孩，谁能做？"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[0]]])
        s.append(sentence)

        sentences = ["- Listen to me, we have to go to school before eight. Now it's seven."]
        titles = ["听我说，我们必须在八点前到学校，现在已经七点了。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[0]]])
        s.append(sentence)

        return s
    }
    
    internal func sentence1Animal() -> [Sentence] {
        var s = [Sentence]()
        
        var sentences = ["- Did you see the animal?", "- A fox?"]
        var titles = ["你看到了什么动物？", "一只狐狸。"]
        var sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)
        
        sentences = ["- What animals in the forest?","- Tiger, deer and rabbit."]
        titles = ["森林里有什么动物？", "老虎，鹿还有兔子。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)
        
        sentences = ["- What animals in the zoo?","- There are many, such as monkey."]
        titles = ["动物园里有什么动物？", "有很多，比如猴子。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)

        sentences = ["- Look, a monkey!","- No, it is gorilla."]
        titles = ["看，一只猴子！", "不，那是一只大猩猩。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)

        sentences = ["- What animals over there?", "- Three monkeys, four donkeys."]
        titles = ["那边是什么动物？", "三只猴子，四只驴。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)

        sentences = ["- The elephant is some times heavier than the sheep."]
        titles = ["大象比兔子重很多倍。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[0]]])
        s.append(sentence)

        sentences = ["- Whose nose is longer?", "- The rabbit's nose is shorter than the elephant."]
        titles = ["谁的鼻子短？", "兔子的鼻子比大象的短。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)

        sentences = ["- My chicken is very fierce.", "- Thit's not true."]
        titles = ["我家的鸡很凶猛？", "那不会是真的。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)

        sentences = ["- Please look at the picture. What's this?", "- A tiger!"]
        titles = ["请看这张图。这是什么？", "一只老虎！"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)

        sentences = ["- Yesterday we have learnt some animal's name.", "- Yes, I know the zebra!"]
        titles = ["昨天我们学了一些动物的名字。", "是的，我了解斑马。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)

        sentences = ["- I will take you to the zoo, do you want to go?", "- Yes, I want to see the panda."]
        titles = ["我将要带你去动物园，你想看什么？", "我想看熊猫。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)

        sentences = ["- What can you see?", "- I can see monkeys, horses, lions and so on."]
        titles = ["你看到了什么？", "我看到了猴子，马，狮子等等。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)

        sentences = ["- Do you like the fox?", "- No, he is sly, I like tigers."]
        titles = ["你喜欢狐狸吗？", "不，他太狡猾了，我喜欢老虎。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)

        sentences = ["- Now, let's read them together. Elephant, elephant.", "- Elephant! Elephant!"]
        titles = ["现在我们读一下这些单词，\"大象\"，\"大象\"。", "\"大象\"！\"大象\"！"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)

        sentences = ["- Look! What's this?", "- It's a chicken."]
        titles = ["看，那是什么？", "那是一只鸡。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)

        sentences = ["- Hello, monkey!", "- Who are you talking to hello?"]
        titles = ["你好，猴子！", "你在跟谁问好？"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)

        sentences = ["- Ok, it's time to say bye-bye to panda, we must to go."]
        titles = ["要跟熊猫说再见了，我们必须走了。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[0]]])
        s.append(sentence)

        sentences = ["- Is there a chicken in the river?", "- No, it is a dog."]
        titles = ["有一只鸡在河里？", "不，那是一只狗。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)

        sentences = ["- Keep guiet! Listen carefully!", "- Oh, a cat is crying! What's the matter?"]
        titles = ["安静！仔细听！", "噢，一只猫在哭！发生了什么事情？"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)

        sentences = ["- Do you want to play with the lovely cat?", "- No, it is really sick!"]
        titles = ["你想跟这只可爱的猫玩吗？", "不，她太弱小了。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)

        sentences = ["- Lion, lion, Where are you?", "- I am here!"]
        titles = ["狮子，狮子，你在哪？", "我在这！"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)

        sentences = ["- I am a horse, nice to meet you!", "- Nice to meet you too."]
        titles = ["我是一匹马，很高兴见多你！", "也很高兴见到你。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)

        sentences = ["- I will catch you!", "- You'll never catch me, stupid donkey!"]
        titles = ["我要抓到你！", "你永远也抓不到我，蠢驴！"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)

        sentences = ["- I can fly!", "- Are you sure, cat?"]
        titles = ["我会飞！", "你确定，小猫？"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)

        sentences = ["- Can the dog swimming?"]
        titles = ["狗会游泳吗？"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[0]]])
        s.append(sentence)
        
        sentences = ["- I am a tiger!", "- No, you are a cat."]
        titles = ["我是一只老虎！", "不，你只是一只小猫咪。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)
        
        return s
    }

    internal func sentence1Fruit() -> [Sentence] {
        var s = [Sentence]()
        
        var sentences = ["- What do you like?","- I like pears."]
        var titles = ["你喜欢什么？", "我喜欢梨。"]
        var sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)
        
        sentences = ["- Wash your hands! It's time to eat.", "- Oh, I like apples."]
        titles = ["洗洗手，我们要开吃了。", "噢，我喜欢吃苹果。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)
        
        sentences = ["- Who likes cherrys? Stand up!"]
        titles = ["谁喜欢吃樱桃？站起来！"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[0]]])
        s.append(sentence)
        sentences = ["- What is this?","- It is an apple."]
        titles = ["这是什么？", "一个苹果。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)
        
        sentences = ["- I like this peach, it's small."]
        titles = ["我喜欢这个桃子，它很小。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[0]]])
        s.append(sentence)
        
        sentences = ["- What are you doing?","- Eatting the pear."]
        titles = ["你在干什么？", "吃梨。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)
        
        sentences = ["- I like pears better than peachs."]
        titles = ["比起桃子我更喜欢梨。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[0]]])
        s.append(sentence)
        
        sentences = ["- Let us play a game, win will get an apple."]
        titles = ["让我玩一个游戏，赢的人将得到一个苹果。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[0]]])
        s.append(sentence)
        
        sentences = ["- Close your eyes, and hold out your hand, touch what is this?", "- A Watermelon."]
        titles = ["闭上眼睛，伸出手，摸摸这是什么？", "一个西瓜。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)
        
        sentences = ["- Pears are sweeter than apples."]
        titles = ["梨比苹果甜。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[0]]])
        s.append(sentence)
        
        sentences = ["- The watermelon is big. Let's eat it."]
        titles = ["这个西瓜很大，让我们吃了它吧。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[0]]])
        s.append(sentence)
        
        sentences = ["- Give me three pineapples."]
        titles = ["给我三个菠萝。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[0]]])
        s.append(sentence)
        
        sentences = ["- Smell the apple. Feel the pear. Taste the peach."]
        titles = ["问一问苹果，摸一摸梨，尝一尝桃子。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[0]]])
        s.append(sentence)
        
        sentences = ["- Hold up an apple."]
        titles = ["拿一个苹果。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[0]]])
        s.append(sentence)
        
        sentences = ["- What fruit do you like?","- Grapes."]
        titles = ["你喜欢哪种水果？", "葡萄。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)
        
        sentences = ["- Let's me say, it's red and round. What's it?", "- It is an apple!"]
        titles = ["听我说，它红红的圆圆的，它是什么呢？", "一个苹果！"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)
        
        sentences = ["- Why do you like pears?", "- Because It's very sweet."]
        titles = ["你为什么喜欢梨？", "因为它很甜。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)
        
        sentences = ["- Do you know what fruit is very sweet?","- Plums?"]
        titles = ["你知道比较甜的水果吗？", "李子？"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)
        
        sentences = ["- Is that an apple?","- No, it is a pear."]
        titles = ["那是一个苹果？", "不，那是一个梨。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)
        
        sentences = ["- Look, a big lemon!","- No, it is a hamimelon."]
        titles = ["看，好大一个柠檬？", "那是一个哈密瓜。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)
        
        sentences = ["- What do you see?","- I can see some apples."]
        titles = ["你看到了什么？", "我看到了很多苹果。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)
        
        sentences = ["- Please tell the names of two kinds of fruit.","- Pear and peach."]
        titles = ["请告诉我两种水果的名字。", "梨和桃。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)
        
        sentences = ["- How beautiful an apple, I like it."]
        titles = ["好漂亮的苹果啊，我喜欢。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[0]]])
        s.append(sentence)
        
        sentences = ["- What are you drawing?","- A pear."]
        titles = ["你在画什么？", "一个梨。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)
        
        sentences = ["- Taste the strawberry, very good."]
        titles = ["尝尝草莓，很好吃。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[0]]])
        s.append(sentence)
        
        sentences = ["- Look at the picture, what can you see?","- An apple."]
        titles = ["请看这幅画，你看到了什么？", "一个苹果。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)
        
        return s
    }

    internal func sentence1Traffic() -> [Sentence] {
        var s = [Sentence]()
        
        var sentences = ["- Let's go by train, OK?","- Yes, of course."]
        var titles = ["让我们坐火车吧，好不好？", "没问题。"]
        var sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)
        
        sentences = ["- What is it?","- It is a ship."]
        titles = ["那是什么？", "一首轮船。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)
        
        sentences = ["- Where is the car going?"]
        titles = ["这辆车要去哪儿？"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[0]]])
        s.append(sentence)
        
        sentences = ["- I will go to Shanghai by bus.","- How about sitting in my car?"]
        titles = ["我要坐巴士去上海。", "乘我的车如何？"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)
        
        sentences = ["- Let's go to the park by bike!"]
        titles = ["让我们骑车去公园吧！"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[0]]])
        s.append(sentence)
        
        sentences = ["- The plane is very big!", "- Yes, it is."]
        titles = ["这架飞机好大！", "是的。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)
        
        sentences = ["- How do you go to school?", "- I go to school by car."]
        titles = ["你怎么去学校的？", "坐轿车。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)
        
        sentences = ["- What do you see?", "- I see a boat."]
        titles = ["你看到了什么？", "一只小船。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)
        
        sentences = ["- The spaceship is great."]
        titles = ["那个宇宙飞船太棒了。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[0]]])
        s.append(sentence)
        
        sentences = ["- Read after me, motorcycle.", "- Motorcycle!"]
        titles = ["跟我读，\"摩托车\"？", "\"摩托车\"！"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)
        
        sentences = ["- The bike is beauful!", "- Yes, it is."]
        titles = ["这辆自行车好漂亮！", "那是。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)
        
        sentences = ["- How are you going to Beijing?", "- By plane."]
        titles = ["你准备怎么去北京？", "坐飞机。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)
        
        sentences = ["- How about we go to Tibet by bike?"]
        titles = ["骑车去西藏怎么样？"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[0]]])
        s.append(sentence)
        
        sentences = ["- We will go to Mars by airship.", "- Really?"]
        titles = ["我们将坐飞艇去火星？", "真的吗？"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)
        
        sentences = ["- It's faster to go plane than train."]
        titles = ["飞机比火车快。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[0]]])
        s.append(sentence)
        
        sentences = ["- What can fly in the sky?", "- Spaceship and balloon."]
        titles = ["什么可以在天空飞？", "宇宙飞船，热气球。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)
        
        sentences = ["- What can swim in the water?", "- Boat and submarine."]
        titles = ["什么可以在水里游？", "船和潜艇。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)
        
        sentences = ["- What can run on the road?", "- Car and bike."]
        titles = ["什么可以在路上行？", "小车，自行车。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)
        
        sentences = ["- What kind of transportation is the fastest?", "- Spaceship."]
        titles = ["最快的交通工具是什么？", "宇宙飞船。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)
        
        sentences = ["- I want to have a car in the future."]
        titles = ["我希望将来有一辆轿车。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[0]]])
        s.append(sentence)
        
        sentences = ["- How are you going?", "- I like to go anywhere by bike."]
        titles = ["准备怎么走？", "我喜欢骑车。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)
        
        sentences = ["- Which train goes to Xi'an?"]
        titles = ["那一班火车去西安？"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[0]]])
        s.append(sentence)
        
        sentences = ["- What's the quickest way to get there?", "- By plane."]
        titles = ["怎么去最快的方式去那里？", "坐飞机。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)
        
        sentences = ["- I'm going by ship. I like ships."]
        titles = ["我将要乘坐轮船，我喜欢轮船。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[0]]])
        s.append(sentence)
        
        sentences = ["- Your bike is so beautiful, I love it.", "- Thanks."]
        titles = ["你的自行车真好看，我好喜欢。", "谢谢夸奖。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[1]]])
        s.append(sentence)
        
        sentences = ["- Just past a train."]
        titles = ["刚刚过去了一辆火车。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[[sentences[0]],[sentences[0]]])
        s.append(sentence)
        
        return s
    }

    internal func sentence2Num() -> [Sentence] {
        var s = [Sentence]()
        
        var sentences = ["I have ten dollars."]
        var titles = ["我有十块钱。"]
        var sentence = Sentence(sentences: sentences, titles: titles, audios:[["I have","ten","dollars"]])
        s.append(sentence)
        
        sentences = ["I am two years old."]
        titles = ["我两岁了。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["I am", "two","years old"]])
        s.append(sentence)
        
        sentences = ["I have three brothers."]
        titles = ["我有两个弟弟。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["I have", "three", "brothers"]])
        s.append(sentence)
        
        sentences = ["I'm in grade three class one."]
        titles = ["我在三年级一班。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["I'm in grade three class", "one"]])
        s.append(sentence)
        
        sentences = ["My grandmother left four teeth."]
        titles = ["我奶奶剩下四颗牙。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["My grandmother left", "four", "teeth"]])
        s.append(sentence)
        
        sentences = ["He has two cars." ]
        titles = ["他有两辆车。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["He has", "two", "cars"]])
        s.append(sentence)
        
        sentences = ["Give me two apples."]
        titles = ["给我两个苹果。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["Give me", "two", "apples"]])
        s.append(sentence)
        
        sentences = ["She lent me five rubbers."]
        titles = ["她借给我五块橡皮。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["She lent me", "five", "rubbers"]])
        s.append(sentence)
        
        sentences = ["There are six watermelons left."]
        titles = ["还有六个西瓜。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["There are", "six", "watermelons left"]])
        s.append(sentence)
        
        sentences = ["The sky over eleven birds."]
        titles = ["天空飞过十一只鸟。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["The sky over", "eleven", "birds"]])
        s.append(sentence)
        
        sentences = ["We have eight people."]
        titles = ["我们有八个人。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["We have", "eight", "people"]])
        s.append(sentence)
        
        sentences = ["Mother bought seven bananas."]
        titles = ["妈妈买了七个香蕉。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["Mother bought", "seven", "bananas"]])
        s.append(sentence)
        
        sentences = ["I have two pigeons."]
        titles = ["我养了两只鸽子。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["I have", "two", "pigeons"]])
        s.append(sentence)
        
        sentences = ["Nine kilometers from my home."]
        titles = ["离我家有九公里。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["nine", "kilometers from my home"]])
        s.append(sentence)
        
        sentences = ["There will be rain tomorrow at six."]
        titles = ["明天六点将会下雨。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["There will be rain tomorrow at", "six"]])
        s.append(sentence)
        
        sentences = ["Twenty days a month?"]
        titles = ["一个月二十天吗？"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["twenty", "days a month"]])
        s.append(sentence)
        
        sentences = ["I lost six dollars."]
        titles = ["我丢了六块钱。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["I lost", "six", "dollars"]])
        s.append(sentence)
        
        sentences = ["Let's wait for him for five minutes."]
        titles = ["让我们等他五分钟。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["Let's wait for him for", "five", "minutes"]])
        s.append(sentence)
        
        sentences = ["Please trun to page one and two."]
        titles = ["翻到第一页和第二页。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["Please trun to page", "one", "and", "two"]])
        s.append(sentence)
        
        sentences = ["There are three boys, and two girls in the class."]
        titles = ["班里有三个男孩，两个女孩。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["There are", "three", "boys", "and", "two", "girls in the class"]])
        s.append(sentence)
        
        sentences = ["There are two lions in the zoo, two monkeys and four tigers."]
        titles = ["动物园里有两只狮子，两只猴子和四只老虎。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["There are", "two", "lions in the zoo", "two", "monkeys and", "four", "tigers"]])
        s.append(sentence)
        
        sentences = ["There are six pencils in the pencil box, two pens."]
        titles = ["铅笔盒里有六支铅笔，两支钢笔。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["There are", "six", "pencils in the pencil box", "two", "pens"]])
        s.append(sentence)
        
        sentences = ["There are three birds on the tree, two monkeys, one cat."]
        titles = ["树上有三只鸟，两只猴子和一只猫。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["There are", "three", "birds on the tree", "two", "monkeys", "one", "cat"]])
        s.append(sentence)
        
        sentences = ["He has three dollars, I have two and you have four."]
        titles = ["他有三块钱，我有两块，你又四块。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["He has", "three", "dollars", "I have", "two", "and you have", "four"]])
        s.append(sentence)
        
        sentences = ["One plus two is three."]
        titles = ["一加二等于三。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["one", "plus", "two", "is", "three"]])
        s.append(sentence)
        
        sentences = ["Two minus two is zero."]
        titles = ["二减二等于零。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["two", "minus", "two", "is", "zero"]])
        s.append(sentence)
        
        sentences = ["One times two is two."]
        titles = ["一乘以二等于二。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["one", "times", "two", "is", "two"]])
        s.append(sentence)

        return s
    }
    
    internal func sentence2Animal() -> [Sentence] {
        var s = [Sentence]()
        
        var sentences = ["The dog is very lovely."]
        var titles = ["这只狗真可爱。"]
        var sentence = Sentence(sentences: sentences, titles: titles, audios:[["the","dog","is very lovely"]])
        s.append(sentence)
        
        sentences = ["I am a tiger."]
        titles = ["我是一只老虎。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["I am", "a tiger"]])
        s.append(sentence)
        
        sentences = ["I have two cats."]
        titles = ["我养了两只猫。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["I have", "two", "cats"]])
        s.append(sentence)
        
        sentences = ["There are four monkeys in the zoo."]
        titles = ["动物园里有四只猴子。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["There are", "four", "monkeys", "in the zoo"]])
        s.append(sentence)
        
        sentences = ["A big gorilla over there."]
        titles = ["那边有一只大猩猩。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["A big", "gorilla", "over there"]])
        s.append(sentence)

        sentences = ["I want to see the panda."]
        titles = ["我想看熊猫。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["I want to see", "the", "panda"]])
        s.append(sentence)

        sentences = ["I can see a fox."]
        titles = ["我看见了一只狐狸。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["I can see", "a fox"]])
        s.append(sentence)

        sentences = ["Do you like the chicken?"]
        titles = ["你喜欢鸡吗？"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["Do you like", "the", "chicken"]])
        s.append(sentence)

        sentences = ["I like elephants."]
        titles = ["我喜欢大象。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["I like", "elephants"]])
        s.append(sentence)

        sentences = ["It's a big monkey."]
        titles = ["他是一只大猴子。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["It's", "A big", "monkey"]])
        s.append(sentence)

        sentences = ["Dog, dog, where are you?"]
        titles = ["狗，你在哪？"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["dog","dog", "where are you"]])
        
        sentences = ["Can the tiger climb a tree?"]
        titles = ["老虎会爬树吗？"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["Can", "the", "tiger", "climb a tree"]])
        s.append(sentence)

        sentences = ["Three monkeys and two pandas over there."]
        titles = ["那边有三只猴子和两只大熊猫。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["three", "monkeys", "and", "two", "pandas", "over there"]])
        s.append(sentence)

        sentences = ["The cat is crying, what's the matter?"]
        titles = ["这只猫在叫，她怎么了？"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["the", "cat", "is  crying, what's the matter"]])
        s.append(sentence)

        sentences = ["What animals do you like? Cat or dog?"]
        titles = ["你喜欢什么动物？猫或者狗？"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["What animals do you like", "cat", "or", "dog"]])
        s.append(sentence)

        sentences = ["My favorite animals is dog."]
        titles = ["我最喜欢的动物是狗。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["My favorite animals is", "dog"]])
        s.append(sentence)

        sentences = ["The tiger is a very fierce animal."]
        titles = ["老虎是非常凶猛的动物。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["the", "tiger", "is a very fierce animal"]])
        s.append(sentence)

        sentences = ["Cats are very friendly to humans."]
        titles = ["猫是非常温和的动物。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["cats", "are very friendly to humans"]])
        s.append(sentence)

        sentences = ["The tiger runs very fast."]
        titles = ["老虎跑起来非常快。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["the", "tiger", "runs very fast"]])
        s.append(sentence)

        sentences = ["Dog is a good friend of mankind."]
        titles = ["狗是人类的好朋友。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["dog", "is a good friend of mankind"]])
        s.append(sentence)

        sentences = ["The old man likes raising rabbits, dogs and horses."]
        titles = ["这个老人喜欢养兔子、狗和马。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["The old man likes raising", "rabbits", "dogs", "and", "horses"]])
        s.append(sentence)

        sentences = ["Her cat came up and rubbed itself against their legs."]
        titles = ["她的猫跑上前来，在他们腿上蹭来蹭去。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["Her", "cat", "came up and rubbed itself against their legs"]])
        s.append(sentence)

        sentences = ["My monkey Xiaomao was the only thing I had."]
        titles = ["我的猴子小毛是我唯一拥有的。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["My", "monkey", "Xiaomao was the only thing I had"]])
        s.append(sentence)

        sentences = ["She fought like a tiger."]
        titles = ["她勇猛地像一头老虎。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["She fought like", "a tiger"]])
        s.append(sentence)

        sentences = ["Which has spots, the leopard or the tiger?"]
        titles = ["有斑点的是豹还是虎？"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["Which has spots", "the", "leopard", "or", "the", "tiger"]])
        s.append(sentence)

        
        return s
    }
    
    internal func sentence2Fruit() -> [Sentence] {
        var s = [Sentence]()
        
        var sentences = ["I like apples."]
        var titles = ["我喜欢苹果。"]
        var sentence = Sentence(sentences: sentences, titles: titles, audios:[["I like","apples"]])
        s.append(sentence)
        
        sentences = ["The apple is very sweet."]
        titles = ["这个苹果很甜。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["the", "apple","is very sweet"]])
        s.append(sentence)
        
        sentences = ["It is a pear."]
        titles = ["那是一个梨。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["It is", "a pear"]])
        s.append(sentence)
        
        sentences = ["The watermelon is so big."]
        titles = ["这个西瓜很大。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["the", "watermelon", "is so big"]])
        s.append(sentence)

        sentences = ["Taste the kiwi, what about it?"]
        titles = ["尝尝这个梨，好吃吗？"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["Taste", "the", "kiwi", "what about it"]])
        s.append(sentence)

        sentences = ["The cherry is red and round."]
        titles = ["这个樱桃很红很圆。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["the", "cherry", "is red and round"]])
        s.append(sentence)

        sentences = ["I have two peaches, and you?"]
        titles = ["我有两个桃子，你呢？"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["I have", "two", "peaches", "and you"]])
        s.append(sentence)

        sentences = ["How lovely an apple, I like it."]
        titles = ["好可爱的苹果，我喜欢。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["How lovely", "an apple", "I like it"]])
        s.append(sentence)

        sentences = ["I'd like to eat apples."]
        titles = ["我想吃苹果。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["I'd like to eat", "apples"]])
        s.append(sentence)

        sentences = ["I like eating apples. But now I like to eat a pear."]
        titles = ["我喜欢吃苹果，但是现在我想吃一个梨。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["I like eating", "apples", "but now I like to eat", "a pear"]])
        s.append(sentence)
        
        sentences = ["Yes,I do. I like apples, grapes and peaches."]
        titles = ["是的, 我喜欢. 我喜欢苹果, 葡萄和芒果。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["Yes,I do", "I like", "apples", "grapes", "and", "peaches"]])
        s.append(sentence)

        sentences = ["I like apple rather than banana."]
        titles = ["我喜欢苹果,而不是香蕉。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["I like", "apple", "rather than", "banana"]])
        s.append(sentence)

        sentences = ["It's an apple. I like apples."]
        titles = ["这是一个苹果. 我喜欢苹果。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["It's","an apple", "I like", "apples"]])
        s.append(sentence)

        sentences = ["I saw a nice red delicious orange."]
        titles = ["我看见了一个漂亮的可口的红橙子。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["I saw a nice red delicious", "orange"]])
        s.append(sentence)
        
        sentences = ["His face is like an apple."]
        titles = ["他的脸像苹果。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["His face is like", "an apple"]])
        s.append(sentence)
        
        sentences = ["There are five bananas on the tree."]
        titles = ["树上有五个香蕉。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["There are", "five", "bananas", "on the tree"]])
        s.append(sentence)
        
        sentences = ["My father bought six pears."]
        titles = ["我爸买了六个梨子。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["My father bought", "six", "pears"]])
        s.append(sentence)

        sentences = ["We have five peaches left."]
        titles = ["我们还剩下五个桃子。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["We have", "five", "peaches", "left"]])
        s.append(sentence)

        sentences = ["There are two apple trees in my yard."]
        titles = ["我院子里有两棵桃树。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["There are", "two", "apple", "trees in my yard"]])
        s.append(sentence)
        
        sentences = ["He pulled a peach from the tree."]
        titles = ["他从树上摘下一只桃。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["He pulled", "a peach", "from the tree"]])
        s.append(sentence)
        
        sentences = ["The following summer the peach tree was laden with fruit."]
        titles = ["第二年夏天桃树就结满了桃子。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["The following summer", "the", "peach", "tree was laden with fruit"]])
        s.append(sentence)
        
        sentences = ["Kiwi fruit are just the thing for a healthy snack."]
        titles = ["猕猴桃正是健康的小点心。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["kiwi", "fruit are just the thing for a healthy snack"]])
        s.append(sentence)
        
        sentences = ["Eating apples is good for your health."]
        titles = ["吃苹果对身体有利。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["Eating", "apples", "is good for your health"]])
        s.append(sentence)
        
        sentences = ["Orange is one of the fruits that I like the most."]
        titles = ["橙子是我最喜欢水果中的一个。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["orange", "is one of the fruits that I like the most"]])
        s.append(sentence)
        
        sentences = ["An apple is a kind of fruit."]
        titles = ["苹果是一种水果。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["an apple", "is a kind of fruit"]])
        s.append(sentence)
        
        sentences = ["My favorite fruit is banana."]
        titles = ["我最喜欢的水果是香蕉。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["My favorite fruit is", "banana"]])
        s.append(sentence)
        
        return s
    }
    
    internal func sentence2Traffic() -> [Sentence] {
        var s = [Sentence]()
        
        var sentences = ["Let's go by bus."]
        var titles = ["我们去坐车吧。"]
        var sentence = Sentence(sentences: sentences, titles: titles, audios:[["Let's go","by bus"]])
        s.append(sentence)
        
        sentences = ["It is a car."]
        titles = ["那是一辆车。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["It is", "a car"]])
        s.append(sentence)
        
        sentences = ["Where is the bike going?"]
        titles = ["这辆自行车要去哪？"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["Where is", "the", "bike", "going"]])
        s.append(sentence)
        
        sentences = ["I will go to Beijing by boat."]
        titles = ["我要坐船去北京。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["I will go to Beijing", "by boat"]])
        s.append(sentence)
        
        sentences = ["I saw a beautiful car."]
        titles = ["我看到了一辆非常漂亮的车。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["I saw a beautiful", "car"]])
        s.append(sentence)
        
        sentences = ["A car is a fast way to go to school."]
        titles = ["坐车是一种去很快的去学校的方式。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["a car", "is a fast way to go to school"]])
        s.append(sentence)
        
        sentences = ["Too many cars on the road would cause traffic jams."]
        titles = ["路上车太多会导致交通堵塞。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["Too many", "cars", "on the road would cause traffic jams"]])
        s.append(sentence)
        
        sentences = ["Ship produces bad gases."]
        titles = ["轮船会生产有害气体。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["ship", "produces bad gases"]])
        s.append(sentence)
        
        sentences = ["Going on foot is the slower than a bus."]
        titles = ["走路去比坐车去慢。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["Going on foot is the slower than", "a bus"]])
        s.append(sentence)
        
        sentences = ["We have to spend a lot money to buy a car."]
        titles = ["我们必须花很多钱去买一辆车。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["We have to spend a lot money to buy", "a car"]])
        s.append(sentence)
        
        sentences = ["The truck produces gases that pollute the air."]
        titles = ["卡车会生产一些气体释放到空气里。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["the", "truck", "produces gases that pollute the air"]])
        s.append(sentence)
        
        sentences = ["Many students can go to school by bus."]
        titles = ["很多学生会坐大巴去学校。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["Many students can go to school", "by bus"]])
        s.append(sentence)
        
        sentences = ["I dont have so much money to afford such a ship."]
        titles = ["我负担不起这艘轮船。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["I dont have so much money to afford such", "a ship"]])
        s.append(sentence)

        sentences = ["Driving a boat is not the same as driving a car."]
        titles = ["驾船和开车不是一回事。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["Driving", "a boat", "is not the same as driving a car"]])
        s.append(sentence)
        
        sentences = ["A boat is something in which people can travel across water."]
        titles = ["船是带人们过河的一种东西。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["a boat", "is something in which people can travel across water"]])
        s.append(sentence)

        sentences = ["A boat is on the water."]
        titles = ["船在水上。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["a boat", "is on the water"]])
        s.append(sentence)
        
        sentences = ["A car is on the road."]
        titles = ["车在路上。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["a car", "is on the road"]])
        s.append(sentence)

        sentences = ["The airship is in the air."]
        titles = ["飞机在天空飞行。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["the", "airship", "is in the air"]])
        s.append(sentence)
        
        sentences = ["Driving a car is really a lot of fun."]
        titles = ["开车很有趣。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["Driving", "a car", "is really a lot of fun"]])
        s.append(sentence)

        sentences = ["Many children like balloons."]
        titles = ["很多孩子喜欢气球。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["Many children like", "balloons"]])
        s.append(sentence)
        
        sentences = ["A bike is far much cheaper than any of the other three means of transportation."]
        titles = ["自行车是远比其他三个更便宜的交通工具。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["a bike", "is far much cheaper than any of the other three means of transportation"]])
        s.append(sentence)

        sentences = ["I will have a car of my own."]
        titles = ["我会有辆自己的汽车。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["I will have", "a car", "of my own"]])
        s.append(sentence)
        
        sentences = ["The taxi is faster and more convient than bus."]
        titles = ["出租车比公共汽车更快和更方便。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["The taxi is faster and more convient than", "bus"]])
        s.append(sentence)

        sentences = ["My car was stolen."]
        titles = ["我的车被偷了。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["My", "car", "was stolen"]])
        s.append(sentence)

        sentences = ["Your car is more beautiful than mine."]
        titles = ["你的车比我的漂亮。"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["Your", "car", "is more beautiful than mine"]])
        s.append(sentence)
        
        sentences = ["Which one do you like model, car, or a spaceship?"]
        titles = ["你喜欢哪一个模型，汽车或者宇宙飞船？"]
        sentence = Sentence(sentences: sentences, titles: titles, audios:[["Which one do you like model", "car", "or", "a spaceship"]])
        s.append(sentence)
        
        return s
    }

    @IBAction func gotHome(sender: AnyObject) {
        HelperAPI.systemSound("sys_buttonClick.m4a")
        self.dismissViewControllerAnimated(true, completion: nil)

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
