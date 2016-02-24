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

class SortimentController: UIViewController,CAPSPageMenuDelegate{
    var pageMenu : CAPSPageMenu?
    var bottles = [Rel]()
    override func viewDidLoad() {
        
        pageMenu!.delegate = self
        // Array to keep track of controllers in page menu
        var controllerArray : [BottlesTableView] = []
        
        // Create variables for all view controllers you want to put in the
        // page menu, initialize them, and add each to the controller array.
        // (Can be any UIViewController subclass)
        // Make sure the title property of all view controllers is set
        // Example:
        //for row in 0..<self.bottles....
        let controller : BottlesTableView = BottlesTableView(nibName: "controllerNibName", bundle: nil)
        controller.title = "->TITLE<-"
        controllerArray.append(controller)
        
        // Customize page menu to your liking (optional) or use default settings by sending nil for 'options' in the init
        // Example:
        let parameters: [CAPSPageMenuOption] = [
            .MenuItemSeparatorWidth(4.3),
            .UseMenuLikeSegmentedControl(true),
            .MenuItemSeparatorPercentageHeight(0.1)
        ]
        
        // Initialize page menu with controller array, frame, and optional parameters
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 0.0, self.view.frame.width, self.view.frame.height), pageMenuOptions: parameters)
        
        // Lastly add page menu as subview of base view controller view
        // or use pageMenu controller in you view hierachy as desired
        self.view.addSubview(pageMenu!.view)
    }
    func willMoveToPage(controller: UIViewController, index: Int){
    
    }
    
    func didMoveToPage(controller: UIViewController, index: Int){
    
    }
}