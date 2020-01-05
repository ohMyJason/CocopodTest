//
//  RegisterViewController.swift
//  CocoapodTest
//
//  Created by Jason on 2020/1/6.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var codeText: UITextField!
    var code :String?
    var baseEmail :String?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func sentCode(_ sender: Any) {
        if emailText.text == nil || emailText.text == ""{
            CommentUtil().alert(controller: self, title: "警告", msg: "请输入邮箱")
        }else{
            let param = ["email":emailText.text!]
            NetWorkRequest.sharedInstance.postRequest(UrlString:"userLogin/sendEmailCode" , paramer: param, success: { (res) in
                let ifSuccess:String = res["code"].rawString()!
                print(ifSuccess)
                if(ifSuccess == "0"){
                    print("发送验证码成功")
                    self.code = res["data"].rawString()!
                    //防止事后改密码
                    self.baseEmail = self.emailText.text!
                    CommentUtil().alert(controller: self, title: "提示", msg: "发送成功，请查收邮箱")
                    print(self.code!)
                    
                    
                }else{
                    CommentUtil().alert(controller: self, title: "提示", msg: "发送失败，错误\(res["msg"].rawString()!)")
                    print(res["msg"].rawString()!)
                    
                }
            }) { (error) in
                print(error)
                
            }
        }
    }
    
    
    @IBAction func regist(_ sender: Any) {
        if self.emailText.text != self.baseEmail!{
            CommentUtil().alert(controller: self, title: "警告", msg: "邮箱和接收验证码的邮箱不一致")
        }else if self.code != self.codeText.text!{
            CommentUtil().alert(controller: self, title: "警告", msg: "验证码错误")
        }else if self.passwordText.text == nil || passwordText.text == ""{
            CommentUtil().alert(controller: self, title: "警告", msg: "请输入密码")
        }
        else{
            let param = ["email":self.emailText.text!,"password":self.passwordText.text!]
            NetWorkRequest.sharedInstance.postRequest(UrlString:"userLogin/registeredByEmail" , paramer: param, success: { (res) in
                let ifSuccess:String = res["code"].rawString()!
                print(ifSuccess)
                if(ifSuccess == "0"){
                    print("注册成功")
                    self.performSegue(withIdentifier: "tologin", sender: self)
                    CommentUtil().alert(controller: self, title: "提示", msg: "注册成功，返回登陆")
                    
                    
                    
                }else{
                    CommentUtil().alert(controller: self, title: "提示", msg: "注册失败，错误\(res["msg"].rawString()!)")
                    print(res["msg"].rawString()!)
                    
                }
            }) { (error) in
                print(error)
                
            }
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
