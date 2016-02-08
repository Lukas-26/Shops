//
//  Rel+CoreDataProperties.swift
//  
//
//  Created by Lukáš Pechač on 06.02.16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Rel {

    @NSManaged var prize: NSNumber?
    @NSManaged var size: NSNumber?
    @NSManaged var rel_bottle: Bottle?
    @NSManaged var rel_shop: Shop?

}
