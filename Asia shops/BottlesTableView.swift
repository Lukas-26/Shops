//
//  BottlesTableView.swift
//  Asia shops
//
//  Created by Lukáš Pechač on 19.02.16.
//  Copyright © 2016 Lukáš Pechač. All rights reserved.
//

import Foundation
import UIKit

class BottlesTableView: UITableViewController {
    
    var bottles = [Rel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        print("bottlestableviewdidload")
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.bottles.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = BottleCell(style: UITableViewCellStyle.Default, reuseIdentifier: "BottleCell")
        cell.bottle=self.bottles[indexPath.row]
        cell.nameLabel.text=self.bottles[indexPath.row].rel_bottle!.name
        cell.prizeLabel.text="\(self.bottles[indexPath.row].prize!),-"
        return cell
    }
}