//
//  ShopViewCell.swift
//  Asia shops
//
//  Created by Lukáš Pechač on 12.02.16.
//  Copyright © 2016 Lukáš Pechač. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import MagicalRecord
import CoreData

class ShopViewCell: UITableViewCell {
    
    weak var shop:Shop!
    var nameLabel=UILabel()
    var distance=UILabel()
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:)")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let name = UILabel()
        name.textColor = UIColor.blackColor()
        name.font = UIFont.boldSystemFontOfSize(18.0)
        self.contentView.addSubview(name)
        name.snp_makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.right.equalTo(20)
        }
        self.nameLabel=name
        self.selectionStyle=UITableViewCellSelectionStyle.None
        let backgroundView=UIImageView(frame: CGRectMake(0, 0, 15, 25))
        backgroundView.contentMode = .Right
        backgroundView.image=UIImage(named: "rightArrow")
        self.backgroundView=backgroundView
        let dist = UILabel()
        dist.textColor = UIColor.blackColor()
        self.contentView.addSubview(dist)
        dist.snp_makeConstraints { (make) in
            make.right.equalTo(20)
            make.left.equalTo(20)
            make.bottom.equalTo(-10)
        }
        self.distance=dist
    }
    
}
