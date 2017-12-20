//
//  Circle.swift
//  Xpwords
//
//  Created by Yanggl on 15/11/12.
//  Copyright © 2015年 Yongl. All rights reserved.
//

import UIKit

enum UIAnimationType: Int {
    case One = 0
    case Two
    case Three
    case Four
    case Five
    case Six
    
    mutating func toggle(other: Int) {
        switch other {
        case 0, 1:
            self = .One
        case 2:
            self = .Two
        case 3:
            self = .Three
        case 4:
            self = .Four
        case 5:
            self = .Five
        case 6:
            self = .Six
        default:
            break
        }
    }
    func toOther(other: Int) -> UIAnimationType {
        switch other {
        case 0:
            return .One
        case 1:
            return .Two
        case 2:
            return .Three
        case 3:
            return .Four
        case 4:
            return .Five
        case 5:
            return .Six
        default:
            break
        }
        return .One
    }
}


let COLORS = [0x3c5a9a, 0x3083be, 0xbb54b5, 0xd95433, 0x385877, 0x4a74a5, 0x008dd2, 0xb61d23, 0xce3025, 0x00acf2, 0x2e5e89, 0xedd013, 0x00B000, 0xbb18b5, 0xa45d27, 0x0c94dc, 0xff4f15, 0x00cf48, 0xff008f, 0x5fd8fc, 0x00ddb8, 0xfee900]
let NUMBERS = ["Zero", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eightteen", "Nineteen", "Twenty"]
let ANIMALS = ["Fox", "Cow", "Donkey", "Deer", "Cat", "Dog", "Pig", "Sheep", "Rabbit", "Chicken", "Zebra", "Penguin", "Horse", "Panda", "Monkey", "Gorilla", "Tiger", "Elephant", "Leopard", "Lion"]
let FRUITS = ["Apple", "Pear", "Banana", "Cherry", "Watermelon", "Grape", "Orange", "Mandarin", "Strawberry", "Pineapple", "Peach", "Kiwi", "Pomegranate", "Plum", "Lemon", "Hamimelon"]
let TRAFFICS = ["Boat", "Ship", "Bike", "Train", "Bus", "Car", "Truck", "Motorcycle", "Submarine", "Helicopter", "Airship", "Spaceship", "Plane", "Balloon"]

let letIndexs = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25]

class Circle: NSObject {
    var bubbleRadius:CGFloat = 80.0
    var parentView: UIView = UIView()
    var centerPoint: CGPoint = CGPoint()                        //屏幕中心点
    var animationType: UIAnimationType = UIAnimationType.One    //动画类型
    var sceneType: SceneType = SceneType.Num
    
    var centerNums = [AnyObject]()
    var bubbles = [BubbleButton]()
    
    private var radius:CGFloat = 330.0

    // MARK: - Init Methods
    
    init(radiusValue: CGFloat, inView: UIView) {
        super.init()
        
        self.centerPoint = inView.center
        self.bubbleRadius = radiusValue
        self.parentView = inView
    }

    //MARK: Private Methods
    
    func showBubbleWithAnimation(bubble: BubbleButton) {
        UIView.animateWithDuration(0.25, animations: {
            bubble.center = CGPointMake(bubble.nextCenter.x, bubble.nextCenter.y)
            bubble.alpha = 1
            bubble.transform = CGAffineTransformMakeScale(1.2, 1.2)
            
            }, completion: { finished in
                UIView.animateWithDuration(0.15, animations: {
                    bubble.transform = CGAffineTransformMakeScale(0.8, 0.8)
                    }, completion: { finished in
                        UIView.animateWithDuration(0.15, animations: {
                            bubble.transform = CGAffineTransformMakeScale(1, 1)
                            }, completion: { finished in
                                if bubble.tag == self.bubbles.count - 1 {
                                }
                                
                                bubble.layer.shadowColor = UIColor.blackColor().CGColor
                                bubble.layer.shadowOpacity = 0.2
                                bubble.layer.shadowOffset = CGSizeMake(0, 1)
                                bubble.layer.shadowRadius = 2
                        })
                })
        })
    }
    
