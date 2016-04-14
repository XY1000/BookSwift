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
            
            myCell.bookNameLb.text = self.bookShopVM?.bookNameForXin(indexPath.section)
            myCell.bookIcon.sd_setImageWithURL(self.bookShopVM?.bookIconForXin(indexPath.section))
            
            myCell.bookWriterLb.text = self.bookShopVM?.bookWriterForXin(indexPath.section)
            
        case .hotStyle:
            
            myCell.bookNameLb.text = self.bookShopVM?.bookNameForHot(indexPath.section)
            myCell.bookIcon.sd_setImageWithURL(self.bookShopVM?.bookIconForHot(indexPath.section))
            myCell.bookWriterLb.text = self.bookShopVM?.bookWriterForHot(indexPath.section)
            
        case .duStyle:
            
            myCell.bookNameLb.text = self.bookShopVM?.bookNameForAlone(indexPath.section)
            myCell.bookIcon.sd_setImageWithURL(self.bookShopVM?.bookIconForAlone(indexPath.section))
            
            myCell.bookWriterLb.text = self.bookShopVM?.bookWriterForAlone(indexPath.section)
            
        
        }
        
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        
        let story = UIStoryboard(name: "BookDetail", bundle: nil)
        
        let vc = story.instantiateInitialViewController()
        
        let parentVC = Define.viewController(collectionView)
        
        parentVC?.navigationController?.showViewController(vc!, sender: parentVC)
        
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let width  = (SCREEN_WIDTH - 3 * 15 - 5 ) / 3.5
        
        return CGSizeMake(width, width * 2.2)
        
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsetsMake(0, 5, 0, 5)
        
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
