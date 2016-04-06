//
//  ViewController.swift
//  PocketContracts
//
//  Created by RXL on 16/4/6.
//  Copyright © 2016年 RXL. All rights reserved.
//

import UIKit


private let RxAccount : String = "rxl"
private let RxPassword : String = "123"

class ViewController: UIViewController {
    
    /// 密码文本输入框
    @IBOutlet weak var passwordTextFiled: UITextField!
    /// 账号文本输入框
    @IBOutlet weak var accountTextFiled: UITextField!
    /// 记住密码开关
    @IBOutlet weak var rmbPasswordSwitch: UISwitch!
    /// 自动登录开关
    @IBOutlet weak var autoLoginSwitch: UISwitch!
    /**
     记住密码开关点击
     */
    @IBAction func rmbPasswordSwitchClick() {
        
        
    }
    /**
     自动登录开关点击
     */
    @IBAction func autoLoginSwitchClick() {
        
    }
    /**
     登录按钮点击
     */
    @IBAction func LoginBtnClick() {
        
        if accountTextFiled.text != RxAccount && passwordTextFiled.text != RxPassword {
            
            
        }
        
        if accountTextFiled.text == RxAccount {
            
            self.performSegueWithIdentifier("Login", sender: nil)
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let title = accountTextFiled.text!
        
        segue.destinationViewController.title = String(format: "\(title)的联系人")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        accountTextFiled.text = "rxl"
        
        
    }

}

