//
//  BottomCellForDetail.swift
//  BookSwift
//
//  Created by tmp on 16/4/14.
//  Copyright © 2016年 hxy. All rights reserved.
//

import UIKit

class BottomCellForDetail: UITableViewCell , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var titleLb: UILabel!
    
    var ViewModel:BookDetailViewModel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBAction func moreBtnClick(sender: UIButton) {
        
        
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
       
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.registerNib(UINib(nibName: "DetailCollectionCell", bundle: nil), forCellWithReuseIdentifier: "DetailCollectionCell")
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    //MARK: UICollectionViewDelegate/DataSource
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 2
        
    }
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        if self.ViewModel == nil {
            
            return 0
        }
        
        return 2
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("DetailCollectionCell", forIndexPath: indexPath)
        
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        
        var num : Int = 0
        
        switch indexPath.row {
            
        case 0:
            
            num = indexPath.section * 2
            
        case 1:
            
            num = indexPath.section * 2 + 1
            
        default:
            
            num = 0
        }
        
        
        let myCell :DetailCollectionCell = cell as! DetailCollectionCell
        
        myCell.bookIcon.sd_setImageWithURL(self.ViewModel.bookIconForUserRead(num))
        myCell.bookName.text = self.ViewModel.bookNameForUserRead(num)

        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    
        
        return CGSizeMake(130,  210)
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        
        
        let num = (SCREEN_WIDTH - 2 * 130) / 3.0
        
        
        return UIEdgeInsetsMake(5, num, 5, num)
        
    }
    

   
    
    
}
