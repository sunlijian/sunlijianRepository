//
//  NetWorkTools.swift
//  singBlog
//
//  Created by sunlijian on 15/10/8.
//  Copyright © 2015年 myCompany. All rights reserved.
//

import UIKit
import AFNetworking
private let APP_ROOT_URL = "https://api.weibo.com/"

class NetWorkTools: AFHTTPSessionManager {
    //声明属性
    let client_id = "1520523895"
    let redirect_uri = "http://www.baidu.com"
    
    let client_secret = "86a54789f611c92264b610cd671ee17e"
    //创建单例对象
    static let sharedTools: NetWorkTools = {
        let url = NSURL(string: APP_ROOT_URL)!
        let tools = NetWorkTools(baseURL: url)
        tools.responseSerializer.acceptableContentTypes?.insert("text/plain")
        return tools
    }()
    
    //设置请求url
    func oAuthURL() -> NSURL{
        let pageURL = "https://api.weibo.com/oauth2/authorize"
        //请求的 url
        let urlString = pageURL + "?client_id=" + client_id + "&redirect_uri=" + redirect_uri
        print(urlString)
        
        return  NSURL(string: urlString)!
    }
    
    
    
    
    //获取 acessToken
    func loadAccessToken(code: String){
        
        let urlString = "oauth2/access_token"
        let parameters = ["client_id":client_id,"client_secret":client_secret,"grant_type":"authorization_code","code":code,"redirect_uri":redirect_uri]
        POST(urlString, parameters: parameters, success: { (_ , result) -> Void in
            
            let account  = UserAccount(dict: result as! [String :AnyObject])
            print(account)
            
            }) { (_ , error) -> Void in
                
        }
    }
    
}
