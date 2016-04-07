//
//  RxContractsViewController.swift
//  PocketContracts
//
//  Created by RXL on 16/4/6.
//  Copyright © 2016年 RXL. All rights reserved.
//

import UIKit

class RxContractsViewController: UITableViewController {
    
    
    lazy var Contracts:[RxContracts] = []


    override func viewDidLoad() {
        super.viewDidLoad()

        let bgView = UIImageView(frame: view.bounds)
        bgView.image = UIImage(named: "bg1")
        
        tableView.backgroundView = bgView
        tableView.separatorStyle = .None
        
        let reloadClousure = {
            (contractArr:[RxContracts]) in
            self.Contracts += contractArr
            self.tableView.reloadData()
        }
        
        RxContracts.prepareData(reloadClousure)
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
        
        cell.contracts = contract
        
        cell.backgroundColor = UIColor.clearColor()
        cell.selectionStyle = .Blue
        
        return cell
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
    @IBAction func addContract(sender: AnyObject) {
        
        self.performSegueWithIdentifier("addContract", sender: nil)
        
    }
    
 
    

}
