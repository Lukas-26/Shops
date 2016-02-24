//
//  BottleCell.swift
//  Asia shops
//
//  Created by Lukáš Pechač on 19.02.16.
//  Copyright © 2016 Lukáš Pechač. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import MagicalRecord
import CoreData

class BottleCell: UITableViewCell {
    
    weak var bottle:Bottle!
    var nameLabel=UILabel()
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:)")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let name = UILabel()
        name.textColor = UIColor.blackColor()
        self.contentView.addSubview(name)
        name.snp_makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.right.equalTo(20)
        }
        self.nameLabel=name
        self.selectionStyle=UITableViewCellSelectionStyle.None
    }
    
}