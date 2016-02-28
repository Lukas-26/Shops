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
    
    
    weak var bottle:Rel!
    var nameLabel=UILabel()
    var prizeLabel=UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle=UITableViewCellSelectionStyle.Default
        self.backgroundColor=UIColor.whiteColor()
        
        let name = UILabel()
        name.font = UIFont.boldSystemFontOfSize(20.0)
        name.textColor = UIColor.blackColor()
        self.contentView.addSubview(name)
        name.snp_makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.right.equalTo(20)
        }
        self.nameLabel=name
        let backgroundView=UIImageView(frame: CGRectMake(0, 0, 15, 25))
        backgroundView.contentMode = .Right
        backgroundView.image=UIImage(named: "rightArrow")
        self.backgroundView=backgroundView
        let prize = UILabel()
        prize.textColor = UIColor.blackColor()
        self.contentView.addSubview(prize)
        prize.snp_makeConstraints { (make) in
            make.right.equalTo(20)
            make.left.equalTo(20)
            make.bottom.equalTo(-10)
        }
        self.prizeLabel=prize
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:)")
    }
}