//
//  Shop_image+CoreDataProperties.swift
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

extension Shop_image {

    @NSManaged var image_name: NSData?
    @NSManaged var shopimage_shop: Shop?

}
