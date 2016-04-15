//
//  SpecialTableCell.swift
//  BookSwift
//
//  Created by tmp on 16/4/13.
//  Copyright © 2016年 hxy. All rights reserved.
//

import UIKit

class SpecialTableCell: UITableViewCell {

    var model:SpecialSubjectModel! {
        
        didSet {
            
            descLb.text = model.bookpreface
            iconImgV.sd_setImageWithURL(NSURL(string: model.bookimageurl!))
            nameLb.text = model.bookname
            writerLb.text = model.bookauthor
            self.lineView.hidden = model.hidenLine
        }
        
    }
    
    var lineView:UIView!
    
    @IBOutlet weak var readBtn: UIButton!
    @IBOutlet weak var descLb: UILabel!
    @IBOutlet weak var writerLb: UILabel!
    @IBOutlet weak var nameLb: UILabel!
    @IBOutlet weak var iconImgV: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.lineView = UIView(frame: CGRect.init(x: 0, y: 0, width: 5, height: self.bounds.size.height))
        self.lineView.backgroundColor = UIColor.redColor()
        print(self.bounds.size.height)
        
        self.addSubview(self.lineView)
    }

    @IBOutlet weak var readBtnClick: UIButton!
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

  
    
    
}
