//
//  StartViewController.swift
//  Xpwords
//
//  Created by Young on 15/11/8.
//  Copyright © 2015年 Yongl. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    //MARK: - Cycle life

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        runRepeat()
        let timer = NSTimer(timeInterval: 1.2, target: self, selector:Selector("runRepeat"), userInfo: nil, repeats: true)
        
        NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSDefaultRunLoopMode)
        
        self.performSelector(Selector("runAnimate"), withObject: self, afterDelay: 0.5)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Landscape
    }
    
    //MARK: - Private Methods
    
    func runRepeat() {
        UIView.animateWithDuration(0.6, animations: {
            self.view.viewWithTag(2)?.transform = CGAffineTransformMakeScale(1.5, 1.5)
            }, completion: { finished in
                UIView.animateWithDuration(0.6, animations: {
                    self.view.viewWithTag(2)?.transform = CGAffineTransformMakeScale(0.8, 0.8)
                })
        })
    }
    
    //Spring 动画
    func runAnimate() {           //播放时长 //间隔多久        //摩擦系数            //初动力
        UIView.animateWithDuration(3, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 10, options: .AllowUserInteraction, animations: {
            
            self.view.viewWithTag(3)?.center.x -= 550 //1024-364 329
            self.view.viewWithTag(4)?.center.x += 621 //130+489
            }, completion: nil)
    }
    
    //MARK: - Touch Methods

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
        HelperAPI.systemSound("sys_buttonClick.m4a")
    }
    

}
