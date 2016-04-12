//
//  BookShopModel.swift
//  BookSwift
//
//  Created by tmp on 16/4/11.
//  Copyright © 2016年 hxy. All rights reserved.
//

import Foundation


class BookShopModel: NSObject {

    
    var agoSpecialColumn: [NSDictionary]?

    var tailoredBook: [NSDictionary]?

    var hotBook: [NSDictionary]?

    var newGoodBook: [NSDictionary]?

    var aloneBook: [NSDictionary]?

    var newSpecialColumn: [NSDictionary]?
    
//     func mj_objectClassInArray() -> [NSObject : AnyObject]! {
//        
//        return ["agoSpecialColumn":AgospecialModel(),"tailoredBook":TailoredbookModel(),
//                "hotBook":HotbookModel(),"newGoodBook":NewgoodbookModel(),
//                "aloneBook":AlonebookModel(),"newSpecialColumn":NewspecialModel()
//        ]
//        
//    }
    
}
class AlonebookModel: NSObject {

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

class TailoredbookModel: NSObject {

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

class AgospecialModel: NSObject {

    var bookspeciallisttitlyurl: String?

    var bookspecialoriginalimageurl: String?

    var bookspecialcolumnthumbnailurl: String?

    var bookspecialcolumnid: Int = 0

    var bookspecialtitly: String?

    var bookspecialintroduction: String?

}

class NewspecialModel: NSObject {

    var bookspeciallisttitlyurl: String?

    var bookspecialoriginalimageurl: String?

    var bookspecialcolumnthumbnailurl: String?

    var bookspecialcolumnid: Int = 0

    var bookspecialtitly: String?

    var bookspecialintroduction: String?

}

class HotbookModel: NSObject {

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

class NewgoodbookModel: NSObject {

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

