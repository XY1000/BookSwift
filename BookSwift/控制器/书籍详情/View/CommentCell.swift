//
//  CommentCell.swift
//  BookSwift
//
//  Created by tmp on 16/4/13.
//  Copyright © 2016年 hxy. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {

    var model:BookcommentlistModel! {
        
        
        didSet {
            
            
            self.iconImgV.sd_setImageWithURL(NSURL(string: model.usePhotoUrl!))
            
            self.nickNameLb.text = model.userName
            self.titileLb.text = "fbabfjajgjweagbij能发个几年经济 你见过你就是给你你见过您即可玩就分开来那个家恩我国那就刚好就不让过巨额你；HGJN  JNFJGBERBGAJL NFJKAGNJ BNFGJK能否昂纳进口国你"
            //self.titileLb.text = model.bookcommentcontent
            self.descLb.text = model.bookcommentlocation
            self.dayLb.text = Define.timeWithsting(String(model.bookcommenttime), type: timeType.月日)
            self.timeLb.text = Define.timeWithsting(String(model.bookcommenttime), type: timeType.时分)
            
            self.likeLb.text = "共有" + String(model.countCommentPraise) + "赞"
            
        }
        
    }
    
    @IBOutlet weak var iconImgV: UIImageView!
    
    @IBOutlet weak var nickNameLb: UILabel!
    
    @IBOutlet weak var titileLb: UILabel!
    
    @IBOutlet weak var descLb: UITextView! {
        
        didSet {
            
            descLb.scrollsToTop = true
        }
        
    }
    
    @IBOutlet weak var timeLb: UILabel!
    
    @IBOutlet weak var dayLb: UILabel!
    
    @IBOutlet weak var likeLb: UILabel!
    
    @IBOutlet weak var likeBtn: UIButton!
    
    @IBOutlet weak var zhankaiBtn: UIButton!
    
    @IBAction func likeBtnClick(sender: UIButton) {
        
        
        sender.selected = !sender.selected
        
    }
    
    @IBAction func commentClick(sender: UIButton) {
    }


    @IBAction func lookAllCommentClick(sender: UIButton) {
    }
    
    @IBAction func zhankaiClick(sender: UIButton) {
        
      
        let vc:BookDetailTableViewController = Define.viewController(self) as! BookDetailTableViewController
        
        let tableV : UITableView = vc.view as! UITableView
        
        tableV.beginUpdates()
        
        
        if self.titileLb.numberOfLines == 2 {
            
            sender.setTitle("收回", forState: UIControlState.Normal)
           
            self.titileLb.numberOfLines = 0
            
             tableV.endUpdates()
            return
        }
        
        if self.titileLb.numberOfLines == 0 {
            
            sender.setTitle("展开", forState: UIControlState.Normal)
            
            self.titileLb.numberOfLines = 2
            
            tableV.endUpdates()
            return
        }
        
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
