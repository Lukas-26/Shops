//
//  NumberClickButton.swift
//  Asia shops
//
//  Created by Lukáš Pechač on 07.02.16.
//  Copyright © 2016 Lukáš Pechač. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class NumberClickButton: UIButton {
    var counter: Int=0
    var max:Int=0
    
    func setMaxClicked(maxClicked: Int){
        self.max=maxClicked
    }
    func Reset(){
        counter=0
    }
    func Click() -> Bool {
        if(counter>=self.max){
            return false;
        }
        self.counter+=1
        return true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}