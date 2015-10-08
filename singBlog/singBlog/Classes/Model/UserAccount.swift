//
//  UserAccount.swift
//  singBlog
//
//  Created by sunlijian on 15/10/8.
//  Copyright © 2015年 myCompany. All rights reserved.
//
  ///字典转模型
import UIKit

class UserAccount: NSObject {
    
    //定义属性
    var access_token :String?
    var expires_in : NSTimeInterval = 0
    var uid : String?
    
    //实例化一个对象
    init(dict: [String: AnyObject]){
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    //过滤掉没有用到的字段
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
    
    override var description:String {
        let keys = ["access_token","expires_in","uid"]
        return "\(dictionaryWithValuesForKeys(keys))"
    }
    
}
