//
//  Days+CoreDataProperties.swift
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

extension Days {

    @NSManaged var name: String?
    @NSManaged var shortcut: String?
    @NSManaged var days_opentime: NSSet?

}
