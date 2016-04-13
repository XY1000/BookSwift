//
//  BookDetailTableViewController.swift
//  BookSwift
//
//  Created by tmp on 16/4/13.
//  Copyright © 2016年 hxy. All rights reserved.
//

import UIKit

class BookDetailTableViewController: UITableViewController {
    
//头部
    
    @IBOutlet weak var bookIcon: UIImageView!
    
    @IBOutlet weak var bookName: UILabel!
    
    @IBOutlet weak var bookWriter: UILabel!
    
    @IBOutlet weak var bookDesc: UITextView!
    
    @IBOutlet weak var redu5: UIImageView!
    @IBOutlet weak var redu1: UIImageView!
    
    @IBOutlet weak var redu4: UIImageView!
    @IBOutlet weak var redu3: UIImageView!
    @IBOutlet weak var redu2: UIImageView!
    
    
    //目录
    @IBAction func catalogClick(sender: UIButton) {
        
    }
    
    @IBAction func versionClick(sender: UIButton) {
        
    }
    
    
    private func configureReDuWith(hotNum:Int) {
        
        
        let fillImage = UIImage(named: "redu")
        let nullImage = UIImage(named: "redu1")
        
        switch (hotNum) {
        case 0:
            
            self.redu1.image = nullImage;
            self.redu2.image = nullImage;
            self.redu3.image = nullImage;
            self.redu4.image = nullImage;
            self.redu5.image = nullImage;
            
        case 1:
            
            self.redu1.image = fillImage;
            self.redu2.image = nullImage;
            self.redu3.image = nullImage;
            self.redu4.image = nullImage;
            self.redu5.image = nullImage;
            
        
     
        case 2:
            self.redu1.image = fillImage;
            self.redu2.image = fillImage;
            self.redu3.image = nullImage;
            self.redu4.image = nullImage;
            self.redu5.image = nullImage;
    
        case 3:
            
            self.redu1.image = fillImage;
            self.redu2.image = fillImage;
            self.redu3.image = fillImage;
            self.redu4.image = nullImage;
            self.redu5.image = nullImage;
       
        case 4:
            self.redu1.image = fillImage;
            self.redu2.image = fillImage;
            self.redu3.image = fillImage;
            self.redu4.image = fillImage;
            self.redu5.image = nullImage;
       
     
        case 5:
            
            self.redu1.image = fillImage;
            self.redu2.image = fillImage;
            self.redu3.image = fillImage;
            self.redu4.image = fillImage;
            self.redu5.image = fillImage;
       
        
        default:
            break;
        }

        
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
