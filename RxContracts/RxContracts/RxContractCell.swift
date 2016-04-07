//
//  RxContractCell.swift
//  RxContracts
//
//  Created by RXL on 16/4/7.
//  Copyright © 2016年 RXL. All rights reserved.
//

import UIKit

class RxContractCell: UITableViewCell {

//    头像
    @IBOutlet weak var faceImage: UIImageView!
//    姓名
    @IBOutlet weak var nameLabel: UILabel!
//    电话号码
    @IBOutlet weak var phoneNumLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
