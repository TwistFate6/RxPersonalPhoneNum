//
//  RxContractsViewController.swift
//  PocketContracts
//
//  Created by RXL on 16/4/6.
//  Copyright © 2016年 RXL. All rights reserved.
//

import UIKit

class RxContractsViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    /**
     注销按钮
     */
    @IBAction func LoginOut(sender: AnyObject) {
        
        // Mark : 弹窗
        
        let alert = UIAlertController(title: "提示", message: "确定注销吗", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        
        let confirm = UIAlertAction(title: "确定", style: UIAlertActionStyle.Destructive) { (UIAlertAction) in
            
            self.navigationController!.popViewControllerAnimated(true)
        }
        
        let cancel = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
        
        
        alert.addAction(confirm)
        alert.addAction(cancel)
        
        
        self .presentViewController(alert, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    // Mark 和OC中的delloc方法一致
    
    deinit {
        
        print("联系人控制器delloc")
    }
    

}
