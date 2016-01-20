//
//  AboutView.swift
//  Asia shops
//
//  Created by Lukáš Pechač on 15.12.15.
//  Copyright © 2015 Lukáš Pechač. All rights reserved.
//

import Foundation
import UIKit

class AboutView: UIView {
    
    weak var contactButton: UIButton!
    
    var delegate : AboutViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let myButton = UIButton()
        myButton.setTitle("Kontaktujte mě", forState: .Normal)
        myButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        myButton.backgroundColor=UIColor(colorLiteralRed: 0.235, green: 0.38, blue: 0.847, alpha: 1)
        myButton.addTarget(self, action: "contactButt", forControlEvents: .TouchUpInside)
        
        
        
        self.addSubview(myButton)
        
        self.contactButton=myButton
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        contactButton.frame = CGRectMake(15, CGRectGetHeight(self.bounds)-65, CGRectGetWidth(self.bounds)-30, 50)
    }
    
    func contactButt() {
        delegate?.showAlert()
        print("Contact button pressed")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
protocol AboutViewDelegate {
    
    func showAlert()
}