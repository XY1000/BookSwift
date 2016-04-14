//
//  Define.swift
//  BookSwift
//
//  Created by tmp on 16/4/12.
//  Copyright © 2016年 hxy. All rights reserved.
//

import UIKit

let SCREEN_WIDTH  = UIScreen.mainScreen().bounds.width
let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.height

enum timeType:String {
    
    case 年 = "YYYY"
    case 月 = "MM"
    case 日 = "dd"
    case 时 = "HH"
    case 分 = "mm"
    case 秒 = "ss"
    case 年月日 = "YYYY-MM-dd"
    case 时分秒 = "HH:mm:ss"
    case 月日  = "MM-dd"
    case 时分  = "HH:mm"
}


class Define {
    
    //获取传入视图的控制器(必须保证有控制器，慎用)
   class func viewController(myView:UIView) ->UIViewController? {
        
        for var next = myView.superview!; true ; next = next.superview! {
            
            let nextResponder : UIResponder = next.nextResponder()!
            
            if nextResponder.isKindOfClass(UIViewController) {
                
                return nextResponder as? UIViewController
            }
            
        }
        
    }
    
    //时间转换
   class func  timeWithsting(string:String,type:timeType) ->String {
        
        let time = Double(string)
        
        let detailDate = NSDate(timeIntervalSince1970: time!)
        
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateFormat = type.rawValue
        
        let currentDateStr = dateFormatter.stringFromDate(detailDate)
        
        return currentDateStr
    }
}
    



