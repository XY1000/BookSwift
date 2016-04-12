//
//  BookShopCell.swift
//  BookSwift
//
//  Created by tmp on 16/4/12.
//  Copyright © 2016年 hxy. All rights reserved.
//

import UIKit

enum styleForCell {
    
    case liangStyle
    case xinStyle
    case hotStyle
    case duStyle
    
}

class BookShopCell: UITableViewCell,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {

    var cellStyle:styleForCell = .liangStyle
    
    var bookShopVM : BookShopViewModel?
    
    @IBOutlet weak var titleLb: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var moreBtn: UIButton!

    let cellID = "CollectionCell"
    
  //MARK:UICollectionViewDelegate/Datasource
    
     func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        
        switch self.cellStyle {
            
        case .liangStyle:
            
            return (self.bookShopVM?.liangNum)!
        
        case .xinStyle:
            
            return (self.bookShopVM?.xinNum)!
            
        case .hotStyle:
            
            return (self.bookShopVM?.hotNum)!
            
        case .duStyle:
            
            return (self.bookShopVM?.aloneNum)!
    
            
        }
        
        
        
    
    }
    
     func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellID, forIndexPath: indexPath)
        
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        
        let myCell = cell as! BookShopCollectionCell
        
        switch self.cellStyle {
            
        case .liangStyle:
            
            myCell.bookNameLb.text = self.bookShopVM?.bookNameForLiang(indexPath.section)
            myCell.bookIcon.sd_setImageWithURL(self.bookShopVM?.bookIconForLiang(indexPath.section))
            
            myCell.bookWriterLb.text = self.bookShopVM?.bookWriterForLiang(indexPath.section)
            
        case .xinStyle:
            
            myCell.bookNameLb.text = "asd23"
            
        case .hotStyle:
            
            myCell.bookNameLb.text = "asd3"
            
        case .duStyle:
            
            myCell.bookNameLb.text = "asd4"
            
        default:
            
            break
        }
        
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let width  = (SCREEN_WIDTH - 3 * 15 - 5 ) / 3.5
        
        return CGSizeMake(width, width * 2)
        
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsetsMake(5, 5, 5, 5)
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
     
        return 15
        
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
    
}
