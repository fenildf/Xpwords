//
//  UtilAlertView.swift
//  Xwords
//
//  Created by Young on 15/11/1.
//  Copyright © 2015年 yangl. All rights reserved.
//

import UIKit

typealias goHomeBlock = () -> Void
typealias goAgainBlock = () -> Void

class UtilAlertView: UIView {

    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var alertBgView: UIImageView!
    @IBOutlet weak var alertMsg: UILabel!
        
    var goBack = goHomeBlock?()
    var goAgain = goAgainBlock?()
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if ((touches as NSSet).anyObject()?.view == self.viewWithTag(999)) {//修改头像是点击背景隐藏
            hide()
        }
        
    }
    
    func show(msg:String) {
        let window = UIApplication.sharedApplication().keyWindow!
        window.backgroundColor = UIColor.blackColor()
        window.addSubview(self)
        self.frame = window.bounds
        self.alpha = 0
        
        if alertView.viewWithTag(256) != nil {
            (alertView.viewWithTag(256) as! UIImageView).image = UIImage(named: msg)
            
            self.performSelector(Selector("hide"), withObject: self, afterDelay: 3.0)
        }else {
            alertMsg.text = msg
        }

        UIView.animateWithDuration(0.2, delay: 0.0, options: [], animations: {
            self.alpha = 1
            self.alertView.transform = CGAffineTransformMakeScale(1.2, 1.2)
            
            }, completion: { finished in
                UIView.animateWithDuration(0.12, animations: {
                    self.alertView.transform = CGAffineTransformMakeScale(1.0, 1.0)
                })
        })
        
    }
    
    func show(interval:String, coin:String, grow:String, stars:String) {
        let window = UIApplication.sharedApplication().keyWindow!
        window.backgroundColor = UIColor.blackColor()
        window.addSubview(self)
        self.frame = window.bounds
        self.alpha = 0

        (self.viewWithTag(1) as! UILabel).text = interval
        (self.viewWithTag(2) as! UILabel).text = coin
        (self.viewWithTag(3) as! UILabel).text = grow
        
        switch Int(stars)! {
        case 0:
            self.viewWithTag(4)!.hidden = true
            self.viewWithTag(5)!.hidden = true
            self.viewWithTag(6)!.hidden = true
        case 1:
            self.viewWithTag(5)!.hidden = true
            self.viewWithTag(6)!.hidden = true
        case 2:
            self.viewWithTag(6)!.hidden = true
        default:
            break
        }
        
        UIView.animateWithDuration(0.2, delay: 0.0, options: [], animations: {
            self.alpha = 1
            self.alertView.transform = CGAffineTransformMakeScale(1.2, 1.2)
            
            }, completion: { finished in
                UIView.animateWithDuration(0.12, animations: {
                    self.alertView.transform = CGAffineTransformMakeScale(1.0, 1.0)
                    
                })
        })
    }
    
    func show(title:String, btnLeft:String, btnRight:String) {
        let window = UIApplication.sharedApplication().keyWindow!
        window.backgroundColor = UIColor.blackColor()
        window.addSubview(self)
        self.frame = window.bounds
        
        self.alpha = 0
        (alertView.viewWithTag(500) as! UILabel).text = title
        (alertView.viewWithTag(501) as! UIButton).setTitle(btnLeft, forState: UIControlState.Normal)
        (alertView.viewWithTag(502) as! UIButton).setTitle(btnRight, forState: UIControlState.Normal)
        
        UIView.animateWithDuration(0.2, delay: 0.0, options: [], animations: {
            self.alpha = 1
            self.alertView.transform = CGAffineTransformMakeScale(1.2, 1.2)
            
            }, completion: { finished in
                UIView.animateWithDuration(0.12, animations: {
                    self.alertView.transform = CGAffineTransformMakeScale(1.0, 1.0)
                })
        })
    }
    
    func show() {
        let window = UIApplication.sharedApplication().keyWindow!
        window.backgroundColor = UIColor.blackColor()
        window.addSubview(self)
        self.frame = window.bounds
        self.alpha = 0
        
        (alertView.viewWithTag(600)!.viewWithTag(621) as! UILabel).text = UserAPI.sharedInstance.graphicState
        (alertView.viewWithTag(600)!.viewWithTag(622) as! UILabel).text = UserAPI.sharedInstance.chooseState
        (alertView.viewWithTag(600)!.viewWithTag(623) as! UILabel).text = UserAPI.sharedInstance.audioState

        UIView.animateWithDuration(0.2, delay: 0.0, options: [], animations: {
            self.alpha = 1
            self.alertView.transform = CGAffineTransformMakeScale(1.2, 1.2)
            
            }, completion: { finished in
                UIView.animateWithDuration(0.12, animations: {
                    self.alertView.transform = CGAffineTransformMakeScale(1.0, 1.0)
                })
        })
    }
    
    
    func hide() {
        if alertView.viewWithTag(600) != nil {
            if (UserAPI.sharedInstance.graphicState != (alertView.viewWithTag(600)?.viewWithTag(621) as! UILabel).text ||
                UserAPI.sharedInstance.chooseState != (alertView.viewWithTag(600)?.viewWithTag(622) as! UILabel).text ||
                UserAPI.sharedInstance.audioState != (alertView.viewWithTag(600)?.viewWithTag(623) as! UILabel).text ) {
                    UserAPI.sharedInstance.graphicState = (alertView.viewWithTag(600)?.viewWithTag(621) as! UILabel).text!
                    UserAPI.sharedInstance.chooseState = (alertView.viewWithTag(600)?.viewWithTag(622) as! UILabel).text!
                    UserAPI.sharedInstance.audioState = (alertView.viewWithTag(600)?.viewWithTag(623) as! UILabel).text!
                    
                    UserAPI.sharedInstance.updateUser()
            }
        }
        
        let window = UIApplication.sharedApplication().keyWindow!
        
        dispatch_async(dispatch_get_main_queue(), {
            UIView.animateWithDuration(0.2, animations: {
                self.alertView.frame.origin.y = window.center.y + 400
                self.alpha = 0
                }, completion: { finished in
                    self.removeFromSuperview()
            })
        })
    }
    
    //MARK: Touch Methods
    
    @IBAction func goHide(sender: AnyObject) {
        HelperAPI.systemSound("sys_buttonClick.m4a")
        hide()
        self.goBack?()
    }
    
    @IBAction func goBack(sender: AnyObject) {
        HelperAPI.systemSound("sys_buttonClick.m4a")
        hide()
        self.goBack!()
    }
    
    @IBAction func goAgain(sender: AnyObject) {
        HelperAPI.systemSound("sys_buttonClick.m4a")
        hide()
        self.goAgain?()
    }
    
    //MARK: - 修改头像
    
    @IBAction func showCamera(sender: AnyObject) {
        HelperAPI.systemSound("sys_buttonClick.m4a")
        hide()
        self.goBack!()
    }
    
    @IBAction func showLibrary(sender: AnyObject) {
        HelperAPI.systemSound("sys_buttonClick.m4a")
        hide()
        self.goAgain!()
    }
    
    
    //MARK: - 设置
    
    @IBAction func showSetting(sender: AnyObject) {
        HelperAPI.systemSound("sys_buttonClick.m4a")
        let button = sender as! UIButton
        
        (alertView.viewWithTag(601) as! UIButton).selected = false
        (alertView.viewWithTag(602) as! UIButton).selected = false
        button.selected = true
        
        if button.tag == 601 {
            alertView.viewWithTag(600)!.hidden = true
        }else {
            alertView.viewWithTag(600)!.hidden = false
        }
    }
    
    @IBAction func showModel(sender: AnyObject) {
        HelperAPI.systemSound("sys_buttonClick.m4a")
        let button = sender as! UIButton

        let showView = NSBundle.mainBundle().loadNibNamed("UtilAlertView", owner: nil, options: nil)[2] as! UtilAlertView
        let superView = alertView.viewWithTag(600)!
        
        if button.tag == 611 {
            showView.show("背景图形", btnLeft: "圆形", btnRight: "六边形")
            showView.goBack = {
                (superView.viewWithTag(621) as! UILabel).text = "圆形"
            }
            showView.goAgain = {
                (superView.viewWithTag(621) as! UILabel).text = "六边形"
            }
        }else if button.tag == 612{
            showView.show("选择动画", btnLeft: "移动", btnRight: "点击")
            showView.goBack = {
                (superView.viewWithTag(622) as! UILabel).text = "移动"
            }
            showView.goAgain = {
                (superView.viewWithTag(622) as! UILabel).text = "点击"
            }
        }else {
            showView.show("音乐", btnLeft: "开启", btnRight: "关闭")
            showView.goBack = {
                (superView.viewWithTag(623) as! UILabel).text = "开启"
            }
            showView.goAgain = {
                (superView.viewWithTag(623) as! UILabel).text = "关闭"
            }
        }
    }
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
