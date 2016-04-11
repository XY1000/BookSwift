//
//  BookShopViewModel.swift
//  BookSwift
//
//  Created by tmp on 16/4/11.
//  Copyright © 2016年 hxy. All rights reserved.
//



class BookShopViewModel: BaseViewModel {

    /*
    \var agoSpecialColumn: [AgospecialModel]?
    
    var tailoredBook: [TailoredbookModel]?
    
    var hotBook: [HotbookModel]?
    
    var newGoodBook: [NewgoodbookModel]?
    
    var aloneBook: [AlonebookModel]?
    
    var newSpecialColumn: [NewspecialModel]?
    */
    private var headerArr: [NewspecialModel]?
    private var bottomArr: [TailoredbookModel]?
    private var aloneArr: [AlonebookModel]?
    private var hotArr: [HotbookModel]?
    private var xinArr: [NewgoodbookModel]?
    private var liangArr: [AgospecialModel]?
    
    func getDataByNetComplete(success:(isSuccess:Bool)->Void,fail:(error:NSError)->Void)->Void {
        
        
        NetManager.sharedManager().getBookShopData({ (Successback) -> Void in
         
            
            
            
            
            }) { (error) -> Void in
                
                
                fail(error: error)
                
        }
        
        
    }
    
//MARK: 头部数据
    var headerNum : NSInteger {
        
        get {
            
          return (headerArr?.count)!
            
        }
        
        
    }
    
//MARK: 量身打造


//MARK: 新书推荐
    
//MARK: 热门欣赏

//MARK: 独家首发
    
    
//MARK: 底部视图
}
