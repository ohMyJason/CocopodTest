//
//  CommentUtil.swift
//  CocoapodTest
//
//  Created by Jason on 2020/1/4.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class CommentUtil: NSObject {
    func setCookies(key:String,value:String){
        //创建一个HTTPCookie对象
        var props = Dictionary<HTTPCookiePropertyKey, Any>()
        props[HTTPCookiePropertyKey.name] = key
        props[HTTPCookiePropertyKey.value] = value
        props[HTTPCookiePropertyKey.path] = "/"
        props[HTTPCookiePropertyKey.domain] = "localhost"
        let cookie = HTTPCookie(properties: props)
        
        //通过setCookie方法把Cookie保存起来
        let cstorage = HTTPCookieStorage.shared
        cstorage.setCookie(cookie!)
    }
    
    
    //弹框
    func  alert(controller:UIViewController,title:String,msg:String){
        let alertController:UIAlertController = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        let cancelAction = UIAlertAction(title: "确定", style: .cancel)
        
        alertController.addAction(cancelAction)
        
        controller.present(alertController,animated: true,completion: nil)
    }
    
    
}
