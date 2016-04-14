//
//  BookDetailViewModel.swift
//  BookSwift
//
//  Created by tmp on 16/4/14.
//  Copyright © 2016年 hxy. All rights reserved.
//

import UIKit

class BookDetailViewModel: BaseViewModel {

    private var  headerArr:[NSDictionary]?
    private var  commentArr:[NSDictionary]?
    private var  userReadArr:[NSDictionary]?
    
    func getBookDetailDataByVM(pageFlg:String,bookid:String,userId:String,success:(Success:Bool)-> Void,fail:(error:NSError)->Void) {
        
        
        NetManager.sharedManager().getBookDetailData(pageFlg, bookid: bookid, userId: userId, success: { (Successback) -> Void in
            
            
            self.headerArr = Successback.bookInfoList
            self.commentArr = Successback.bookCommentList
            self.userReadArr = Successback.userReadBookList
            
            self.isLoading = false
            
            success(Success: true)

            }) { (error) -> Void in
                
                fail(error: error)
                
        }
        
    }
    
    //Mark: 头部
    
    private func getBookInfoModel() -> BookinfolistModel! {
        
       let model = BookinfolistModel()
        
        model.mj_setKeyValues(self.headerArr!.first)
        
        return model
     }
    
    
    func bookIconForHeader() ->NSURL {
        
        
        return NSURL(string: self.getBookInfoModel().bookimageurl!)!
        
    }
    
    
    func bookNameForHeader() ->String {
        
        
        return self.getBookInfoModel().bookname!
        
    }
    
    func bookWriterForHeader() ->String {
        
        return self.getBookInfoModel().bookauthor!
    }
    
    func bookDescForHeader() ->String {
        
        return self.getBookInfoModel().bookpreface!
    }
    
    func bookRuDuForHeader() ->Int {
        
        var redu : Int = 0
        let num = self.getBookInfoModel().bookpviews
        
        if num >= 5000 {
            
            redu = 5
            
        }else if num >= 4000 {
            
            redu = 4
        }else if num >= 3000 {
            
            redu = 3
        }else if num >= 2000 {
            
            redu = 2
        }else if num >= 1000 {
            
            redu = 1
            
        }else {
            redu = 0
        }
        
        return redu
    }
    
    //MARK:评论页面
    
    var bookCommentNum:Int {
        
        get {
            
            if self.commentArr == nil {
                
                return 0
            }
            
            return self.commentArr!.count
            
        }
    }
    
    
     func getBookCommentModel(row:Int) -> BookcommentlistModel! {
        
        
        let model = BookcommentlistModel()
        
        model.mj_setKeyValues(self.commentArr![row])
        
        return model
    }
    
    //MARK: 底部页面
    
   private func getUserReadModel(row:Int) ->UserReadbooklistModel {
        
        let model = UserReadbooklistModel()
        
        model.mj_setKeyValues(self.userReadArr![row])
        
        return model
    }
    
    
    func bookIconForUserRead(row:Int) ->NSURL {
        
        
        return NSURL(string: self.getUserReadModel(row).bookimageurl!)!
    }
    
    func bookNameForUserRead(row:Int) ->String {
        
        return self.getUserReadModel(row).bookname!
    }
    
    
    
}
