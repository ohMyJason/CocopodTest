//
//  CommentTableViewCell.swift
//  CocoapodTest
//
//  Created by Jason on 2020/1/4.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var contentLabel: UITextView!
    var comment:Comment?{
        didSet {
            
            userNameLabel.text = comment?.userName
            timeLabel.text = comment?.time
            contentLabel.text = comment?.content
            print("打印评论数据")
            print(userNameLabel.text)
        }
    }

}
