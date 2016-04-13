//
//  BookShopViewModel.swift
//  BookSwift
//
//  Created by tmp on 16/4/11.
//  Copyright © 2016年 hxy. All rights reserved.
//



class BookShopViewModel: BaseViewModel {

    private var headerArr: [NSDictionary]?
    private var bottomArr: [NSDictionary]?
    private var aloneArr: [NSDictionary]?
    private var hotArr: [NSDictionary]?
    private var xinArr: [NSDictionary]?
    private var liangArr: [NSDictionary]?

    
    func getDataByNetComplete(success:(isSuccess:Bool)->Void,fail:(error:NSError)->Void)->Void {
        
        
        NetManager.sharedManager().getBookShopData({ (Successback) -> Void in
         
            
            self.isLoading = false
            self.headerArr = Successback.newSpecialColumn
            self.bottomArr = Successback.agoSpecialColumn
            self.hotArr = Successback.hotBook
            self.aloneArr = Successback.aloneBook
            self.xinArr = Successback.newGoodBook
            self.liangArr = Successback.tailoredBook
            
            success(isSuccess: true)
           
            
            }) { (error) -> Void in
                
                
                fail(error: error)
                
        }
        
        
    }
    
    
//MARK: 头部数据
    
    private func getHeaderModel(row:Int)->NewspecialModel {
        
        let model = NewspecialModel()
        
        model.mj_setKeyValues(self.headerArr![row])
        
        
        return model
        
        
    }
    
    var headerNum : Int {
        
        get {

            if self.headerArr == nil {
                
                return 0
            }
            
          return (self.headerArr?.count)!
            
        }
        
        
    }
    func headerImageUrl(row:Int)->NSURL {
        
        
        return NSURL(string: self.getHeaderModel(row).bookspecialcolumnthumbnailurl!)!
        
    }
    
    func headerViewID(row:Int)->Int {
        
        return self.getHeaderModel(row).bookspecialcolumnid
    }
    
//MARK: 量身打造
    var liangNum : Int {
        
        get {
        
            if self.liangArr == nil {
                
                return 0
            }
            
            return (self.liangArr?.count)!
        }
    }

    private func getTailModel(row:Int)->TailoredbookModel {
        
        let model:TailoredbookModel = TailoredbookModel()
    
        model.mj_setKeyValues(self.liangArr![row])
    
        return model
    
    }
    
    func bookIconForLiang(row:Int)->NSURL {
        
        
        return NSURL(string: self.getTailModel(row).bookimageurl!)!
    }
    
    func bookNameForLiang(row:Int)->String {
        
        return self.getTailModel(row).bookname!
    }
    
    func bookWriterForLiang(row:Int)->String {
        
        return self.getTailModel(row).bookauthor!
    }
    
//MARK: 新书推荐
    
    var xinNum : Int {
        
        get {
            
            if self.xinArr == nil {
                
                return 0
            }
            
            return (self.xinArr?.count)!
        }
    }
    
    private func getNewGoodModel(row:Int)->NewgoodbookModel {
        
        let model = NewgoodbookModel()
        
        model.mj_setKeyValues(self.xinArr![row])
        
        return model
        
    }
    
    func bookIconForXin(row:Int) ->NSURL {
        
        
        return NSURL(string: self.getNewGoodModel(row).bookimageurl!)!
        
    }
    
    func bookNameForXin(row:Int) ->String {
        
        
        return self.getNewGoodModel(row).bookname!
        
    }
    
    func bookWriterForXin(row:Int) ->String {
        
        return self.getNewGoodModel(row).bookauthor!
    }
    
//MARK: 热门欣赏

    var hotNum : Int {
        
        get {
            
            if self.hotArr == nil {
                
                return 0
            }
            
            return (self.hotArr?.count)!
        }
    }
    
    
    private func getHotModelForHot(row:Int) ->HotbookModel {
        
        let model = HotbookModel()
        
        model.mj_setKeyValues(self.hotArr![row])
        
        return model
    }
    
    
    func bookIconForHot(row:Int) ->NSURL {
        
        
        return NSURL(string: self.getHotModelForHot(row).bookimageurl!)!
        
    }
    
    func bookNameForHot(row:Int) ->String {
        
        
        return self.getHotModelForHot(row).bookname!
    }
    
    func bookWriterForHot(row:Int) ->String {
        
        return self.getHotModelForHot(row).bookauthor!
    }
    
//MARK: 独家首发
    
    var aloneNum : Int {
        
        get {
            
            if self.aloneArr == nil {
                
                return 0
            }
            
            return (self.aloneArr?.count)!
        }
    }
    
    
    private func getAloneModel(row:Int) ->AlonebookModel {
        
        
        let model = AlonebookModel()
        
        
        model.mj_setKeyValues(self.aloneArr![row])
        
        return model
        
    }
    
    func bookIconForAlone(row:Int) ->NSURL {
        
        return NSURL(string: self.getAloneModel(row).bookimageurl!)!
    }
    
    func bookNameForAlone(row:Int) ->String {
        
        return self.getAloneModel(row).bookname!
    }
    
    func bookWriterForAlone(row:Int) ->String {
        
        return self.getAloneModel(row).bookauthor!
        
    }
    
//MARK: 底部视图
    
    var bottomNum : Int {
        
        get {
            
            if self.bottomArr == nil {
                
                return 0
            }
            
            return (self.bottomArr?.count)!
        }
    }
    
    private func getBottomModel(row:Int) ->AgospecialModel {
        
        
        let model = AgospecialModel()
        
        model.mj_setKeyValues(self.bottomArr![row])
        
        return model
    }
    
    func bottomIconForBottom(row:Int) ->NSURL {
        
        return NSURL(string: self.getBottomModel(row).bookspecialcolumnthumbnailurl!)!
        
    }
    
    func bottomIdForBottom(row:Int) ->Int {
        
        return self.getBottomModel(row).bookspecialcolumnid
        
    }
    
}
