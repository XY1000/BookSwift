//
//  BookDetailTableViewController.swift
//  BookSwift
//
//  Created by tmp on 16/4/13.
//  Copyright © 2016年 hxy. All rights reserved.
//

import UIKit

class BookDetailTableViewController: UITableViewController {
    
     
    private let CommentCellID = "CommentCell"
    private let FirstCellID = "FirstCell"
    private let LookMoreCellID = "LookMoreCell"
    private let BottomID = "BottomCellForDetail"
    
    lazy var bookDetailVM:BookDetailViewModel = {
       
        return BookDetailViewModel()
        
    }()
    
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
    //版权
    @IBAction func versionClick(sender: UIButton) {
        
    }
    //点击了图书
    @IBAction func tapIcon(sender: UITapGestureRecognizer) {
        
        let vc:LookBookViewController = UIStoryboard(name: "LookBook", bundle: nil).instantiateInitialViewController() as! LookBookViewController
    
        self.navigationController?.delegate = vc
        
        self.navigationController?.pushViewController(vc, animated: true)
        
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
    
    func initHeaderView() {
        
        self.bookIcon.sd_setImageWithURL(self.bookDetailVM.bookIconForHeader())
        self.bookName.text = self.bookDetailVM.bookNameForHeader()
        self.bookWriter.text = self.bookDetailVM.bookWriterForHeader()
        self.bookDesc.text = self.bookDetailVM.bookDescForHeader()
        self.configureReDuWith(self.bookDetailVM.bookRuDuForHeader())
    }
    
  //MARK: 评论
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.requestDataByNet()
        
        self.configureTableView()
        
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func configureTableView() {
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 200
        
        self.tableView.registerNib(UINib(nibName: "FirstCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "FirstCell")
        
        self.tableView.registerNib(UINib(nibName: "LookMoreCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "LookMoreCell")
        
        self.tableView.registerNib(UINib(nibName: "BottomCellForDetail", bundle: nil), forCellReuseIdentifier: "BottomCellForDetail")
        
    }
    
    private func requestDataByNet() {
        
        self.bookDetailVM.getBookDetailDataByVM("", bookid: "", userId: "", success: { (Successback) -> Void in
            
            self.initHeaderView()

            self.tableView.reloadData()
            
            }) { (error) -> Void in
         
                
            SVProgressHUD.showErrorWithStatus(error.localizedDescription)
        }
        
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
       
        if self.bookDetailVM.isLoading {
            
            return 0
        }
        
        
        return 1 + 1 + 1 + 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if section == 1 {
            
            return self.bookDetailVM.bookCommentNum
            
        }else {
            
            return 1
        }
        
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      
        var cell : UITableViewCell!
        
        switch indexPath.section {
            
        case 0:
            
            cell = tableView.dequeueReusableCellWithIdentifier(FirstCellID, forIndexPath: indexPath)
            
        case 1:
            
        cell = tableView.dequeueReusableCellWithIdentifier(CommentCellID, forIndexPath: indexPath)
            
        cell.selectionStyle = UITableViewCellSelectionStyle.None
            
        case 2:
            
            cell = tableView.dequeueReusableCellWithIdentifier(LookMoreCellID, forIndexPath: indexPath)
        default:
    
            cell = tableView.dequeueReusableCellWithIdentifier(BottomID, forIndexPath: indexPath)
            cell.selectionStyle = UITableViewCellSelectionStyle.None
        }
        
        return cell
    }

    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 20
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        
        if cell.isKindOfClass(FirstCell) {
            
            
        }else if cell.isKindOfClass(CommentCell) {
            
            let mycell:CommentCell = cell as! CommentCell
            
            mycell.model = self.bookDetailVM.getBookCommentModel(indexPath.row)
            
            
        }else if cell.isKindOfClass(LookMoreCell) {
            
            
            
        }else if cell.isKindOfClass(BottomCellForDetail) {
            
            let myCell:BottomCellForDetail = cell as! BottomCellForDetail
            
            myCell.ViewModel = self.bookDetailVM
            myCell.collectionView.reloadData()
            
            if indexPath.section == 3 {
                
             
                myCell.titleLb.text = "作者的其他作品"
                
            }else {
                
                myCell.titleLb.text = "读者还读了哪些作品"
            }
            
        }
        
        
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
    
}