    func hideBubbleWithAnimation(bubble: BubbleButton) {
        UIView.animateWithDuration(0.2, animations: {
            bubble.transform = CGAffineTransformMakeScale(1.2, 1.2)
            
            }, completion: { finished in
                UIView.animateWithDuration(0.25, animations: {
                    bubble.center = CGPointMake(bubble.startPoint.x, bubble.startPoint.y)
                    bubble.alpha = 0
                    bubble.transform = CGAffineTransformMakeScale(0.001, 0.001)
                    }, completion: { finished in
                        if bubble.tag == self.bubbles.count - 1 {
                            self.bubbles.removeAll()
                            self.parentView.viewWithTag(666)?.removeFromSuperview()
                        }
                        
                        bubble.removeFromSuperview()
                })
        })
    }
    
    
    internal func getTitles() -> [String] {
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
    
    internal func showFirstAnimationType() {
        let bubbleDistanceFromPivot = self.radius - self.bubbleRadius
        
        let bubblesBetweenAngel = 360 / bubbles.count;
        let angely = (CGFloat) ((180.0 - CGFloat(bubblesBetweenAngel)) * 0.5)
        let startAngel = 180 - angely
        
        for var i = 0; i < bubbles.count; ++i {
            let bubble = bubbles[i]
            bubble.tag = i
            
            let angle = startAngel + CGFloat(i * bubblesBetweenAngel)
            let x = (CGFloat) (cos(angle * CGFloat(M_PI) / 180.0) * bubbleDistanceFromPivot + self.centerPoint.x)
            let y = (CGFloat) (sin(angle * CGFloat(M_PI) / 180.0) * bubbleDistanceFromPivot + self.centerPoint.y) + 20.0
            
            bubble.nextCenter = CGPoint(x: x, y: y)
            bubble.transform = CGAffineTransformMakeScale(0.001, 0.001)
        }
        
        switch self.animationType {
        case .One:
            for var i = 0; i < bubbles.count; ++i {
                let bubble = bubbles[i]
                bubble.startPoint = self.centerPoint
                bubble.center = CGPointMake(bubble.startPoint.x, bubble.startPoint.y + 20.0)
            }
            
        case .Two:
            let bubbleDistanceFromPivot = 680.0 - self.bubbleRadius
            
            let bubblesBetweenAngel = 360 / bubbles.count;
            let angely = (CGFloat) ((180.0 - CGFloat(bubblesBetweenAngel)) * 0.5)
            let startAngel = 180 - angely
            
            for var i = 0; i < bubbles.count; ++i
            {
                let bubble = bubbles[i]
                
                let angle = startAngel + CGFloat(i * bubblesBetweenAngel)
                let x = (CGFloat) (cos(angle * CGFloat(M_PI) / 180.0) * bubbleDistanceFromPivot + self.centerPoint.x)
                let y = (CGFloat) (sin(angle * CGFloat(M_PI) / 180.0) * bubbleDistanceFromPivot + self.centerPoint.y) + 20.0
                
                bubble.startPoint = CGPoint(x: x, y: y)
                bubble.center = CGPointMake(bubble.startPoint.x, bubble.startPoint.y + 20.0)
            }
            
        case .Three:
            let distance = self.parentView.frame.width / CGFloat(bubbles.count)
            for var i = 0; i < bubbles.count; ++i
            {
                let bubble = bubbles[i]
                
                let x = 2 / distance + CGFloat(i) * distance
                
                bubble.startPoint = CGPoint(x: x, y: -50.0)
                bubble.center = CGPointMake(bubble.startPoint.x, bubble.startPoint.y + 20.0)
            }
            
        case .Four:
            let distance = self.parentView.frame.width / CGFloat(bubbles.count)
            for var i = 0; i < bubbles.count; ++i
            {
                let bubble = bubbles[i]
                
                let x = 2 / distance + CGFloat(i) * distance
                
                bubble.startPoint = CGPoint(x: x, y: self.parentView.frame.height + 50.0)
                bubble.center = CGPointMake(bubble.startPoint.x, bubble.startPoint.y + 20.0)
            }
            
        case .Five:
            let distance = self.parentView.frame.height / CGFloat(bubbles.count)
            for var i = 0; i < bubbles.count; ++i
            {
                let bubble = bubbles[i]
                
                let y = 2 / distance + CGFloat(i) * distance
                
                bubble.startPoint = CGPoint(x: self.parentView.frame.width + 50.0, y: y)
                bubble.center = CGPointMake(bubble.startPoint.x, bubble.startPoint.y + 20.0)
            }
            
        case .Six:
            let distance = self.parentView.frame.height / CGFloat(bubbles.count)
            for var i = 0; i < bubbles.count; ++i
            {
                let bubble = bubbles[i]
                
                let y = 2 / distance + CGFloat(i) * distance
                
                bubble.startPoint = CGPoint(x: -50.0, y: y)
                bubble.center = CGPointMake(bubble.startPoint.x, bubble.startPoint.y + 20.0)
            }
            
        }
    }
    
    internal func showAfterAnimationType() {
        for var i = 0; i < bubbles.count; ++i {
            let bubble = bubbles[i]
            bubble.tag = i
            
            let length = (self.parentView.frame.size.width - 58.0) / 6
            let x = (CGFloat)((CGFloat)(i + 1) * length  - self.bubbleRadius + 29.0)
            let y = (CGFloat)(668.0)
            
            bubble.nextCenter = CGPoint(x: x, y: y)
            bubble.transform = CGAffineTransformMakeScale(0.001, 0.001)
        }
        
        switch self.animationType {
        case .One:
            for var i = 0; i < bubbles.count; ++i {
                let bubble = bubbles[i]
                bubble.startPoint = self.centerPoint
                bubble.center = CGPointMake(bubble.startPoint.x, bubble.startPoint.y + 20.0)
            }
            
        case .Two:
            let bubbleDistanceFromPivot = 680.0 - self.bubbleRadius
            
            let bubblesBetweenAngel = 360 / bubbles.count;
            let angely = (CGFloat) ((180.0 - CGFloat(bubblesBetweenAngel)) * 0.5)
            let startAngel = 180 - angely
            
            for var i = 0; i < bubbles.count; ++i
            {
                let bubble = bubbles[i]
                
                let angle = startAngel + CGFloat(i * bubblesBetweenAngel)
                let x = (CGFloat) (cos(angle * CGFloat(M_PI) / 180.0) * bubbleDistanceFromPivot + self.centerPoint.x)
                let y = (CGFloat) (sin(angle * CGFloat(M_PI) / 180.0) * bubbleDistanceFromPivot + self.centerPoint.y) + 20.0
                
                bubble.startPoint = CGPoint(x: x, y: y)
                bubble.center = CGPointMake(bubble.startPoint.x, bubble.startPoint.y + 20.0)
            }
            
        case .Three:
            let distance = self.parentView.frame.width / CGFloat(bubbles.count)
            for var i = 0; i < bubbles.count; ++i
            {
                let bubble = bubbles[i]
                
                let x = 2 / distance + CGFloat(i) * distance
                
                bubble.startPoint = CGPoint(x: x, y: -50.0)
                bubble.center = CGPointMake(bubble.startPoint.x, bubble.startPoint.y + 20.0)
            }
            
        case .Four:
            let distance = self.parentView.frame.width / CGFloat(bubbles.count)
            for var i = 0; i < bubbles.count; ++i
            {
                let bubble = bubbles[i]
                
                let x = 2 / distance + CGFloat(i) * distance
                
                bubble.startPoint = CGPoint(x: x, y: self.parentView.frame.height + 50.0)
                bubble.center = CGPointMake(bubble.startPoint.x, bubble.startPoint.y + 20.0)
            }
            
        case .Five:
            let distance = self.parentView.frame.height / CGFloat(bubbles.count)
            for var i = 0; i < bubbles.count; ++i
            {
                let bubble = bubbles[i]
                
                let y = 2 / distance + CGFloat(i) * distance
                
                bubble.startPoint = CGPoint(x: self.parentView.frame.width + 50.0, y: y)
                bubble.center = CGPointMake(bubble.startPoint.x, bubble.startPoint.y + 20.0)
            }
            
        case .Six:
            let distance = self.parentView.frame.height / CGFloat(bubbles.count)
            for var i = 0; i < bubbles.count; ++i
            {
                let bubble = bubbles[i]
                
                let y = 2 / distance + CGFloat(i) * distance
                
                bubble.startPoint = CGPoint(x: -50.0, y: y)
                bubble.center = CGPointMake(bubble.startPoint.x, bubble.startPoint.y + 20.0)
            }
            
        }
    }
    
    
    // MARK: Public Methods
    
    func show(view:UIView) {
    }

    func hide() {
        var inetratorI = 0
        for bubble in bubbles {
            let delayTime = (NSTimeInterval) (CGFloat( inetratorI ) * 0.1)
            self.performSelector(Selector("hideBubbleWithAnimation:"), withObject: bubble, afterDelay: delayTime)
            ++inetratorI;
        }
        
    }
    
    func removeAll() {
        for bubble in bubbles {
            if bubble.tag == self.bubbles.count - 1 {
                self.bubbles.removeAll()
                self.parentView.viewWithTag(666)?.removeFromSuperview()
            }
            
            bubble.removeFromSuperview()
        }
    }


}
