//
//  NetworkTools.swift
//  
//
//  Created by 谢臣 on 2020/10/13.
//
//Mark:网络工具
import UIKit
import AFNetworking
//请求方法枚举
enum AFNRequestMethod:String{
    case GET = "GET"
    case POST = "POST"
}
class NetworkTools: AFHTTPSessionManager {

    //单例
    static let sharedTools:NetworkTools = {
        let tools = NetworkTools(baseURL:nil)
        //设置反序列化数据格式 -系统会将系统中的NSSet转换成Set
        tools.responseSerializer.acceptableContentTypes?.insert("text/html")
        return tools
    }()
    
    
    
}
//封装AFN网络方法
extension NetworkTools{
    func request(method:AFNRequestMethod,URLString:String,parameters:[String: AnyObject]?,headers:[String:String]? , finished: @escaping(_ result:Any?,_ error:Error?)->()){
        //定义成功回调函数格式
        let success = {(task: URLSessionDataTask,result: Any?) in
            finished(result,nil)
        }
        //定义失败回调函数格式
        let failure = {(task: URLSessionDataTask?,error:Error) in
            finished(nil,error)
        }
       
        
        if method == AFNRequestMethod.GET{
            get(URLString, parameters: parameters, headers: headers, progress: { (Progress
                ) in
            }, success: success, failure: failure)
        }else{
            
            post(URLString, parameters: parameters, headers: headers, progress: { (Progress
                ) in
            }, success: success, failure: failure)
            
        }
        
    }
    
    
}
