//
//  SortimentController.swift
//  Asia shops
//
//  Created by Lukáš Pechač on 19.02.16.
//  Copyright © 2016 Lukáš Pechač. All rights reserved.
//

import Foundation
import SnapKit
import PageMenu
import UIKit

let color=UIColor(colorLiteralRed: 0.235, green: 0.38, blue: 0.847, alpha: 1)

class SortimentController: UIViewController{
    var pageMenu : CAPSPageMenu?
    var alctypes : [Alcohol_type]!
    var bottles : [Rel]?
    var shop : Shop?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor=color
        self.navigationController?.navigationBar.backgroundColor=color
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "bottleAdd:")
        if(alctypes.count<=0){
            return
        }
        var controllerArray : [BottlesTableView] = []
        
        for row in 0..<self.alctypes!.count{
            let controller1 : BottlesTableView = BottlesTableView()
            controller1.view.backgroundColor = UIColor.whiteColor()
            controller1.title = alctypes![row].type
            var currentRel=[Rel]()
            for row2 in 0..<bottles!.count{
                if(bottles![row2].rel_bottle?.bottle_alctype==alctypes![row]){
                    currentRel.append(bottles![row2])
                }
            }
            controller1.bottles=currentRel
            controllerArray.append(controller1)
        }
        let parameters: [CAPSPageMenuOption] = [
            .MenuItemSeparatorWidth(0),
            .MenuItemSeparatorPercentageHeight(0),
            .UseMenuLikeSegmentedControl(false),
            .MenuHeight(50),
            .ScrollMenuBackgroundColor(color),
            .BottomMenuHairlineColor(color)
        ]
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 0.0, self.view.frame.width, self.view.frame.height), pageMenuOptions: parameters)
        self.view.addSubview(pageMenu!.view)
    }
    func bottleAdd(target: UIBarButtonItem){
        print("nova flaska")
    }
}