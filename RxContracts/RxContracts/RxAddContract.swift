//
//  RxAddContract.swift
//  RxContracts
//
//  Created by RXL on 16/4/7.
//  Copyright © 2016年 RXL. All rights reserved.
//

import UIKit

class RxAddContract: UIViewController {
//    保存按钮
    @IBOutlet weak var saveBtn: UIButton!
//    姓名输入框
    @IBOutlet weak var nameTextFiled: UITextField!
//    电话号码输入
    @IBOutlet weak var phoneNumTextFiled: UITextField!
//    传递模型的闭包
    var addContractModel : ((contract: RxContracts) -> ())?
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func saveContract() {
        
        if (nameTextFiled.text?.characters.count == 0 || phoneNumTextFiled.text?.characters.count == 0 )  {
            
            MBProgressHUD.showError("姓名和电话都不能为空")
            
            return
        }
        
        navigationController?.popViewControllerAnimated(true)
        
        let contractModel : RxContracts = RxContracts()
        contractModel.name = nameTextFiled.text
        contractModel.phone = phoneNumTextFiled.text
        
//        let faceNum = arc4random_uniform(8) + 1
        
        contractModel.faceImage = "G003"
        
        addContractModel!(contract: contractModel)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
