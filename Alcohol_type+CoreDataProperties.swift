//
//  Alcohol_type+CoreDataProperties.swift
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

extension Alcohol_type {

    @NSManaged var type: String?
    @NSManaged var alcoholtype_bottle: NSSet?

}
