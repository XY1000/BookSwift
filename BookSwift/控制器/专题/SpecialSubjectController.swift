//
//  SpecialSubjectController.swift
//  BookSwift
//
//  Created by tmp on 16/4/13.
//  Copyright © 2016年 hxy. All rights reserved.
//

import UIKit

class SpecialSubjectController: UITableViewController {
    
    
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
        
        
        
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
