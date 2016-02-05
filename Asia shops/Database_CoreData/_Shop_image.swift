// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Shop_image.swift instead.

import CoreData

public enum Shop_imageAttributes: String {
    case image_name = "image_name"
}

public enum Shop_imageRelationships: String {
    case shopimage_shop = "shopimage_shop"
}

@objc public
class _Shop_image: NSManagedObject {

    // MARK: - Class methods

    public class func entityName () -> String {
        return "Shop_image"
    }

    public class func entity(managedObjectContext: NSManagedObjectContext!) -> NSEntityDescription! {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext);
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    public convenience init(managedObjectContext: NSManagedObjectContext!) {
        let entity = _Shop_image.entity(managedObjectContext)
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged public
    var image_name: String?

    // func validateImage_name(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    // MARK: - Relationships

    @NSManaged public
    var shopimage_shop: Shop?

    // func validateShopimage_shop(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

}

