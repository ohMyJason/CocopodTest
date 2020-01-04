//
//  DetailViewController.swift
//  CocoapodTest
//
//  Created by Jason on 2020/1/4.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    
    var blog: Blog?
    
    @IBOutlet weak var contenLabel: UITextView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var CommentTable: UITableView!
    
    @IBOutlet weak var commentContentLabel: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        contenLabel.text = blog?.content
        userNameLabel.text = blog?.userName
        dateLabel.text = blog?.date
        // Do any additional setup after loading the view.
    }
    @IBAction func sentComment(_ sender: Any) {
        //todo 如何才能String any 不保警告呢
        let parm = ["blogId":blog?.blogId as! Int,"commentContent": commentContentLabel.text!] as [String : Any]
        
        NetWorkRequest.sharedInstance.postRequest(UrlString:"blog/insertComment" , paramer: parm, success: { (res) in
            print(res)
            let ifSuccess:String = res["code"].rawString()!
            print(ifSuccess)
            if(ifSuccess == "0"){
                print("评论成功")
                CommentUtil().alert(controller: self, title: "提示", msg: "评论成功")
                self.commentContentLabel.text = ""
               
            }else{
                print("评论失败")
                CommentUtil().alert(controller: self, title: "提示", msg: "评论失败")
            }
        }) { (error) in
            
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
