//
//  NewRelationController.swift
//  Asia shops
//
//  Created by Lukáš Pechač on 28.02.16.
//  Copyright © 2016 Lukáš Pechač. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import MagicalRecord
import ActionSheetPicker_3_0

class NewRelationController:UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.whiteColor()
        
    }
    
    func typePicker(sender: UIButton){
        let objectPicker = ActionSheetCustomPicker()
        
        objectPicker.showActionSheetPicker()
    }
}