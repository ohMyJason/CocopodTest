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
    
    @IBAction func doLogin(_ sender: Any) {
        
        let parm = ["loginName":userName.text!,"password":password.text!]
        
        NetWorkRequest.sharedInstance.postRequest(UrlString:"userLogin/login" , paramer: parm, success: { (res) in
            let ifSuccess:String = res["code"].rawString()!
            print(ifSuccess)
            if(ifSuccess == "0"){
                print("登陆成功")
                print(res["data"]["token"].rawString()!)
                token! = res["data"]["token"].rawString()!
                self.performSegue(withIdentifier: "login", sender: self)
                
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

