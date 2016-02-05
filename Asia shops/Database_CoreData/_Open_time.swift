// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Open_time.swift instead.

import CoreData

public enum Open_timeAttributes: String {
    case from = "from"
    case nonstop = "nonstop"
    case to = "to"
}

public enum Open_timeRelationships: String {
    case time_days = "time_days"
    case time_shop = "time_shop"
}

@objc public
class _Open_time: NSManagedObject {

    // MARK: - Class methods

    public class func entityName () -> String {
        return "Open_time"
    }

    public class func entity(managedObjectContext: NSManagedObjectContext!) -> NSEntityDescription! {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext);
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    public convenience init(managedObjectContext: NSManagedObjectContext!) {
        let entity = _Open_time.entity(managedObjectContext)
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged public
    var from: NSNumber?

    // func validateFrom(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var nonstop: NSNumber?

    // func validateNonstop(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var to: NSNumber?

    // func validateTo(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    // MARK: - Relationships

    @NSManaged public
    var time_days: Days?

    // func validateTime_days(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var time_shop: Shop?

    // func validateTime_shop(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

}

