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



class Define: NSObject {
    
    //获取传入视图的控制器
   class func viewController(myView:UIView) ->UIViewController? {
        
        for var next = myView.superview!; true ; next = next.superview! {
            
            let nextResponder : UIResponder = next.nextResponder()!
            
            if nextResponder.isKindOfClass(UIViewController) {
                
                return nextResponder as? UIViewController
            }
            
            
        }
        return nil
        
    }
    
    

}
