//
//  File.swift
//  Asia shops
//
//  Created by Lukáš Pechač on 15.02.16.
//  Copyright © 2016 Lukáš Pechač. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class AddDayTimeView:UIView {
    
    weak var Day:UILabel?
    weak var FromTimeLabel:UILabel?
    weak var ToTimeLabel:UILabel?
    weak var AddFromTime:UIButton?
    weak var AddToTime:UIButton?
    weak var DeleteDay:ButtonWithNSObject?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(patternImage: UIImage(named: "timeBackground")!)
        
        let timeFrom=UILabel()
        timeFrom.font = timeFrom.font.fontWithSize(14)
        timeFrom.text="--:--"
        self.addSubview(timeFrom)
        timeFrom.snp_makeConstraints { (make) in
            make.top.equalTo(42)
            make.right.equalTo(-35)
        }
        let odLabel=UILabel()
        odLabel.text="Od:"
        odLabel.font = odLabel.font.fontWithSize(14)
        self.addSubview(odLabel)
        odLabel.snp_makeConstraints { (make) in
            make.top.equalTo(42)
            make.left.equalTo(3)
        }
        
        let timeTo=UILabel()
        timeTo.text="--:--"
        timeTo.font = timeTo.font.fontWithSize(14)
        self.addSubview(timeTo)
        timeTo.snp_makeConstraints { (make) in
            make.top.equalTo(77)
            make.right.equalTo(-35)
        }
        
        let doLabel=UILabel()
        doLabel.font = doLabel.font.fontWithSize(14)
        doLabel.text="Do:"
        self.addSubview(doLabel)
        doLabel.snp_makeConstraints { (make) in
            make.top.equalTo(77)
            make.left.equalTo(3)
        }
        
        let dayName=UILabel()
        dayName.textAlignment = .Center;
        self.addSubview(dayName)
        dayName.snp_makeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(10)
            make.width.equalTo(self.snp_width)
        }
        
        let addFrom=UIButton()
        addFrom.setImage(UIImage(named: "addIcon"), forState: .Normal)
        addFrom.imageView?.contentMode = UIViewContentMode.Center
        self.addSubview(addFrom)
        addFrom.snp_makeConstraints { (make) in
            make.top.equalTo(36)
            make.right.equalTo(0)
            make.height.width.equalTo(30)
        }
        
        let addTo=UIButton()
        addTo.setImage(UIImage(named: "addIcon"), forState: .Normal)
        addTo.imageView?.contentMode = UIViewContentMode.Center
        self.addSubview(addTo)
        addTo.snp_makeConstraints { (make) in
            make.top.equalTo(71)
            make.right.equalTo(0)
            make.height.width.equalTo(30)
        }
        
        let deleteDay=ButtonWithNSObject()
        deleteDay.setImage(UIImage(named: "trash"), forState: .Normal)
        deleteDay.imageView?.contentMode = UIViewContentMode.Center;
        self.addSubview(deleteDay)
        deleteDay.snp_makeConstraints { (make) in
            make.left.right.bottom.equalTo(0)
            make.height.equalTo(20)
        }
        
        self.Day=dayName
        self.FromTimeLabel=timeFrom
        self.ToTimeLabel=timeTo
        self.AddFromTime=addFrom
        self.AddToTime=addTo
        self.DeleteDay=deleteDay
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}