// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Alcohol_type.swift instead.

import CoreData

public enum Alcohol_typeAttributes: String {
    case type = "type"
}

public enum Alcohol_typeRelationships: String {
    case alcoholtype_bottle = "alcoholtype_bottle"
}

@objc public
class _Alcohol_type: NSManagedObject {

    // MARK: - Class methods

    public class func entityName () -> String {
        return "Alcohol_type"
    }

    public class func entity(managedObjectContext: NSManagedObjectContext!) -> NSEntityDescription! {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext);
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    public convenience init(managedObjectContext: NSManagedObjectContext!) {
        let entity = _Alcohol_type.entity(managedObjectContext)
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged public
    var type: String?

    // func validateType(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    // MARK: - Relationships

    @NSManaged public
    var alcoholtype_bottle: NSSet

}

extension _Alcohol_type {

    func addAlcoholtype_bottle(objects: NSSet) {
        let mutable = self.alcoholtype_bottle.mutableCopy() as! NSMutableSet
        mutable.unionSet(objects as! Set<NSObject>)
        self.alcoholtype_bottle = mutable.copy() as! NSSet
    }

    func removeAlcoholtype_bottle(objects: NSSet) {
        let mutable = self.alcoholtype_bottle.mutableCopy() as! NSMutableSet
        mutable.minusSet(objects as! Set<NSObject>)
        self.alcoholtype_bottle = mutable.copy() as! NSSet
    }

    func addAlcoholtype_bottleObject(value: Bottle!) {
        let mutable = self.alcoholtype_bottle.mutableCopy() as! NSMutableSet
        mutable.addObject(value)
        self.alcoholtype_bottle = mutable.copy() as! NSSet
    }

    func removeAlcoholtype_bottleObject(value: Bottle!) {
        let mutable = self.alcoholtype_bottle.mutableCopy() as! NSMutableSet
        mutable.removeObject(value)
        self.alcoholtype_bottle = mutable.copy() as! NSSet
    }

}

