///Users/jason/Desktop/CocoapodTest/CocoapodTest/Base.lproj/Main.storyboard
//  ViewController.swift
//  C/Users/jason/Desktop/CocoapodTest/CocoapodTest/ViewController.swiftocoapodTest
///Users/jason/Desktop/CocoapodTest/CocoapodTest/Base.lproj/Main.storyboard
//  Created by Jason on 2020/1/1./Users/jason/Desktop/CocoapodTest/CocoapodTest/ViewController.swift
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD
let userDef = UserDefaults.standard
class ViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var login: UIButton!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
//        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
//        appDelegate.setValue("test", forKey: "token")
//
//
//        let test =  appDelegate.value(forKey: "token")
        
       // print(test as! String)
        
        
        
        

    
        
        
       
    }
    
   
    @IBAction func jump(_ sender: Any) {
        let loginMsg = userDef.string(forKey: "token")
        if  loginMsg != "null" {
            
            token! = loginMsg!
            
            print("已经登陆，直接跳转")
            
            print(loginMsg!)
            self.performSegue(withIdentifier: "login", sender: self)
        }else{
            print("需要登陆")
            print(loginMsg!)
            CommentUtil().alert(controller: self, title: "提示", msg: "请登录")
        }
    }
    
    
    @IBAction func doLogin(_ sender: Any) {
        
        
        
        let parm = ["loginName":userName.text!,"password":password.text!]
  
        NetWorkRequest.sharedInstance.postRequest(UrlString:"userLogin/login" , paramer: parm, success: { (res) in
            let ifSuccess:String = res["code"].rawString()!
            print(ifSuccess)
            if(ifSuccess == "0"){
                print("登陆成功")
                print(res["data"]["token"].rawString()!)
                token! = res["data"]["token"].rawString()!
                userDef.set(token!, forKey: "token")
                self.performSegue(withIdentifier: "login", sender: self)
                print("登陆缓存为")
                print(userDef.string(forKey: "token") as! String as Any)
                
            }else{
                print("密码错误")
                let alertController:UIAlertController = UIAlertController(title: "错误", message: "账号或密码输入错误！", preferredStyle: UIAlertController.Style.alert)
                let cancelAction = UIAlertAction(title: "确定", style: .cancel)
                
                alertController.addAction(cancelAction)
                
                self.present(alertController,animated: true,completion: nil)
            }
        }) { (error) in
            
        }
        
//        if (userName.text! == "123" && password.text! == "123") {
//            self.performSegue(withIdentifier: "login", sender: self)
//        }else{
//            let alertController:UIAlertController = UIAlertController(title: "错误", message: "账号或密码输入错误！", preferredStyle: UIAlertController.Style.alert)
//            let cancelAction = UIAlertAction(title: "确定", style: .cancel)
//
//            alertController.addAction(cancelAction)
//
//            self.present(alertController,animated: true,completion: nil)
//        }
    }
    
    
    

}

