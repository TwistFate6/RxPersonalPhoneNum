//
//  RxContracts.swift
//  RxContracts
//
//  Created by RXL on 16/4/7.
//  Copyright © 2016年 RXL. All rights reserved.
//

import UIKit

class RxContracts: NSObject {

    var name: String?
    var phone: String?
    var faceImage: String?
    
    
    init(dict:[String:String]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
}
    //这个地方必须调用 super
    override func setValue(value: AnyObject?, forKey key: String) {
        super.setValue(value, forKey: key)
    }
    
    //这个地方不能调用 super
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        //做异常处理
    }
    class func prepareData (callback: ([RxContracts]) -> ()) {
        dispatch_async(dispatch_get_global_queue(0, 0)) { () -> Void in
            let array1:[[String: String]] = [["name":"xiaowang", "phone":"1234567","faceImage":"G001"],["name":"xiaowang", "phone":"1234567","faceImage":"G002"]]
            
            var personArray:[RxContracts] = []
            
            for item in array1 {
                let person = RxContracts(dict: item)
                personArray.append(person)
            }
            
            dispatch_sync(dispatch_get_main_queue(), { () -> Void in
                callback(personArray)
            })
        }
    }
}