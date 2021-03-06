//
//  UserInfoViewController.swift
//  CocoapodTest
//
//  Created by Jason on 2020/1/5.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    
    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        NetWorkRequest.sharedInstance.postRequest(UrlString: "userInfo/getUserInfo", paramer: nil, success: {(res) in
            let ifSuccess:String = res["code"].rawString()!
            print(ifSuccess)
            if(ifSuccess == "0"){
                
                // 同步加载网络图片
                let url = URL(string: "http:\(res["data"]["avatarUrl"].rawString()!)")
                // 从url上获取内容
                // 获取内容结束才进行下一步
                print("url")
                print(res["data"]["avatarUrl"].rawString()!)
                let data = try? Data(contentsOf: url!)
                
                if data != nil {
                    let image = UIImage(data: data!)
                    self.userPhoto.image = image
                }
                self.userPhoto.layer.cornerRadius = 10
                
                self.userNameLabel.text = res["data"]["userName"].rawString()
                self.phoneLabel.text = res["data"]["phone"].rawString()
                if res["data"]["sex"].rawString() == "0"{
                    self.sexLabel.text = "保密"
                }else if res["data"]["sex"].rawString() == "1"{
                    self.sexLabel.text = "男"
                }else if res["data"]["sex"].rawString() == "2"{
                    self.sexLabel.text = "女"
                }else{
                    self.sexLabel.text = "数据错误"
                }
                
                self.emailLabel.text = res["data"]["email"].rawString()
                print("个人信息获取成功")
            }else{
                print("-100 错误")
            }
            
        }) { (error) in
            print(error)
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func exitLogin(_ sender: Any) {
        token! = "null"
        userDef.set("null", forKey: "token")
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
