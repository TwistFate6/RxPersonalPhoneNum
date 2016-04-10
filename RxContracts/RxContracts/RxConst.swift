//
//  RxConst.swift
//  RxContracts
//
//  Created by RXL on 16/4/9.
//  Copyright © 2016年 RXL. All rights reserved.
//

import UIKit


//    数据归档路径

//    此处遇到的坑,拼接字符串的时候,路径为or/Devices/3BBD174A-AD84-4A51-842B-D570E2BCEDBA/data/Containers/Data/Application/CB75B65F-C0D8-41F2-8BB0-FC553F233563/Documentsconttacts.data

//    但是在真机上无法运行,但是模拟器上可以运行

let DataPath = ((NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true ) as NSArray).lastObject! as! String) + "/conttacts.data"




