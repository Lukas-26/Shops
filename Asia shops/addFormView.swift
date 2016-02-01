//
//  addFormView.swift
//  Asia shops
//
//  Created by Lukáš Pechač on 30.01.16.
//  Copyright © 2016 Lukáš Pechač. All rights reserved.
//

import Foundation
import SnapKit
import UIKit

class addFormView: UIView {
    weak var name:UILabel!
    weak var textName:UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let label=UILabel()
        label.text="Název:"
        let textNm=UITextField()
        textNm.placeholder="Název obchodu"
        textNm.layer.borderColor = UIColor.grayColor().CGColor
        textNm.layer.borderWidth = 1
        textNm.layer.cornerRadius = 5.0;
        
        addSubview(label)
        addSubview(textNm)
        
        self.textName=textNm
        self.name=label
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.name.frame = CGRectMake(10, 50, 60, 25)
        self.textName.frame = CGRectMake(10, 10, CGRectGetWidth(self.bounds)-20, 30)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}