//
//  MenuVC.swift
//  Asia shops
//
//  Created by Lukáš Pechač on 09.12.15.
//  Copyright © 2015 Lukáš Pechač. All rights reserved.
//

import Foundation

class MenuVC: UITableViewController{
    var MenuArray = [String]()
    
    override func viewDidLoad() {
        MenuArray=["Mapa","Seznam","O Aplikaci"]
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return MenuArray.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(MenuArray[indexPath.row], forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel?.text=MenuArray[indexPath.row]
        return cell
    }
}