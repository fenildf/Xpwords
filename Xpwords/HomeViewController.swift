//
//  HomeViewController.swift
//  Xpwords
//
//  Created by Young on 15/11/8.
//  Copyright © 2015年 Yongl. All rights reserved.
//

import UIKit
import Foundation

class HomeViewController: UIViewController {

    @IBOutlet weak var hScrollView: UIScrollView!
    var intoLv = ""
    
    var pageIndex = 0
    
    //MARK: - Cycle life
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if intoLv == "" {
            return
        }
        if pageIndex == 0 {
            let scene = UserAPI.sharedInstance.sceneNum
            if intoLv == "lv1" && scene.lv2.lock == true && scene.lv1.completed >= 80 {
                UserAPI.sharedInstance.updateScene(SceneType.Num, lvNum: "LV2", lock: "false", reward: (coin: "0", grow: "0", star: "0"))
            }
            if intoLv == "lv2" && scene.lv3.lock == true && scene.lv2.completed >= 80{
                UserAPI.sharedInstance.updateScene(SceneType.Num, lvNum: "LV3", lock: "false", reward: (coin: "0", grow: "0", star: "0"))
            }
            if intoLv == "lv3" && UserAPI.sharedInstance.sceneAnimal.lv1.lock == true && scene.lv3.completed == 100{
                UserAPI.sharedInstance.updateScene(SceneType.Animal, lvNum: "LV1", lock: "false", reward: (coin: "0", grow: "0", star: "0"))
            }
        }else if pageIndex == 1 {
            let scene = UserAPI.sharedInstance.sceneAnimal
            if intoLv == "lv1" && scene.lv2.lock == true && scene.lv1.completed >= 80 {
                UserAPI.sharedInstance.updateScene(SceneType.Animal, lvNum: "LV2", lock: "false", reward: (coin: "0", grow: "0", star: "0"))
            }
            if intoLv == "lv2" && scene.lv3.lock == true && scene.lv2.completed >= 80{
                UserAPI.sharedInstance.updateScene(SceneType.Animal, lvNum: "LV3", lock: "false", reward: (coin: "0", grow: "0", star: "0"))
            }
            if intoLv == "lv3" && UserAPI.sharedInstance.sceneFruit.lv1.lock == true && scene.lv3.completed == 100{
                UserAPI.sharedInstance.updateScene(SceneType.Fruit, lvNum: "LV1", lock: "false", reward: (coin: "0", grow: "0", star: "0"))
            }
        }else if pageIndex == 2 {
            let scene = UserAPI.sharedInstance.sceneFruit
            if intoLv == "lv1" && scene.lv2.lock == true && scene.lv1.completed >= 80 {
                UserAPI.sharedInstance.updateScene(SceneType.Fruit, lvNum: "LV2", lock: "false", reward: (coin: "0", grow: "0", star: "0"))
            }
            if intoLv == "lv2" && scene.lv3.lock == true && scene.lv2.completed >= 80{
                UserAPI.sharedInstance.updateScene(SceneType.Fruit, lvNum: "LV3", lock: "false", reward: (coin: "0", grow: "0", star: "0"))
            }
            if intoLv == "lv3" && UserAPI.sharedInstance.sceneFruit.lv1.lock == true && scene.lv3.completed == 100{
                UserAPI.sharedInstance.updateScene(SceneType.Traffic, lvNum: "LV1", lock: "false", reward: (coin: "0", grow: "0", star: "0"))
            }
        }else if pageIndex == 3 {
            let scene = UserAPI.sharedInstance.sceneTraffic
            if intoLv == "lv1" && scene.lv2.lock == true && scene.lv1.completed >= 80 {
                UserAPI.sharedInstance.updateScene(SceneType.Traffic, lvNum: "LV2", lock: "false", reward: (coin: "0", grow: "0", star: "0"))
            }
            if intoLv == "lv2" && scene.lv3.lock == true && scene.lv2.completed >= 80{
                UserAPI.sharedInstance.updateScene(SceneType.Traffic, lvNum: "LV3", lock: "false", reward: (coin: "0", grow: "0", star: "0"))
            }
        }
        self.loading(pageIndex)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var img = UIImage(named: "home_num")!
        let btnNum = UIButton(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: img.size))
        btnNum.setImage(img, forState: UIControlState.Normal)
        btnNum.setImage(img, forState: UIControlState.Highlighted)
        btnNum.center = CGPoint(x: self.view.center.x, y: 206.0)
        btnNum.addTarget(self, action: Selector("gotClassRoom:"), forControlEvents: UIControlEvents.TouchUpInside)
        hScrollView.addSubview(btnNum)

        img = UIImage(named: "home_animal")!
        let btnAnimal = UIButton(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: img.size))
        btnAnimal.setImage(img, forState: UIControlState.Normal)
        btnAnimal.setImage(img, forState: UIControlState.Highlighted)
        btnAnimal.center = CGPoint(x: 1 * self.view.frame.size.width + self.view.center.x, y: 206.0)
        btnAnimal.addTarget(self, action: Selector("gotClassRoom:"), forControlEvents: UIControlEvents.TouchUpInside)
        hScrollView.addSubview(btnAnimal)

        img = UIImage(named: "home_fruit")!
        let btnFruit = UIButton(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: img.size))
        btnFruit.setImage(img, forState: UIControlState.Normal)
        btnFruit.setImage(img, forState: UIControlState.Highlighted)
        btnFruit.center = CGPoint(x: 2 * self.view.frame.size.width + self.view.center.x, y: 206.0)
        btnFruit.addTarget(self, action: Selector("gotClassRoom:"), forControlEvents: UIControlEvents.TouchUpInside)
        hScrollView.addSubview(btnFruit)

        img = UIImage(named: "home_traffic")!
        let btnTraffic = UIButton(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: img.size))
        btnTraffic.setImage(img, forState: UIControlState.Normal)
        btnTraffic.setImage(img, forState: UIControlState.Highlighted)
        btnTraffic.center = CGPoint(x: 3 * self.view.frame.size.width + self.view.center.x, y: 206.0)
        btnTraffic.addTarget(self, action: Selector("gotClassRoom:"), forControlEvents: UIControlEvents.TouchUpInside)
        hScrollView.addSubview(btnTraffic)

        hScrollView.contentSize = CGSize(width: 4 * self.view.frame.size.width, height: 100.0)
        
        self.view.viewWithTag(11)!.hidden = true
        loading(pageIndex)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Landscape
    }

    //MARK: - Private Methods
    
    func loading(index:Int) {
        switch index {
        case 0:
            var lv = UserAPI.sharedInstance.sceneNum.lv1
            (self.view.viewWithTag(101) as! LevelButton).loading(DifficultyType.easy, lock: lv.lock, completed:lv.completed , starNum: lv.starNum)
            
            lv = UserAPI.sharedInstance.sceneNum.lv2
            (self.view.viewWithTag(102) as! LevelButton).loading(DifficultyType.normal, lock: lv.lock, completed: lv.completed, starNum: lv.starNum)
          
            lv = UserAPI.sharedInstance.sceneNum.lv3
            (self.view.viewWithTag(103) as! LevelButton).loading(DifficultyType.hard, lock: lv.lock, completed: lv.completed, starNum: lv.starNum)
            
        case 1:
            var lv = UserAPI.sharedInstance.sceneAnimal.lv1
            (self.view.viewWithTag(101) as! LevelButton).loading(DifficultyType.easy, lock: lv.lock, completed: lv.completed, starNum: lv.starNum)

            lv = UserAPI.sharedInstance.sceneAnimal.lv2
            (self.view.viewWithTag(102) as! LevelButton).loading(DifficultyType.normal, lock: lv.lock, completed: lv.completed, starNum: lv.starNum)

            lv = UserAPI.sharedInstance.sceneAnimal.lv3
            (self.view.viewWithTag(103) as! LevelButton).loading(DifficultyType.hard, lock: lv.lock, completed: lv.completed, starNum: lv.starNum)

        case 2:
            var lv = UserAPI.sharedInstance.sceneFruit.lv1
            (self.view.viewWithTag(101) as! LevelButton).loading(DifficultyType.easy, lock: lv.lock, completed: lv.completed, starNum: lv.starNum)
            
            lv = UserAPI.sharedInstance.sceneFruit.lv2
            (self.view.viewWithTag(102) as! LevelButton).loading(DifficultyType.normal, lock: lv.lock, completed: lv.completed, starNum: lv.starNum)
            
            lv = UserAPI.sharedInstance.sceneFruit.lv3
            (self.view.viewWithTag(103) as! LevelButton).loading(DifficultyType.hard, lock: lv.lock, completed: lv.completed, starNum: lv.starNum)

        case 3:
            var lv = UserAPI.sharedInstance.sceneTraffic.lv1
            (self.view.viewWithTag(101) as! LevelButton).loading(DifficultyType.easy, lock: lv.lock, completed: lv.completed, starNum: lv.starNum)
            
            lv = UserAPI.sharedInstance.sceneTraffic.lv2
            (self.view.viewWithTag(102) as! LevelButton).loading(DifficultyType.normal, lock: lv.lock, completed: lv.completed, starNum: lv.starNum)

            lv = UserAPI.sharedInstance.sceneTraffic.lv3
            (self.view.viewWithTag(103) as! LevelButton).loading(DifficultyType.hard, lock: lv.lock, completed: lv.completed, starNum: lv.starNum)

        default:
            break
        }
    }
    
    func getSceneType(index:Int) ->SceneType {
        switch index {
        case 0:
            return SceneType.Num
        case 1:
            return SceneType.Animal
        case 2:
            return SceneType.Fruit
        case 3:
            return SceneType.Traffic
        default:
            return SceneType.Num
        }
    }
    
    //MARK: - Touch Methods
    
    @IBAction func gotLeft(sender: AnyObject) {
        HelperAPI.systemSound("sys_buttonClick.m4a")
        self.view.viewWithTag(11)!.hidden = false
        self.view.viewWithTag(12)!.hidden = false

        pageIndex--
        hScrollView.scrollRectToVisible(CGRect(origin: CGPoint(x: CGFloat(pageIndex) * self.view.frame.size.width, y: 18.0), size: hScrollView.frame.size), animated: true)
        
        if pageIndex == 0 {
            self.view.viewWithTag(11)!.hidden = true
        }

        let transition : CATransition = CATransition()
        transition.type = "cube"
        transition.subtype = kCATransitionFromRight
        transition.duration = 0.2
        self.view.viewWithTag(101)!.layer.addAnimation(transition, forKey: nil)
        self.view.viewWithTag(102)!.layer.addAnimation(transition, forKey: nil)
        self.view.viewWithTag(103)!.layer.addAnimation(transition, forKey: nil)
        
        loading(pageIndex)

    }
    
    @IBAction func gotRight(sender: AnyObject) {
        HelperAPI.systemSound("sys_buttonClick.m4a")
        self.view.viewWithTag(11)!.hidden = false
        self.view.viewWithTag(12)!.hidden = false

        pageIndex++
        hScrollView.scrollRectToVisible(CGRect(origin: CGPoint(x: CGFloat(pageIndex) * self.view.frame.size.width, y: 18.0), size: hScrollView.frame.size), animated: true)
        
        if pageIndex == 3 {
            self.view.viewWithTag(12)!.hidden = true
        }

        let transition : CATransition = CATransition()
        transition.type = "cube"
        transition.subtype = kCATransitionFromLeft
        transition.duration = 0.2
        self.view.viewWithTag(101)!.layer.addAnimation(transition, forKey: nil)
        self.view.viewWithTag(102)!.layer.addAnimation(transition, forKey: nil)
        self.view.viewWithTag(103)!.layer.addAnimation(transition, forKey: nil)
        
        loading(pageIndex)
    }
    
    @IBAction func gotLv1(sender: AnyObject) {
        HelperAPI.systemSound("sys_buttonClick.m4a")

        var level = Level()
        if pageIndex == 0 {
            level = UserAPI.sharedInstance.sceneNum.lv1
        }else if pageIndex == 1 {
            level = UserAPI.sharedInstance.sceneAnimal.lv1
        }else if pageIndex == 2 {
            level = UserAPI.sharedInstance.sceneFruit.lv1
        }else if pageIndex == 3 {
            level = UserAPI.sharedInstance.sceneTraffic.lv1
        }
        
        if level.lock == false {
            let level1: Lv1stViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("firstlvVc") as! Lv1stViewController
            level1.modalTransitionStyle = .CrossDissolve
            level1.sceneType = self.getSceneType(pageIndex)
            HelperAPI.currentViewController().presentViewController(level1, animated: true, completion: nil)
            self.intoLv = "lv1"
        }else {
            let alertView = NSBundle.mainBundle().loadNibNamed("UtilAlertView", owner: nil, options: nil)[5] as! UtilAlertView
            if pageIndex == 1 {
                alertView.show("开启需要100金币和一枚六星奖章，是否开启？")
                alertView.goBack = {
                    if UserAPI.sharedInstance.rewardGood == 0 || Int(UserAPI.sharedInstance.coins)! < 100 {
                        let alertView = NSBundle.mainBundle().loadNibNamed("UtilAlertView", owner: nil, options: nil)[0] as! UtilAlertView
                        alertView.show("喔，很抱歉你的金币或奖牌不够了！")
                    }else {
                        UserAPI.sharedInstance.rewardGood--
                        UserAPI.sharedInstance.coins = "\(Int(UserAPI.sharedInstance.coins)! - 100)"
                        UserAPI.sharedInstance.updateUser()
                        UserAPI.sharedInstance.updateScene(SceneType.Animal, lvNum: "LV1", lock: "false", reward: (coin: "0", grow: "0", star: "0"))
                    }
                }
            }else if pageIndex == 2 {
                alertView.show("开启需要100金币和一枚九星奖牌，是否开启？")
                alertView.goBack = {
                    if UserAPI.sharedInstance.rewardExcell == 0 || Int(UserAPI.sharedInstance.coins)! < 100 {
                        let alertView = NSBundle.mainBundle().loadNibNamed("UtilAlertView", owner: nil, options: nil)[0] as! UtilAlertView
                        alertView.show("喔，很抱歉你的金币或奖牌不够了！")
                    }else {
                        UserAPI.sharedInstance.rewardExcell--
                        UserAPI.sharedInstance.coins = "\(Int(UserAPI.sharedInstance.coins)! - 100)"
                        UserAPI.sharedInstance.updateUser()
                        UserAPI.sharedInstance.updateScene(SceneType.Fruit, lvNum: "LV1", lock: "false", reward: (coin: "0", grow: "0", star: "0"))
                    }
                }
            }else if pageIndex == 3 {
                alertView.show("开启需要100金币和一枚至尊奖杯，是否开启？")
                alertView.goBack = {
                    if UserAPI.sharedInstance.rewardBest == 0 || Int(UserAPI.sharedInstance.coins)! < 100 {
                        let alertView = NSBundle.mainBundle().loadNibNamed("UtilAlertView", owner: nil, options: nil)[0] as! UtilAlertView
                        alertView.show("喔，很抱歉你的金币或奖牌不够了！")
                    }else {
                        UserAPI.sharedInstance.rewardBest--
                        UserAPI.sharedInstance.coins = "\(Int(UserAPI.sharedInstance.coins)! - 100)"
                        UserAPI.sharedInstance.updateUser()
                        UserAPI.sharedInstance.updateScene(SceneType.Traffic, lvNum: "LV1", lock: "false", reward: (coin: "0", grow: "0", star: "0"))
                    }
                }
            }
            self.loading(pageIndex)
            
        }
    }
    
    @IBAction func gotLv2(sender: AnyObject) {
        HelperAPI.systemSound("sys_buttonClick.m4a")

        var level = Level()
        if pageIndex == 0 {
            level = UserAPI.sharedInstance.sceneNum.lv2
        }else if pageIndex == 1 {
            level = UserAPI.sharedInstance.sceneAnimal.lv2
        }else if pageIndex == 2 {
            level = UserAPI.sharedInstance.sceneFruit.lv2
        }else if pageIndex == 3 {
            level = UserAPI.sharedInstance.sceneTraffic.lv2
        }
        
        if level.lock == false {
            let level2: Lv2ndViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("secondlvVc") as! Lv2ndViewController
            level2.modalTransitionStyle = .CrossDissolve
            level2.sceneType = self.getSceneType(pageIndex)
            HelperAPI.currentViewController().presentViewController(level2, animated: true, completion: nil)
            self.intoLv = "lv2"
        }else {
            let alertView = NSBundle.mainBundle().loadNibNamed("UtilAlertView", owner: nil, options: nil)[0] as! UtilAlertView
            alertView.show("你的初级关卡完成度还没有到80，继续加油！")
        }

    }
    
    @IBAction func gotLv3(sender: AnyObject) {
        HelperAPI.systemSound("sys_buttonClick.m4a")

        var level = Level()
        if pageIndex == 0 {
            level = UserAPI.sharedInstance.sceneNum.lv3
        }else if pageIndex == 1 {
            level = UserAPI.sharedInstance.sceneAnimal.lv3
        }else if pageIndex == 2 {
            level = UserAPI.sharedInstance.sceneFruit.lv3
        }else if pageIndex == 3 {
            level = UserAPI.sharedInstance.sceneTraffic.lv3
        }
        
        if level.lock == false {
            let level3: Lv3rdViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("thirdlvVc") as! Lv3rdViewController
            level3.modalTransitionStyle = .CrossDissolve
            level3.sceneType = self.getSceneType(pageIndex)
            HelperAPI.currentViewController().presentViewController(level3, animated: true, completion: nil)
            self.intoLv = "lv3"
        }else {
            let alertView = NSBundle.mainBundle().loadNibNamed("UtilAlertView", owner: nil, options: nil)[0] as! UtilAlertView
            alertView.show("你的中级关卡完成度还没有到80，继续加油！")
        }
    }
    
    func gotClassRoom(sender: AnyObject) {
        HelperAPI.systemSound("sys_buttonClick.m4a")

        let alertView = NSBundle.mainBundle().loadNibNamed("UtilAlertView", owner: nil, options: nil)[5] as! UtilAlertView
        alertView.show("进入学堂需要50金币和一枚三星奖章，是否进入？")
        alertView.goBack = {
            if UserAPI.sharedInstance.rewardUsual == 0 || Int(UserAPI.sharedInstance.coins)! < 50 {
                let alertView = NSBundle.mainBundle().loadNibNamed("UtilAlertView", owner: nil, options: nil)[0] as! UtilAlertView
                alertView.show("喔，很抱歉你的金币或奖牌不够了！")
            }else {
                UserAPI.sharedInstance.rewardUsual--
                UserAPI.sharedInstance.coins = "\(Int(UserAPI.sharedInstance.coins)! - 50)"
                UserAPI.sharedInstance.updateUser()
                let classRoomViewController: ClassRoomViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("classRoomVc") as! ClassRoomViewController
                classRoomViewController.modalTransitionStyle = .CrossDissolve
                classRoomViewController.sceneType = self.getSceneType(self.pageIndex)
                self.presentViewController(classRoomViewController, animated: true, completion: nil)
                self.intoLv = ""
            }
        }
        
    }
    
    @IBAction func gotUserSpace(sender: AnyObject) {
        HelperAPI.systemSound("sys_buttonClick.m4a")
        let userViewController: UserSpaceViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("userVc") as! UserSpaceViewController
        userViewController.modalTransitionStyle = .CrossDissolve
        HelperAPI.currentViewController().presentViewController(userViewController, animated: true, completion: nil)
        self.intoLv = ""
    }
    
    @IBAction func gotSetting(sender: AnyObject) {
        HelperAPI.systemSound("sys_buttonClick.m4a")
        let alertView = NSBundle.mainBundle().loadNibNamed("UtilAlertView", owner: nil, options: nil)[3] as! UtilAlertView
        alertView.show()

    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.

    }
    

}
