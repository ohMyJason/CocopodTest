//
//  Comment.swift
//  CocoapodTest
//
//  Created by Jason on 2020/1/4.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class Comment: NSObject {
    var commentId :Int?
    var userName :String?
    var content :String?
    var time :String?
    
    init(commentId:Int,userName:String,content:String,time:String) {
        super.init()
        self.userName = userName
        self.content = content
        self.commentId = commentId
        self.time = time
    }
    override var description: String{
        let keys = ["content"]
        
        return "\(keys[0]):\(String(describing: content))"
        
    }
    
}
