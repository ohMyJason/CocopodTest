//
//  MyNetworking.swift
//  CocoapodTest
//
//  Created by Jason on 2020/1/1.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit
import Alamofire

class MyNetworking: NSObject {
    var HTTPHeadersDic:Dictionary<String,String>?
    static let sharedNetworking = MyNetworking()
    class func requestGet(url:String,finishL:@escaping(Bool,Data)->Void){
        
    }
    
//    class func requestPost(url:String,param:Dictionary<String,String>,finish:@escaping(Bool,Data)->Void) {
//        let urlString = url.addingPercentEncoding(withAllowedCharacters: .utf8)
//        Alamofire.request(urlString!,method:.post,parameters:param,headers:self.sharedNetworking.HTTPHeadersDic).responseJSON{
//            (jsonData) in
//            if jsonData.data != nil{
//                finish(true,jsonData.data!)
//            }else{
//                finish(false,Data())
//            }
//        }å
//    }
}
