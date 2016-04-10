//
//  RxContractsViewController.swift
//  PocketContracts
//
//  Created by RXL on 16/4/6.
//  Copyright © 2016年 RXL. All rights reserved.
//

import UIKit

var test = NSMutableArray()


class RxContractsViewController: UITableViewController {
    
    lazy var Contracts : NSMutableArray = {
        
        var Contracts = NSKeyedUnarchiver.unarchiveObjectWithFile(DataPath) as? NSMutableArray
        
        if Contracts == nil {
            Contracts = NSMutableArray()
        }
        
        return Contracts!
    }()
    

    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let bgView = UIImageView(frame: view.bounds)
        bgView.image = UIImage(named: "bg1")
        
        tableView.backgroundView = bgView
        tableView.separatorStyle = .None
        
        

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


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Contracts.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! RxContractCell
        let contract = Contracts[indexPath.row]
        
        cell.contracts = contract as? RxContracts
        
        cell.backgroundColor = UIColor.clearColor()
        cell.selectionStyle = .Blue
        
        return cell
        
    }
//    MARK : - 实现cell的删除
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
//        将对应的模型从数组中删除
        Contracts.removeObjectAtIndex(indexPath.row)
//        删除指定行
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
//        将数组重新写入本地
        NSKeyedArchiver.archiveRootObject(Contracts, toFile: DataPath)
    }
    
//    MARK : - 修改删除按钮的名称
    override func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        return "删除"
    }
    
    
//    cell的点击
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        
        self.performSegueWithIdentifier("callPhone", sender: nil)

        
    }
    
    
    @IBAction func addContract(sender: AnyObject) {
        
        self.performSegueWithIdentifier("addContract", sender: nil)
        
    }
    
// 准备跳转的时候进行调用
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        目标控制器
        let destVC = segue.destinationViewController
        
        
//        进行判断跳转的是哪一个控制器
        if destVC.isKindOfClass(RxAddContract) {
            
            let addVC = destVC as! RxAddContract
            
            addVC.addContractModel = {
                
            (contract: RxContracts)  in
                
                self.Contracts.addObject(contract)
//                将数组保存到本地
                NSKeyedArchiver.archiveRootObject(self.Contracts, toFile: DataPath)
                
                self.tableView.reloadData()
            
            }
        }
    }
    

}

