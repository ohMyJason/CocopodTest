//
//  BlogTableViewCell.swift/Users/jason/Desktop/CocoapodTest/CocoapodTest/Base.lproj/Main.storyboard
//  CocoapodTest
//
//  Created by Jason on 2020/1/3.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class BlogTableViewCell: UITableViewCell {

    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var contentLabel: UITextView!
    @IBOutlet weak var dateLabel: UILabel!
    
    var blog:Blog?{
        didSet {
            userNameLabel.text = blog?.userName
            contentLabel.text = blog?.content
            dateLabel.text = blog?.date
            print("打印微博数据")
        }
    }
    
    
    
    

}
