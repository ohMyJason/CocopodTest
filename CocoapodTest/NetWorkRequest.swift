//
//  NetWorkRequest.swift
//  CocoapodTest
//
//  Created by Jason on 2020/1/1.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
let BaseUrl = "http://192.168.43.121:8081/"

private let NetWorkRequestShareInstance = NetWorkRequest()

class NetWorkRequest{
    class var sharedInstance:NetWorkRequest {
        return NetWorkRequestShareInstance
    }
}

extension NetWorkRequest{
    func getRequest(UrlString:String,params:[String:Any]?,success:@escaping(_ response:[String:AnyObject])->(),failure:@escaping(_ error:Error)->()) {
        let PathUrl = BaseUrl+UrlString
        let headerss: HTTPHeaders = [
            "token":token!
        ]

        
        Alamofire.request(PathUrl, method: .get, parameters: params,headers: headerss).responseJSON { (response) in
            switch response.result{
            case .success(let value):
                //当响应成功是，使用临时变量value接受服务器返回的信息并判断是否为[String: AnyObject]类型 如果是那么将其传给其定义方法中的success
                if let value = response.result.value as? [String:AnyObject]{
                    
                    success(value)
                }
                let json = JSON(value)
                print(json)
                
            case .failure(let error):
                failure(error)
                print(error)
            }
            
        }
    }
    
    
    //paramer mark===post请求 =JSON
    func postRequest(UrlString:String,paramer:[String:Any]?,success:@escaping(_ response:JSON)->(),failure:@escaping(_ error:Error)->()){
        let PathUrl = BaseUrl+UrlString
        let headerss: HTTPHeaders = [
            "token":token!
        ]
        Alamofire.request(PathUrl, method: HTTPMethod.post, parameters: paramer,headers:headerss).responseJSON { (response) in
            switch response.result{
            case .success:
                if let value = response.result.value as? [String:AnyObject]{
                    let res = JSON(value)
                    success(res)
                }
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    //jsonPost请求
     func postJsonRequest(UrlString:String,paramer:[String:Any]?,success:@escaping(_ response:JSON)->(),failure:@escaping(_ error:Error)->()){

        let json = getJSONStringFromDictionary(dictionary: paramer! as NSDictionary)
        let url = URL(string: BaseUrl+UrlString)!
        let jsonData = json.data(using: .utf8, allowLossyConversion: false)!
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        request.setValue(token!, forHTTPHeaderField: "token")
        
        Alamofire.request(request).responseJSON {
            (response) in
            
            if response.result.isSuccess {
                let value = JSON(response.data!)

                success(value)
                
            } else {
                
                failure(response.result.error!)
            }
        }
    }
    
    ///上传图片
    
    func upLoadImageRequest(UrlString:String,params:[String:String],data:[Data],name:[String],success:@escaping(_ response:[String:AnyObject])->(),failure:@escaping(_ error:Error)->()){
        let headers = ["content-type":"multipart/form-data"]
        let PathUrl = BaseUrl+UrlString
        Alamofire.upload(multipartFormData: { (multipartforData) in
            let flag = params["flag"]
            let userId = params["userId"]
            multipartforData.append((flag?.data(using: String.Encoding.utf8))!, withName: "flag")
            multipartforData.append((userId?.data(using: String.Encoding.utf8))!, withName: "userId")
            for i in 0..<data.count{
                multipartforData.append(data[i], withName: "appPhoto", fileName: name[i], mimeType: "image/png")
            }
            
        }, to: PathUrl,
           headers: headers,
           encodingCompletion: { encodingResult in
            switch encodingResult {
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    if let value = response.result.value as? [String: AnyObject]{
                        success(value)
                        let json = JSON(value)
                        print(json)
                    }
                }
            case .failure(let encodingError):
                print(encodingError)
                
            }
        }
        )
    }
    
    
    // JSONString转换为字典
    
    func getDictionaryFromJSONString(jsonString:String) ->NSDictionary{
        
        let jsonData:Data = jsonString.data(using: .utf8)!
        
        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        if dict != nil {
            return dict as! NSDictionary
        }
        return NSDictionary()
        
        
    }
    
    
    func getArrayFromJSONString(jsonString:String) ->NSArray{
        
        let jsonData:Data = jsonString.data(using: .utf8)!
        
        let array = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        if array != nil {
            return array as! NSArray
        }
        return array as! NSArray
        
    }
    
    /**
     字典转换为JSONString
     
     - parameter dictionary: 字典参数
     
     - returns: JSONString
     */
    func getJSONStringFromDictionary(dictionary:NSDictionary) -> String {
        if (!JSONSerialization.isValidJSONObject(dictionary)) {
            print("无法解析出JSONString")
            return ""
        }
        let data : NSData! = try? JSONSerialization.data(withJSONObject: dictionary, options: []) as NSData
        let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
        return JSONString! as String
        
    }
    
    
    //数组转json
    func getJSONStringFromArray(array:NSArray) -> String {
        
        if (!JSONSerialization.isValidJSONObject(array)) {
            print("无法解析出JSONString")
            return ""
        }
        
        let data : NSData! = try? JSONSerialization.data(withJSONObject: array, options: []) as NSData
        let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
        return JSONString! as String
        
    }
    
}
