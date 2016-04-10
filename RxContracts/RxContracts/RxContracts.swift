//
//  RxContracts.swift
//  RxContracts
//
//  Created by RXL on 16/4/7.
//  Copyright © 2016年 RXL. All rights reserved.
//

import UIKit

class RxContracts: NSObject {

//    姓名
    var name: String?
//    电话号码
    var phone: String?
//    头像
    var faceImage: String?
    
//    /**
//     *  归档
//     */
//    - (void)encodeWithCoder:(NSCoder *)aCoder{
//    
//    [aCoder encodeObject:self.name forKey:@"name"];
//    [aCoder encodeObject:self.phoneNum forKey:@"phoneNum"];
//    }
    
    override init() {
        super.init()
    }
    init(coder aDecoder: NSCoder!)
    {
        super.init()
        self.name=aDecoder.decodeObjectForKey("name") as? String
        self.phone=aDecoder.decodeObjectForKey("phone") as? String
        self.faceImage = aDecoder.decodeObjectForKey("faceImage") as? String
    }
    
    
    func encodeWithCoder(aCoder: NSCoder!) {
        
        aCoder.encodeObject(self.name, forKey: "name")
        aCoder.encodeObject(self.phone, forKey: "phone")
        aCoder.encodeObject(self.faceImage, forKey: "faceImage")
    }
    
    
    
    
//      func encodeWithCoder(aCoder: NSCoder!) {
//        aCoder.encodeInteger(self.age, forKey: "age")
//        aCoder.encodeObject(self.name, forKey: "name")
//    }
//    class func save(user:User)->Bool{
//        return NSKeyedArchiver.archiveRootObject(user, toFile: path)
//    }
//     
//    class func user()->User?{
//      return  NSKeyedUnarchiver.unarchiveObjectWithFile(path) as? User
//    }
    
//    /**
//     *  解档
//     */
//    - (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
//    if (self=[super init]) {
//    
//    self.name=[aDecoder decodeObjectForKey:@"name"];
//    self.phoneNum=[aDecoder decodeObjectForKey:@"phoneNum"];
//    }
//    
//    
//    return self;
//    }
    
}