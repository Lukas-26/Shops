//
//  Map.swift
//  Asia shops
//
//  Created by Lukáš Pechač on 08.12.15.
//  Copyright © 2015 Lukáš Pechač. All rights reserved.
//

import Foundation

class Map: UIViewController {

    @IBOutlet var Open: UIBarButtonItem!
    override func viewDidLoad() {
        Open.target=self.revealViewController()
        Open.action=Selector("revealToggle:")
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }


}