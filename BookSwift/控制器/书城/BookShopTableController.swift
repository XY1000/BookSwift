//
//  BookShopTableController.swift
//  BookSwift
//
//  Created by tmp on 16/4/11.
//  Copyright © 2016年 hxy. All rights reserved.
//


class BookShopTableController: UITableViewController {

    lazy var bookshopVM : BookShopViewModel = {
        
        return BookShopViewModel()
        
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.requestDataByNet()
        
    }
    
    func requestDataByNet() -> Void {
        
        
        self.bookshopVM.getDataByNetComplete({ (isSuccess) -> Void in
            
            if isSuccess {
                
                self.tableView.reloadData()
                
            }else {
                
                
                SVProgressHUD.showErrorWithStatus("后台维护中")
            }
            
            
            }) { (error) -> Void in
                
        }
        
    }
    
//MARK:UITableViewDelegate/DataSource
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return 1;
        
    }
    
    
    

}


