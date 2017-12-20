//
//  Error.swift
//  Xpwords
//
//  Created by Young on 15/11/16.
//  Copyright © 2015年 Yongl. All rights reserved.
//

import UIKit

class ErrorList: NSObject {
    var listWord:String = ""
    var listCount:Int = 0
    var listDate:String = ""
    var listOpne:Bool = false
    var listIndexPaths = [NSIndexPath]()
    
    var listError = [Error]()
}

class Error: NSObject {
    var word:String = ""
    var count:Int32 = 0
    var date:String = ""
}