//
//  BookShopTableController.swift
//  BookSwift
//
//  Created by tmp on 16/4/11.
//  Copyright © 2016年 hxy. All rights reserved.
//



class BookShopTableController: UITableViewController {

    
    
    
    @IBOutlet weak var headerView: UIScrollView!
    lazy var bookshopVM : BookShopViewModel = {
        
        return BookShopViewModel()
        
        
        
    }()
    
    private var timer:NSTimer?
    private var timerTmpNum = 1
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.requestDataByNet()
        
        self.tableView.tableFooterView?.bounds = CGRectMake(0, 0,(self.tableView.tableFooterView?.bounds.size.width)!, 250)
        
    }
   private func requestDataByNet() -> Void {
        
        
        self.bookshopVM.getDataByNetComplete({ (isSuccess) -> Void in
            
            if isSuccess {
                
                self.configureHeaderView()
                
                self.tableView.reloadData()
                
            }else {
                
                
                SVProgressHUD.showErrorWithStatus("后台维护中")
            }
            
            
            }) { (error) -> Void in
                
                SVProgressHUD.showErrorWithStatus(error.localizedDescription)
                
        }
        
    }
//MARK: 头部视图
   private func configureHeaderView() {
        
        let num : CGFloat = (CGFloat)(self.bookshopVM.headerNum)
        
        if num == 0 {
            
            self.headerView.removeFromSuperview()
        }
        
        
        self.headerView.contentSize = CGSizeMake(num  * SCREEN_WIDTH,self.headerView.bounds.height)
        self.headerView.delegate = self
        
        for var i : Int = 0 ; i < self.bookshopVM.headerNum ; i++ {
            
            let btn = UIButton(frame: CGRectMake(CGFloat(i)  * SCREEN_WIDTH,0,SCREEN_WIDTH,self.headerView.bounds.height))
            
            btn.sd_setBackgroundImageWithURL(self.bookshopVM.headerImageUrl(i), forState: UIControlState.Normal)
            
            btn.tag = 1000 + self.bookshopVM.headerViewID(i)
            
            btn.addTarget(self, action:"headerViewDidSelected:", forControlEvents: UIControlEvents.TouchUpInside)
            
            self.headerView.addSubview(btn)
            
        }
        
        
        self.timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: "timerAction:", userInfo: nil, repeats: true)
        
    }
    
   func timerAction(timer:NSTimer)->Void {
        
        
        if timerTmpNum == 4 {
            
            self.headerView.setContentOffset(CGPointZero, animated: false)
            timerTmpNum = 1
            
        }else {
        
        self.headerView.setContentOffset(CGPointMake(CGFloat(timerTmpNum) * SCREEN_WIDTH, 0), animated: true)
        
        timerTmpNum++
            
        }
        
        
    }
    
    func headerViewDidSelected(sender:UIButton)->Void {
        
        print("图片的id \(sender.tag - 1000)")
        
    }
//MARK:UIScrollerViewDelegate
   override func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        
    self.timer?.invalidate()
    
    self.timer = nil
    
    }
    override func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        let offset = scrollView.contentOffset.x
        
        if offset < SCREEN_WIDTH {
            
            timerTmpNum = 0
            
        }else if offset < SCREEN_WIDTH * 2 {
            
            timerTmpNum = 1
            
        }else if offset < SCREEN_WIDTH * 3 {
            
            timerTmpNum = 2
            
        }else if offset < SCREEN_WIDTH * 4 {
            
            timerTmpNum = 3
            
        }
       
        self.timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: "timerAction:", userInfo: nil, repeats: true)
        
    }
    
    
//MARK:UITableViewDelegate/DataSource
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return 1;
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell
        
        if indexPath.section == 4 {
            
             cell  = tableView.dequeueReusableCellWithIdentifier("BottomCell", forIndexPath: indexPath)

        }else {
            
         cell  = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
            
        }
        return cell
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return self.bookshopVM.isLoading ? 0 : 5
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        //最后一个
        if indexPath.section == 4 {
            
            let bottomCell: BottomCell = cell as! BottomCell
            
            bottomCell.viewModel = self.bookshopVM
            bottomCell.collectionView.reloadData()
            
            return
        }
        
        
        let myCell:BookShopCell = cell as! BookShopCell
        
        switch indexPath.section {
            
        case 0:
            
            myCell.titleLb.text = "量身打造"
            myCell.cellStyle = styleForCell.liangStyle
            
        case 1:
            
            myCell.titleLb.text = "新书推荐"
            myCell.cellStyle = styleForCell.xinStyle
        case 2:
            
            myCell.titleLb.text = "热门欣赏"
             myCell.cellStyle = styleForCell.hotStyle

        case 3:
        
            myCell.titleLb.text = "独家首发"
             myCell.cellStyle = styleForCell.duStyle

        default:
            
            return
            
            }
        
        myCell.bookShopVM = self.bookshopVM
        myCell.collectionView.reloadData()
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 20
    }
    
    
    
    
    
}


