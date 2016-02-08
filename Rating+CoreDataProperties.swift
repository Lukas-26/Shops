//
//  Rating+CoreDataProperties.swift
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

extension Rating {

    @NSManaged var date: NSDate?
    @NSManaged var star: NSNumber?
    @NSManaged var text: String?
    @NSManaged var rating_shop: Shop?

}
