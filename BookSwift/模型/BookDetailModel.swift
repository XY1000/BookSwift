//
//  BookDetailModel.swift
//  BookSwift
//
//  Created by tmp on 16/4/13.
//  Copyright © 2016年 hxy. All rights reserved.
//

import UIKit

class BookDetailModel: NSObject {

    
    var commentReplyList: [NSDictionary]?

    var bookCommentList: [NSDictionary]?

    var bookNameList: [NSDictionary]?

    var bookInfoList: [NSDictionary]?

    var userReadBookList: [NSDictionary]?

    var bookChaperList: [NSDictionary]?

    var commentPraiseList: [NSDictionary]?
    
}
class BookcommentlistModel: NSObject {

    var bookid: Int = 0

    var userid: Int = 0

    var bookcommentlocation: String?

    var bookcommentid: Int = 0

    var bookcommentcontent: String?

    var userName: String?

    var usePhotoUrl: String?

    var bookcommenttime: Int = 0

    var userId: String?

    var bookchaperid: Int = 0

}

class CommentReplylistModel: NSObject {

    var bookcommentid: Int = 0

    var countCommentReplys: Int = 0

    var userid: Int = 0

    var commentreplytime: Int = 0

    var commentreplyid: Int = 0

    var commentreplycontent: String?

}

class BooknamelistModel: NSObject {

    var bookprice: String?

    var bookdiscountprice: String?

    var bookid: Int = 0

    var bookauthor: String?

    var booktype: String?

    var bookimageurl: String?

    var bookpress: String?

    var bookpublicationyear: String?

    var bookpviews: String?

    var bookcreattime: String?

    var bookname: String?

    var bookupdatetime: String?

    var bookinfoflag: String?

    var bookwordnumber: String?

    var bookisbn: String?

    var bookpreface: String?

}

class BookinfolistModel: NSObject {

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

}

class UserReadbooklistModel: NSObject {

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

}

class BookchaperlistModel: NSObject {

    var bookid: Int = 0

    var bookchaptercontenturl: String?

    var bookchaptertitly: String?

    var bookchapterimageurl: String?

    var bookchapterid: Int = 0

    var bookchapterno: String?

    var bookchapterlock: Bool = false

}

class CommentpraiselistModel: NSObject {

    var bookcommentid: Int = 0

    var commentpraiseid: Int = 0

    var userid: Int = 0

    var commentpraisetime: Int = 0

    var countCommentPraise: Int = 0

}

