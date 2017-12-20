//
//  Lv3rdViewController.swift
//  Xpwords
//
//  Created by Yanggl on 15/11/10.
//  Copyright © 2015年 Yongl. All rights reserved.
//

import UIKit

class Lv3rdViewController: UIViewController, Lv3rdDelegate {

    var sceneType:SceneType = SceneType.Num
    var lv3Manager: Lv3rdCircle!
    private var levelNum: Int = 1
    private var seconds: Int = 0
    private var timer = NSTimer()
    private var getWords = [String]()
    private var ranges = [NSRange]()
    private var pause = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let (_, level) = HelperAPI.getCurrentScenelv(sceneType, lvName: "LV3")
        (self.view.viewWithTag(114) as! UILabel).text = "完成度：\(level.completed)"
        
        lv3Manager = Lv3rdCircle(radiusValue: 80.0, inView: self.view)
        lv3Manager.animationType = UIAnimationType.One.toOther(Int(arc4random_uniform(UInt32(6))))
        lv3Manager.sceneType = self.sceneType
        lv3Manager.delegate = self
        lv3Manager.showChioce()
        lv3Manager.show(self.view.viewWithTag(100)!)
        
        loading()
        
        timer = NSTimer(timeInterval: 1.0, target: self, selector:Selector("runTime"), userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSDefaultRunLoopMode)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Landscape
    }

    func loading() {
        let button = BubbleButton(frame: CGRectMake(0, 0, 210.0, 210.0), rgb: 0xd8d8d8, audioUrl: lv3Manager.sentenceWords[0])
        button.center = CGPointMake(self.view.center.x, 210.0)
        button.tag = 666
        button.audios = lv3Manager.sentenceWords
        self.view.addSubview(button)
        
        let string = lv3Manager.sentenceTitle as NSString
        for var i = 0; i < string.length; i++ {
            let char = string.substringWithRange(NSRange(location: i, length: 1))
            if char == "?" && i != string.length - 1 {
                ranges.append(NSRange(location: i, length: 1))
            }
        }

        let mutableAttributedStr = NSMutableAttributedString(string: lv3Manager.sentenceTitle)
        for rang in ranges {
            mutableAttributedStr.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor(), range: rang)
            mutableAttributedStr.addAttribute(NSFontAttributeName, value: UIFont(name: "Chalkboard SE", size: 98.0)!, range: rang)
        }
        (self.view.viewWithTag(100) as! UILabel).attributedText = mutableAttributedStr
    }
    
    func onceAgain() {
        levelNum++
        lv3Manager.animationType = UIAnimationType.One.toOther(Int(arc4random_uniform(UInt32(6))))
        lv3Manager.showChioce()
        lv3Manager.show(self.view.viewWithTag(100)!)
        
        getWords.removeAll()
        ranges.removeAll()
        loading()
    }
    
    func runTime() {
        seconds++
        print("\(seconds)")
    }
    
    func rewardSystem() -> (coin:String, grow:String, star:String) {
        var reward:(coin:String, grow:String, star:String)!
        if ( self.view.viewWithTag(111)?.hidden == true || self.view.viewWithTag(112)?.hidden == true || self.view.viewWithTag(113)?.hidden == true ) {
            HelperAPI.systemSound("sys_pausebuttonclick.m4a")
            UserAPI.sharedInstance.rewardFinished = 0
            reward = (coin: "0", grow: "-10", star: "0")
        }else {
            HelperAPI.systemSound("sys_great.m4a")
            
            if seconds <= 50 {
                UserAPI.sharedInstance.rewardFinished++
                reward = (coin: "30", grow: "20", star: "3")
            }else {
                UserAPI.sharedInstance.rewardFinished = 0
                if seconds > 50 && seconds <= 55 {
                    reward = (coin: "20", grow: "10", star: "2")
                }else if seconds > 55 && seconds <= 65 {
                    reward = (coin: "10", grow: "0", star: "1")
                }else {
                    reward = (coin: "0", grow: "0", star: "0")
                }
            }
        }
        
        UserAPI.sharedInstance.updateScene(self.sceneType, lvNum: "LV3", lock: "false", reward: reward)
        if UserAPI.sharedInstance.rewardFinished > 0 {
            if UserAPI.sharedInstance.rewardFinished == 1 {
                UserAPI.sharedInstance.rewardUsual++
            }else if UserAPI.sharedInstance.rewardFinished == 2 {
                UserAPI.sharedInstance.rewardGood++
            }else if UserAPI.sharedInstance.rewardFinished >= 3 && UserAPI.sharedInstance.rewardFinished < 5 {
                UserAPI.sharedInstance.rewardExcell++
            }else if UserAPI.sharedInstance.rewardFinished >= 5 {
                UserAPI.sharedInstance.rewardBest++
            }
            
            UserAPI.sharedInstance.updateUser()
        }

        return reward
    }
    
    func showReward() {
        if UserAPI.sharedInstance.rewardFinished > 0 {
            HelperAPI.systemSound("sys_wow.m4a")
            var reward = ""
            
            if UserAPI.sharedInstance.rewardFinished == 1 {
                reward = "reward_usual"
            }else if UserAPI.sharedInstance.rewardFinished == 2 {
                reward = "reward_good"
            }else if UserAPI.sharedInstance.rewardFinished >= 3 && UserAPI.sharedInstance.rewardFinished < 5 {
                reward = "reward_excellent"
            }else if UserAPI.sharedInstance.rewardFinished >= 5 {
                reward = "reward_best"
            }
            
            let rewardView = NSBundle.mainBundle().loadNibNamed("UtilAlertView", owner: nil, options: nil)[4] as! UtilAlertView
            rewardView.show(reward)
        }
    }
    
    // MARK: SeeSentence Delegate
    
    func monitoring(isMonitor: Bool, isOnly: Bool, show: String) -> Bool {
        if self.pause {
            return false
        }

        if isMonitor {
            if levelNum == 8 && isOnly {
                timer.fireDate = NSDate.distantFuture()
                let reward = self.rewardSystem()
                
                let alertView = NSBundle.mainBundle().loadNibNamed("UtilAlertView", owner: nil, options: nil)[1] as! UtilAlertView
                alertView.show("\(seconds)s", coin: reward.coin, grow: reward.grow, stars: reward.star)
                alertView.goBack = {
                    self.back()
                }
                alertView.goAgain = {
                    self.levelNum = 0
                    self.view.viewWithTag(111)?.hidden = false
                    self.view.viewWithTag(112)?.hidden = false
                    self.view.viewWithTag(113)?.hidden = false
                    let (_, level) = HelperAPI.getCurrentScenelv(self.sceneType, lvName: "LV3")
                    (self.view.viewWithTag(114) as! UILabel).text = "完成度：\(level.completed)"
                    
                    self.lv3Manager.removeAll()
                    
                    self.seconds = 0
                    self.timer.fireDate = NSDate()
                    self.onceAgain()
                }
                
                self.performSelector(Selector("showReward"), withObject: self, afterDelay: 1.0)
            }else {
                if isOnly {
                    lv3Manager.hide()
                    self.performSelector(Selector("onceAgain"), withObject: nil, afterDelay: 1.5)
                }
                
                var string = lv3Manager.sentenceTitle as NSString
                string = string.stringByReplacingCharactersInRange(ranges[0], withString: show)
                
                ranges.removeAll()
                for var i = 0; i < string.length; i++ {
                    let char = string.substringWithRange(NSRange(location: i, length: 1))
                    if char == "?" && i != string.length - 1 {
                        ranges.append(NSRange(location: i, length: 1))
                    }
                }
                
                getWords.append(show)
                for word in getWords {
                    let range = string.rangeOfString(word)
                    ranges.append(range)
                }
                
                lv3Manager.sentenceTitle = string as String
                let mutableAttributedStr = NSMutableAttributedString(string: lv3Manager.sentenceTitle)
                for range in ranges {
                    mutableAttributedStr.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor(), range: range)
                    mutableAttributedStr.addAttribute(NSFontAttributeName, value: UIFont(name: "Chalkboard SE", size: 98.0)!, range: range)
                }
                (self.view.viewWithTag(100) as! UILabel).attributedText = mutableAttributedStr

            }
        }else {            
            if self.view.viewWithTag(111)?.hidden == true {
                HelperAPI.systemSound("sys_failure.mp3")
                let alertView = NSBundle.mainBundle().loadNibNamed("UtilAlertView", owner: nil, options: nil)[0] as! UtilAlertView
                alertView.show("喔，太遗憾了。\n下次努力吧！")
                alertView.goBack = {
                    self.back()
                    UserAPI.sharedInstance.updateScene(self.sceneType, lvNum: "LV3", lock: "false", reward: (coin: "-10", grow: "-10", star: "0"))
                }
            }else if self.view.viewWithTag(112)?.hidden == true {
                self.view.viewWithTag(111)?.hidden = true
            }else if self.view.viewWithTag(113)?.hidden == true {
                self.view.viewWithTag(112)?.hidden = true
            }else {
                self.view.viewWithTag(113)?.hidden = true
            }
        }
        
        return true
    }
    
    func back() {
        self.lv3Manager.removeAll()
        self.timer.invalidate()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //MARK: - Touch Methods
    
    @IBAction func goHome(sender: AnyObject) {
        let button = sender as! UIButton
        button.selected = !button.selected
        self.pause = button.selected
        
        if button.selected {
            self.timer.fireDate = NSDate.distantFuture()
        }else {
            self.timer.fireDate = NSDate()
        }
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
