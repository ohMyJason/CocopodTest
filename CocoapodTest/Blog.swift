//
//  Blog.swift
//  CocoapodTest
//
//  Created by Jason on 2020/1/3.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class Blog: NSObject {
    
    var userName: String?
    var content: String?
    var date: String?
    var blogId: Int?
    var imgUrl: String?
    
    init(userName:String,content:String,date:String,blogId:Int,imgUrl:String) {
        super.init()
        self.userName = userName
        self.content = content
        self.date = date
        self.blogId = blogId
        self.imgUrl = "http:\(imgUrl)"
    }
    
    override var description: String{
        let keys = ["userName","content","date"]
        
        return "\(keys[0]):\(String(describing: userName))"
        
    }
    
}
