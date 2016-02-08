//
//  Shop+CoreDataProperties.swift
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

extension Shop {

    @NSManaged var descript: String?
    @NSManaged var latitude: NSNumber?
    @NSManaged var longitude: NSNumber?
    @NSManaged var name: String?
    @NSManaged var shop_image: NSSet?
    @NSManaged var shop_opentime: NSSet?
    @NSManaged var shop_rating: NSSet?
    @NSManaged var shop_rel: NSSet?

}
