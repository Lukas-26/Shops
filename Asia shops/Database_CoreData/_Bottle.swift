// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Bottle.swift instead.

import CoreData

public enum BottleAttributes: String {
    case descript = "descript"
    case name = "name"
    case vol = "vol"
}

public enum BottleRelationships: String {
    case bottle_alctype = "bottle_alctype"
    case bottle_image = "bottle_image"
    case bottle_rel = "bottle_rel"
}

@objc public
class _Bottle: NSManagedObject {

    // MARK: - Class methods

    public class func entityName () -> String {
        return "Bottle"
    }

    public class func entity(managedObjectContext: NSManagedObjectContext!) -> NSEntityDescription! {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext);
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    public convenience init(managedObjectContext: NSManagedObjectContext!) {
        let entity = _Bottle.entity(managedObjectContext)
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged public
    var descript: String?

    // func validateDescript(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var name: String?

    // func validateName(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var vol: NSNumber?

    // func validateVol(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    // MARK: - Relationships

    @NSManaged public
    var bottle_alctype: Alcohol_type?

    // func validateBottle_alctype(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var bottle_image: Bottle_image?

    // func validateBottle_image(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var bottle_rel: NSSet

}

extension _Bottle {

    func addBottle_rel(objects: NSSet) {
        let mutable = self.bottle_rel.mutableCopy() as! NSMutableSet
        mutable.unionSet(objects as Set<NSObject>)
        self.bottle_rel = mutable.copy() as! NSSet
    }

    func removeBottle_rel(objects: NSSet) {
        let mutable = self.bottle_rel.mutableCopy() as! NSMutableSet
        mutable.minusSet(objects as Set<NSObject>)
        self.bottle_rel = mutable.copy() as! NSSet
    }

    func addBottle_relObject(value: Rel!) {
        let mutable = self.bottle_rel.mutableCopy() as! NSMutableSet
        mutable.addObject(value)
        self.bottle_rel = mutable.copy() as! NSSet
    }

    func removeBottle_relObject(value: Rel!) {
        let mutable = self.bottle_rel.mutableCopy() as! NSMutableSet
        mutable.removeObject(value)
        self.bottle_rel = mutable.copy() as! NSSet
    }

}

