//
//  LvFirstViewController.swift
//  Xpwords
//
//  Created by Yanggl on 15/11/9.
//  Copyright © 2015年 Yongl. All rights reserved.
//

import UIKit

class Lv1stViewController: UIViewController, Lv1stDelegate {

    var sceneType:SceneType = SceneType.Num
    var circleManager: Lv1stCircle!
    private var levelNum: Int = 1
    private var seconds: Int = 0
    private var timer = NSTimer()
    private var pause = false

    //MARK: - Cycle life
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let (_, level) = HelperAPI.getCurrentScenelv(sceneType, lvName: "LV1")
        (self.view.viewWithTag(114) as! UILabel).text = "完成度：\(level.completed)"
        
        circleManager = Lv1stCircle(radiusValue: 80.0, inView: self.view)
        circleManager.delegate = self
        circleManager.sceneType = self.sceneType
        circleManager.animationType = UIAnimationType.One.toOther(Int(arc4random_uniform(UInt32(6))))
        circleManager.show(self.view)
        
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
    
    //MARK: Private Methods
    
    func getCircleType(levelNum: Int) -> CircleType {
        switch levelNum {
        case 1, 2, 3, 4 :
            return CircleType.Pic
        case 5, 6:
            return CircleType.Audio
        case 7, 8:
            return CircleType.PicAudio
        default:
            return CircleType.PicAudio
        }
    }
    
    func onceAgain() {
        levelNum++
        circleManager.animationType = UIAnimationType.One.toOther(Int(arc4random_uniform(UInt32(6))))
        circleManager.circleType = getCircleType(levelNum)
        circleManager.show(self.view)
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

            if seconds <= 35 {
                UserAPI.sharedInstance.rewardFinished++
                reward = (coin: "30", grow: "20", star: "3")
            }else {
                UserAPI.sharedInstance.rewardFinished = 0
                if seconds > 35 && seconds <= 40 {
                    reward = (coin: "20", grow: "10", star: "2")
                }else if seconds > 40 && seconds <= 50 {
                    reward = (coin: "10", grow: "0", star: "1")
                }else {
                    reward = (coin: "0", grow: "0", star: "0")
                }
            }
        }
        
        UserAPI.sharedInstance.updateScene(self.sceneType, lvNum: "LV1", lock: "false", reward: reward)
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
    
    // MARK: CircleBubbles Delegate
    
    func monitoring(isMonitor: Bool) -> Bool {
        if self.pause {
            return false
        }
        if isMonitor {
            if levelNum == 8 {
                timer.fireDate = NSDate.distantFuture()
                let reward = rewardSystem()

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
                    let (_, level) = HelperAPI.getCurrentScenelv(self.sceneType, lvName: "LV1")
                    (self.view.viewWithTag(114) as! UILabel).text = "完成度：\(level.completed)"
                    
                    self.circleManager.removeAll()
                    
                    self.seconds = 0
                    self.timer.fireDate = NSDate()
                    self.onceAgain()
                }
                
                self.performSelector(Selector("showReward"), withObject: self, afterDelay: 1.0)
            }else {
                circleManager.hide()
                self.performSelector(Selector("onceAgain"), withObject: nil, afterDelay: 1.5)
            }
        }else {            
            if self.view.viewWithTag(111)?.hidden == true {
                HelperAPI.systemSound("sys_failure.mp3")
                let alertView = NSBundle.mainBundle().loadNibNamed("UtilAlertView", owner: nil, options: nil)[0] as! UtilAlertView
                alertView.show("喔，太遗憾了。\n下次努力吧！")
                alertView.goBack = {
                    self.back()
                    UserAPI.sharedInstance.updateScene(self.sceneType, lvNum: "LV1", lock: "false", reward: (coin: "-10", grow: "-10", star: "0"))
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
        self.circleManager.removeAll()
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
