//
//  SpecialViewModel.swift
//  BookSwift
//
//  Created by tmp on 16/4/13.
//  Copyright © 2016年 hxy. All rights reserved.
//

import UIKit

class SpecialViewModel: BaseViewModel {

    private var specialArr:[AnyObject]?
    
    func getSpecialSubjectDataByViewModelWith(bookspecialcolumnid:String,success:(isSuccess:Bool)->Void,fail:(error:NSError)->Void) {
        
        NetManager.sharedManager().getSpecialSubjectDataWithId(bookspecialcolumnid, success: { (Successback) -> Void in
            
            self.isLoading = false
            
            self.specialArr = Successback
            
            success(isSuccess: true)
            
            }) { (error) -> Void in
            
                fail(error:error)
        }
        
    }
    
    var specialSubjectNum : Int {
        
        get {
            
            if self.specialArr == nil {
                
                return 0
            }
            
            return self.specialArr!.count
            
        }
        
    }
    
    
     func getSpecialModel(row:Int) -> SpecialSubjectModel {
    
        
        let model = SpecialSubjectModel()
    
        model.mj_setKeyValues(self.specialArr![row])
        
        return model
    
    }
    
    
    
    
    
}
