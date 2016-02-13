//
//  Open_time+CoreDataProperties.swift
//  
//
//  Created by Lukáš Pechač on 11.02.16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Open_time {

    @NSManaged var from: NSNumber?
    @NSManaged var nonstop: NSNumber?
    @NSManaged var to: NSNumber?
    @NSManaged var time_days: Days?
    @NSManaged var time_shop: Shop?

}
