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
    
    @IBOutlet weak var userPhotoImg: UIImageView!
    @IBOutlet weak var contentLabel: UITextView!
    @IBOutlet weak var dateLabel: UILabel!
    
    var blog:Blog?{
        didSet {
           
            
            //方法三： 异步加载网络图片
            //创建URL对象
            print("url")
            
            print(blog?.imgUrl!)
            let url = URL(string:(blog?.imgUrl)!)!
            if url != nil{
                //创建请求对象
                let request = URLRequest(url: url)
                
                let session = URLSession.shared
                let dataTask = session.dataTask(with: request, completionHandler: {
                    (data, response, error) -> Void in
                    if error != nil{
                        print(error.debugDescription)
                    }else{
                        //将图片数据赋予UIImage
                        let img = UIImage(data:data!)
                        
                        // 这里需要改UI，需要回到主线程
                        //                DispatchQueue.main.async {
                        self.userPhotoImg.image = img
                        //                }
                        
                    }
                }) as URLSessionTask
                
                //使用resume方法启动任务
                dataTask.resume()
            }
           
            
            userNameLabel.text = blog?.userName
            contentLabel.text = blog?.content
            dateLabel.text = blog?.date
            print("打印微博数据")
        }
    }
    
    
    
    

}
