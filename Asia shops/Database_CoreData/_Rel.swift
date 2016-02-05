// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Rel.swift instead.

import CoreData

public enum RelAttributes: String {
    case prize = "prize"
    case size = "size"
}

public enum RelRelationships: String {
    case rel_bottle = "rel_bottle"
    case rel_shop = "rel_shop"
}

@objc public
class _Rel: NSManagedObject {

    // MARK: - Class methods

    public class func entityName () -> String {
        return "Rel"
    }

    public class func entity(managedObjectContext: NSManagedObjectContext!) -> NSEntityDescription! {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext);
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    public convenience init(managedObjectContext: NSManagedObjectContext!) {
        let entity = _Rel.entity(managedObjectContext)
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged public
    var prize: NSNumber?

    // func validatePrize(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var size: NSNumber?

    // func validateSize(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    // MARK: - Relationships

    @NSManaged public
    var rel_bottle: Bottle?

    // func validateRel_bottle(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var rel_shop: Shop?

    // func validateRel_shop(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

}

