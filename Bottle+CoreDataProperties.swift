//
//  Bottle+CoreDataProperties.swift
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

extension Bottle {

    @NSManaged var descript: String?
    @NSManaged var name: String?
    @NSManaged var vol: NSNumber?
    @NSManaged var bottle_alctype: Alcohol_type?
    @NSManaged var bottle_image: Bottle_image?
    @NSManaged var bottle_rel: NSSet?

}
