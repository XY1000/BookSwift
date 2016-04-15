//
//  SpecialSubjectController.swift
//  BookSwift
//
//  Created by tmp on 16/4/13.
//  Copyright © 2016年 hxy. All rights reserved.
//

import UIKit

class SpecialSubjectController: UITableViewController {
    
    private var tmpRow:Int = 0
    private let CellId = "SpecialCell"
    
    @IBOutlet weak var headerImgV: UIImageView!
    
    var bookspecialcolumnid:String!
    
    var specialVM : SpecialViewModel = SpecialViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        self.requestDataByNet()
        
        
    }

    func requestDataByNet() {
        
        self.specialVM.getSpecialSubjectDataByViewModelWith(self.bookspecialcolumnid, success: { (isSuccess) -> Void in
            
            self.tableView.reloadData()
            
            
            }) { (error) -> Void in
                
                
        SVProgressHUD.showErrorWithStatus(error.localizedDescription)
                
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.specialVM.specialSubjectNum
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellId, forIndexPath: indexPath)

        return cell
    }
    

    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        
        let myCell:SpecialTableCell = cell as! SpecialTableCell
        
        myCell.model = self.specialVM.getSpecialModel(indexPath.row)
        
        
        print("row \(indexPath.row) line \(myCell.model.hidenLine) \n" )
        
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 40
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 40
    }
    
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let imagV:UIImageView = UIImageView(image: UIImage(named: "flower1"))
        
        return imagV
    }
    
    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let imagV:UIImageView = UIImageView(image: UIImage(named: "flower2"))
        
        return imagV
        
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.specialVM.changeLineArr(self.tmpRow, value: true)
    
        self.specialVM.changeLineArr(indexPath.row, value: false)
        
        self.tmpRow = indexPath.row

        
        tableView.reloadData()
    }
    
    
}
