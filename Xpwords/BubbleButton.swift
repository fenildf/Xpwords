//
//  BubbleButton.swift
//  Xpwords
//
//  Created by Yanggl on 15/11/9.
//  Copyright © 2015年 Yongl. All rights reserved.
//

import UIKit
import AVFoundation

enum GraphicState: String {
    case Circle = "圆形"                      //圆形
    case Hexagon = "六边形"                   //六边形
}

enum ChooseState: String {
    case Click = "点击"                      //点击触发
    case Move = "移动"                       //移动触发
}

enum AudioState: String {
    case OFF = "关闭"                      //点击触发
    case ON = "开启"                       //移动触发
}


//typealias detectBlock = (bubble: BubbleButton, detectBubble: BubbleButton) -> Void
typealias clickBlock = (bubble: BubbleButton) -> Void

class BubbleButton: UIButton, AVAudioPlayerDelegate {

    var startPoint:CGPoint = CGPoint()     //元素起始点
    var nextCenter:CGPoint = CGPoint()     //扩散到最终位置
    
    var eleName:String = ""
    var radius:CGFloat = 0.0
    var contactView = UIView()
    var clkBlock = clickBlock?()
    
    var audios = [String]()
    private var audiosIndex: Int = 1
    
    private var nextPoint : CGPoint!
    private var audioPlayer = AVAudioPlayer()
    private var audioAnimate: UIImageView!
    
    //MARK: Init Methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //第一种情况，显示图片：在数字的时候显示的是阿拉伯数字，其他显示图片
    
    init(frame: CGRect, rgb: Int, title: String, icon: UIImage?) {
        super.init(frame: frame)
        self.eleName = title
        self.radius = frame.width / 2
        self.startPoint = self.center
        
        self.chooseGraphics(rgb)
        
        if icon != nil {
            let iconView = UIImageView(image: icon)
            iconView.contentMode = UIViewContentMode.ScaleAspectFit
            iconView.tag = 688
            iconView.frame = self.frame
            
            self.addSubview(iconView)
        }else {
            self.setTitle(HelperAPI.converEnToNum(title), forState: UIControlState.Normal)
            self.titleLabel!.adjustsFontSizeToFitWidth = true
            self.titleLabel!.minimumScaleFactor = 40
            self.titleLabel!.font = UIFont(name: "Chalkboard SE", size: 127.0)
        }
        
        let pressEvent = UILongPressGestureRecognizer(target: self, action: Selector("pressEvent:"))
        pressEvent.minimumPressDuration = 0.01
        self.addGestureRecognizer(pressEvent)
    }
    
    //第二种情况，显示单词和声音，第一关用到

    init(frame: CGRect, rgb: Int, title: String) {
        super.init(frame: frame)
        self.eleName = title
        self.radius = frame.width / 2
        self.startPoint = self.center
        
        self.chooseGraphics(rgb)
        
        self.setTitle(title, forState: UIControlState.Normal)
        self.titleLabel!.font = convertToFont(title)
        self.titleLabel!.adjustsFontSizeToFitWidth = true
    
        let coinSound = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("MP3/\(title.lowercaseString)", ofType: "mp3")!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOfURL: coinSound)
            audioPlayer.play()
        } catch let error as NSError {
            print("Could not create audio player: \(error)")
        }
        
        let pressEvent = UILongPressGestureRecognizer(target: self, action: Selector("pressEvent:"))
        pressEvent.minimumPressDuration = 0.01
        self.addGestureRecognizer(pressEvent)
    }

