//
//  About.swift
//  Asia shops
//
//  Created by Lukáš Pechač on 09.12.15.
//  Copyright © 2015 Lukáš Pechač. All rights reserved.
//

import Foundation
import UIKit

class About: UIViewController{
    
    weak var aboutView : AboutView!
    
    @IBOutlet var Open: UIBarButtonItem!
    
    override func loadView() {
        self.view=UIView()
        
        let av = AboutView(frame: CGRectZero)
        av.autoresizingMask = UIViewAutoresizing.FlexibleWidth;
        self.view.addSubview(av)
        self.aboutView = av
    }
    
    
    
    
}
