//
//  SentViewController.swift
//  CocoapodTest
//
//  Created by Jason on 2020/1/3.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit
import SwiftyJSON

class SentViewController: UIViewController {
    
    
    @IBOutlet weak var blogContentLabel: UITextField!
    
    
    @IBAction func insert(_ sender: Any) {
    
        var jsonData = JSON()
        jsonData["blog"] = JSON()
        jsonData["blog"]["content"].string = blogContentLabel.text!
        jsonData["blog"]["circleId"].string = "40"
        jsonData["itemIds"] = []
        
        
        let param = jsonData.dictionaryObject;        NetWorkRequest.sharedInstance.postJsonRequest(UrlString:"blog/insertBlog" , paramer: param, success: { (res) in
            print(res)
            CommentUtil().alert(controller:self,title: "您好",msg:"发送成功")
        }) { (error) in
            print(error)
        }
    }
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
