//
//  SpecialSubjectModel.swift
//  BookSwift
//
//  Created by tmp on 16/4/13.
//  Copyright © 2016年 hxy. All rights reserved.
//

import UIKit

class SpecialSubjectModel: NSObject {

    var bookprice: Double = 0

    var bookdiscountprice: Int = 0

    var bookid: Int = 0

    var bookauthor: String?

    var booktype: String?

    var bookimageurl: String?

    var bookpress: String?

    var bookpublicationyear: String?

    var bookpviews: Int = 0

    var bookcreattime: Int = 0

    var bookname: String?

    var bookupdatetime: Int = 0

    var bookinfoflag: String?

    var bookwordnumber: Int = 0

    var bookisbn: String?

    var bookpreface: String?

    //自己添加的给视图前面的线添加数据
    var hidenLine:Bool = true
    
}