//        for char in title.utf8 {
//            if (char > 64 && char < 91) || (char > 96 && char < 123) {//含字母
    
    //第三种情况，只可以播声音

    init(frame: CGRect, rgb: Int, audioUrl: String) {
        super.init(frame: frame)
        self.radius = frame.width / 2
        self.startPoint = self.center
        
        self.chooseGraphics(rgb)
        
        let imgName = (UserAPI.sharedInstance.graphicState == "六边形") ? "audio_h" : "audio"
        
        let iconView = UIImageView(image: UIImage(named: "\(imgName)_3"))
        iconView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height)
        self.addSubview(iconView)
        
        audioAnimate = UIImageView(frame: iconView.frame)
        audioAnimate.animationImages = [UIImage(named: "\(imgName)_1")!, UIImage(named: "\(imgName)_2")!, UIImage(named: "\(imgName)_3")!]
        audioAnimate.animationDuration = 0.6
        audioAnimate.animationRepeatCount = 2
        audioAnimate.startAnimating()
        self.addSubview(audioAnimate)
        
        let coinSound = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("MP3/\(audioUrl)", ofType: "mp3")!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOfURL: coinSound)
            audioPlayer.delegate = self
            audioPlayer.play()
        } catch let error as NSError {
            print("Could not create audio player: \(error)")
        }
        
        let pressEvent = UILongPressGestureRecognizer(target: self, action: Selector("pressEventAudio:"))
        pressEvent.minimumPressDuration = 0.01
        self.addGestureRecognizer(pressEvent)
    }
    
    //第四种情况，单词卡片
    
    init(frame: CGRect, rgb: Int, title: String, image: UIImage?) {
        super.init(frame: frame)
        self.eleName = title
        self.radius = frame.width / 2
        self.startPoint = self.center
        
        self.chooseGraphics(rgb)
        
        if image != nil {
            let iconView = UIImageView(image: image)
            iconView.contentMode = UIViewContentMode.ScaleAspectFit
            iconView.frame = CGRectMake(0, 0, frame.width, frame.height)
            
            self.addSubview(iconView)
        }else {
            self.setTitle(HelperAPI.converEnToNum(title), forState: UIControlState.Normal)
            self.titleLabel!.adjustsFontSizeToFitWidth = true
            self.titleLabel!.minimumScaleFactor = 40
            self.titleLabel!.font = UIFont(name: "Chalkboard SE", size: 127.0)
        }
        
        let coinSound = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("MP3/\(title.lowercaseString)", ofType: "mp3")!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOfURL: coinSound)
        } catch let error as NSError {
            print("Could not create audio player: \(error)")
        }

        let pressEvent = UILongPressGestureRecognizer(target: self, action: Selector("pressEvent:"))
        pressEvent.minimumPressDuration = 0.01
        self.addGestureRecognizer(pressEvent)
    }

    //MARK: GestureRecognizer Methods
    
    func pressEvent(gesture: UIGestureRecognizer) {
        if UserAPI.sharedInstance.chooseState == "点击" {
            switch gesture.state {
            case .Began:
                UIView.animateWithDuration(0.2, animations: {
                    self.transform = CGAffineTransformMakeScale(1.2, 1.2)
                })
                
                if self.tag == 666 {
                    self.audioPlayer.play()
                }
            case .Changed:
                break
            case .Ended:
                UIView.animateWithDuration(0.2, animations: {
                    self.transform = CGAffineTransformMakeScale(1.0, 1.0)
                    }, completion: { finished in
                })
                
                if self.tag != 666 {
                    self.clkBlock?(bubble: self)
                }
            case .Cancelled, .Failed, .Possible:
                break
            }

        }else {
            let point = gesture.locationInView(self.superview)
            
            switch gesture.state {
            case .Began:
                nextPoint = point
                UIView.animateWithDuration(0.2, animations: {
                    self.transform = CGAffineTransformMakeScale(1.2, 1.2)
                })
                
                if self.tag == 666 {
                    self.audioPlayer.play()
                }
            case .Changed:
                if self.tag != 666 {
                    let offx = point.x - nextPoint.x
                    let offy = point.y - nextPoint.y
                    self.center = CGPoint(x: self.center.x + offx, y: self.center.y + offy)
                    
                    nextPoint = point
                }
                break
            case .Ended:
                UIView.animateWithDuration(0.2, animations: {
                    if self.tag != 666 {
                        self.center = self.nextCenter
                    }
                    self.transform = CGAffineTransformMakeScale(1.0, 1.0)
                    }, completion: { finished in
                        var xDist: CGFloat = 0
                        var yDist: CGFloat = 0
                        var distance: CGFloat = 0.0

                        if self.nextPoint.x >= self.contactView.frame.minX && self.nextPoint.x <= self.contactView.frame.maxX {
                            xDist = (self.nextPoint.x - self.nextPoint.x)
                            yDist = (self.contactView.frame.midY - self.nextPoint.y)
                            distance = sqrt((xDist * xDist) + (yDist * yDist))
                            
                            if distance <= self.radius + self.contactView.frame.height / 2{
                                self.clkBlock?(bubble: self)
                            }
                            return
                        }else if (self.nextPoint.x > self.contactView.frame.maxX && self.nextPoint.x <= self.contactView.frame.maxX + self.radius) {    //最右
                            if self.nextPoint.y > self.contactView.frame.maxY { //位于下方
                                xDist = (self.contactView.frame.maxX - self.nextPoint.x)
                                yDist = (self.contactView.frame.maxY - self.nextPoint.y)
                            }else if self.nextPoint.y <= self.contactView.frame.maxY && self.nextPoint.y >= self.contactView.frame.minY {
                                xDist = (self.contactView.frame.maxX - self.nextPoint.x)
                                yDist = (self.nextPoint.y - self.nextPoint.y)
                            }else { //位于上方
                                xDist = (self.contactView.frame.maxX - self.nextPoint.x)
                                yDist = (self.contactView.frame.minY - self.nextPoint.y)
                            }
                            distance = sqrt((xDist * xDist) + (yDist * yDist))
                            
                        }else if (self.nextPoint.x >= self.contactView.frame.minX - self.radius  && self.nextPoint.x < self.contactView.frame.minX){        //最左
                            if self.nextPoint.y > self.contactView.frame.maxY {
                                xDist = (self.contactView.frame.minX - self.nextPoint.x)
                                yDist = (self.contactView.frame.maxY - self.nextPoint.y)
                            }else if self.nextPoint.y <= self.contactView.frame.maxY && self.nextPoint.y >= self.contactView.frame.minY {
                                xDist = (self.contactView.frame.minX - self.nextPoint.x)
                                yDist = (self.nextPoint.y - self.nextPoint.y)
                            }else {
                                xDist = (self.contactView.frame.minX - self.nextPoint.x)
                                yDist = (self.contactView.frame.minY - self.nextPoint.y)
                            }
                            distance = sqrt((xDist * xDist) + (yDist * yDist))
                            
                        }else {
                            distance = 2 * self.radius
                        }
                        
                        if distance <= self.radius {
                            self.clkBlock?(bubble: self)
                        }

                })
                
            case .Cancelled, .Failed, .Possible:
                break
            }
        }
        
    }
    
    func pressEventAudio(gesture: UIGestureRecognizer) {
        switch gesture.state {
            
        case .Began:
            self.audioAnimate.startAnimating()
            if audiosIndex <= self.audios.count - 1 {
                let coinSound = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("MP3/\(self.audios[audiosIndex])", ofType: "mp3")!)
                do {
                    audioPlayer = try AVAudioPlayer(contentsOfURL: coinSound)
                    audioPlayer.delegate = self
                    audioPlayer.play()
                    
                    audiosIndex++
                } catch let error as NSError {
                    print("Could not create audio player: \(error)")
                }
            }
        case .Changed:
            break
        case .Ended:
            break
        case .Cancelled, .Failed, .Possible:
            break
        }
        
    }
    
    
    //MARK: Private Methods
    func chooseGraphics(rgb: Int) {
        let circle = UIView(frame:CGRectMake(0, 0, 2 * self.radius, 2 * self.radius))
        circle.backgroundColor = colorFromRGB(rgb)
        circle.layer.masksToBounds = true
        circle.layer.cornerRadius = radius
        circle.opaque = false
        circle.alpha = 0.97

        if UserAPI.sharedInstance.graphicState == "圆形" {
            
            self.addSubview(circle)
        }else {
            let viewWidth:CGFloat = 2 * self.radius
            let path = UIBezierPath()
            path.lineWidth = 2.0
            path.moveToPoint(CGPointMake(CGFloat(sin(M_1_PI / 180 * 60)) * (viewWidth / 2), (viewWidth / 4)))
            path.addLineToPoint(CGPointMake((viewWidth / 2), 0))
            path.addLineToPoint(CGPointMake(viewWidth - (CGFloat(sin(M_1_PI / 180 * 60)) * (viewWidth / 2)), (viewWidth / 4)))
            path.addLineToPoint(CGPointMake(viewWidth - (CGFloat(sin(M_1_PI / 180 * 60)) * (viewWidth / 2)), (viewWidth / 2) + (viewWidth / 4)))
            path.addLineToPoint(CGPointMake((viewWidth / 2), viewWidth))
            path.addLineToPoint(CGPointMake(CGFloat(sin(M_1_PI / 180 * 60)) * (viewWidth / 2), (viewWidth / 2) + (viewWidth / 4)))
            path.closePath()
            
            let shapLayer = CAShapeLayer()
            shapLayer.lineWidth = 2.5
            shapLayer.strokeColor = UIColor.redColor().CGColor
            shapLayer.path = path.CGPath
            circle.layer.mask = shapLayer
            
            self.addSubview(circle)
        }
    }
    
    func colorFromRGB(rgb:Int) -> UIColor {
        return UIColor (red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0, green: CGFloat((rgb & 0xFF00) >> 8) / 255.0, blue:CGFloat(rgb & 0xFF) / 255.0, alpha:1.0)
    }
    
    func imageWithView(view: UIView) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0)
        view.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    func convertToFont(title:String) -> UIFont {
        var fontSize : CGFloat = 75.0
        for var i = 0; i < 50; i++ {
            let w = HelperAPI.getWidth(120.0, text: title, font: UIFont(name: "Chalkboard SE", size:fontSize)!)
            
            if w.width <= 2 * self.radius {
//                print("\(w.width) fontsize: \(fontSize)")
                break
            }
            fontSize--
        }
        
        return UIFont(name: "Chalkboard SE", size:fontSize)!
    }
    
    //MARK: Delegate
    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
        if audiosIndex == self.audios.count {
            audiosIndex = 0
            audioPlayer.stop()
            return
        }
        let coinSound = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("MP3/\(self.audios[audiosIndex])", ofType: "mp3")!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOfURL: coinSound)
            audioPlayer.delegate = self
            audioPlayer.play()
            
            audiosIndex++
        } catch let error as NSError {
            print("Could not create audio player: \(error)")
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
