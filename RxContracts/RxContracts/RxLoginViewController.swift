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
private let RmbSwitch :String = "RmbSwitch"
private let autoLogin :String = "autoLogin"

class RxLoginViewController: UIViewController {
    
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
        
        //    当记住密码按钮关闭,自动登录按钮关闭
        if (!self.rmbPasswordSwitch.on) {

            self.autoLoginSwitch.setOn(false, animated: true)
        }
    }
    
    
    /**
     自动登录开关点击
     */
    @IBAction func autoLoginSwitchClick() {
     
        //    当自动登录按钮打开,记住密码开关打开
        if (self.autoLoginSwitch.on) {

            self.rmbPasswordSwitch.setOn(true, animated: true)
        }
        
    }
    
    
    /**
     登录按钮点击
     */
    @IBAction func LoginBtnClick() {
        
        view.endEditing(true)
        
        if accountTextFiled.text == RxAccount && passwordTextFiled.text == RxPassword {
            
            if accountTextFiled.text == RxAccount {
                
                MBProgressHUD .showMessage("正在登录")
                
                //            模仿延时登录
                let time: NSTimeInterval = 2.0
                let delay = dispatch_time(DISPATCH_TIME_NOW,
                                          Int64(time * Double(NSEC_PER_SEC)))
                dispatch_after(delay, dispatch_get_main_queue()) {
                    
                    MBProgressHUD.hideHUD()
                    
                    MBProgressHUD.showSuccess("登录成功")
                    
                    self.performSegueWithIdentifier("Login", sender: self.accountTextFiled.text)
                    
                    self.saveUserInfo()
        }
            }
 
        }else{
            
            MBProgressHUD .showError("账号或者密码错误")
            
        }
    }
    
    func saveUserInfo () {
        
        let defalut = NSUserDefaults.standardUserDefaults()
        
        defalut.setObject(accountTextFiled.text, forKey: RxAccount)
        defalut.setObject(passwordTextFiled.text, forKey: RxPassword)
        defalut.setBool(rmbPasswordSwitch.on, forKey: RmbSwitch)
        defalut.setBool(rmbPasswordSwitch.on, forKey: autoLogin)
        
    }
    
    func loadUserInfo () {
        
        let defalut = NSUserDefaults.standardUserDefaults()
        
        accountTextFiled.text = defalut.objectForKey(RxAccount) as? String
        passwordTextFiled.text = defalut.objectForKey(RxPassword) as? String
        rmbPasswordSwitch.on = defalut.boolForKey(RmbSwitch)
        autoLoginSwitch.on = defalut.boolForKey(autoLogin)
        
        if autoLoginSwitch.on {
            
            LoginBtnClick()
        }
        
        
    }
    
    
//    准备跳转的时候调用
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        segue.destinationViewController.title = String(format: "\(sender!)的联系人")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadUserInfo()
 
    }
    

}

