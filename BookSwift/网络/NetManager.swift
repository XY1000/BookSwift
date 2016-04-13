//
//  NetManager.swift
//  BookSwift
//
//  Created by tmp on 16/4/11.
//  Copyright © 2016年 hxy. All rights reserved.
//

import UIKit
import Alamofire

class NetManager: NSObject {

    let baseUrl : NSString = "http://120.25.158.69:8080"
    
//MARK: 单例
    class func sharedManager() -> NetManager {
        
        struct HXSingleton {
            
            static var predicate : dispatch_once_t = 0
            static var instance:NetManager? = nil
            
        }
        
        dispatch_once(&HXSingleton.predicate) { () -> Void in
            
            HXSingleton.instance = NetManager()
            
        }
        
        return HXSingleton.instance!
        
    }
    
//MARK:书架
    func getBookShopData(success:(Successback:BookShopModel)-> Void,fail:(error:NSError)->Void) {
        
        
        let url = (baseUrl as String) + "/BookReadPublished/bookInfo/getBookCity"
        
        Alamofire.request(.GET, url, parameters: nil).responseJSON { (Response) -> Void in
            
            switch Response.result {
                
            case .Success:
                
                if  Response.result.isSuccess {
                    
                    let model : BookShopModel = BookShopModel();
                    
                    model.mj_setKeyValues(Response.result.value)
                    
                   success(Successback:model)
                    
                }else {
                    
                    SVProgressHUD.showErrorWithStatus("isSuccess is false")
                    
                }
                
               
                
            case .Failure(let error):
                
                fail(error: error)
            }
            
        }
        
    }
    
//MARK: 专题
    func getSpecialSubjectDataWithId(bookspecialcolumnid:String,success:(Successback:[AnyObject])-> Void,fail:(error:NSError)->Void) {
        
        let url  = (baseUrl as String) + "/BookReadPublished/bookInfo/selectSpecialBook"
        
        let param:[String : AnyObject] = ["bookspecialcolumnid":"1"]
        
        Alamofire.request(.GET, url, parameters: param).responseJSON { (Response) -> Void in
            
            switch Response.result {
                
            case .Success:
                
                if  Response.result.isSuccess {
        
                    success(Successback:Response.result.value == nil ? []:Response.result.value! as! [AnyObject])
                    
                }else {
                    
                    SVProgressHUD.showErrorWithStatus("isSuccess is false")
                    
                }
                
                
                
            case .Failure(let error):
                
            
                fail(error: error)
            }
            

            
        }
        
        
        
    }
    
}
