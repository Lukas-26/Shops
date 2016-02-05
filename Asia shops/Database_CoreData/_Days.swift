// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Days.swift instead.

import CoreData

public enum DaysAttributes: String {
    case name = "name"
}

public enum DaysRelationships: String {
    case days_opentime = "days_opentime"
}

@objc public
class _Days: NSManagedObject {

    // MARK: - Class methods

    public class func entityName () -> String {
        return "Days"
    }

    public class func entity(managedObjectContext: NSManagedObjectContext!) -> NSEntityDescription! {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext);
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    public convenience init(managedObjectContext: NSManagedObjectContext!) {
        let entity = _Days.entity(managedObjectContext)
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged public
    var name: String?

    // func validateName(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    // MARK: - Relationships

    @NSManaged public
    var days_opentime: NSSet

}

extension _Days {

    func addDays_opentime(objects: NSSet) {
        let mutable = self.days_opentime.mutableCopy() as! NSMutableSet
        mutable.unionSet(objects as Set<NSObject>)
        self.days_opentime = mutable.copy() as! NSSet
    }

    func removeDays_opentime(objects: NSSet) {
        let mutable = self.days_opentime.mutableCopy() as! NSMutableSet
        mutable.minusSet(objects as Set<NSObject>)
        self.days_opentime = mutable.copy() as! NSSet
    }

    func addDays_opentimeObject(value: Open_time!) {
        let mutable = self.days_opentime.mutableCopy() as! NSMutableSet
        mutable.addObject(value)
        self.days_opentime = mutable.copy() as! NSSet
    }

    func removeDays_opentimeObject(value: Open_time!) {
        let mutable = self.days_opentime.mutableCopy() as! NSMutableSet
        mutable.removeObject(value)
        self.days_opentime = mutable.copy() as! NSSet
    }

}

