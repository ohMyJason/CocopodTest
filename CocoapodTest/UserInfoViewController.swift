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
    
    @IBOutlet weak var emailLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetWorkRequest.sharedInstance.postRequest(UrlString: "userInfo/getUserInfo", paramer: nil, success: {(res) in
            let ifSuccess:String = res["code"].rawString()!
            print(ifSuccess)
            if(ifSuccess == "0"){
                
                
                
                self.userNameLabel.text = res["data"]["userName"].rawString()
                self.phoneLabel.text = res["data"]["phone"].rawString()
                self.sexLabel.text = res["data"]["phone"].rawString()
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
