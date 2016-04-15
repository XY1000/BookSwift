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
    var lineArr:[Bool] = []
    
    func getSpecialSubjectDataByViewModelWith(bookspecialcolumnid:String,success:(isSuccess:Bool)->Void,fail:(error:NSError)->Void) {
        
        NetManager.sharedManager().getSpecialSubjectDataWithId(bookspecialcolumnid, success: { (Successback) -> Void in
            
            self.isLoading = false
            
            self.specialArr = Successback
            
            self.configureLineArr()
            
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
        
        model.hidenLine = self.lineArr[row]
        
        return model
    
    }
    
    
    //自己配置数据
    func configureLineArr(){
        
        if self.specialArr != nil {
            
            
            for var i = 0; i < self.specialArr!.count ; i++ {
                
                if i == 0{
                
                self.lineArr.append(false)
                    
                }else {
                    
                    self.lineArr.append(true)
                }
            }
            
        }
        
    }
    
    func changeLineArr(index:Int, value:Bool) {
        
        self.lineArr[index] = value
        
    }
    
    
}
