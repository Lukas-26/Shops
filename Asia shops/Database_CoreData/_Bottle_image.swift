// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Bottle_image.swift instead.

import CoreData

public enum Bottle_imageAttributes: String {
    case image_name = "image_name"
}

public enum Bottle_imageRelationships: String {
    case bottleimage_bottle = "bottleimage_bottle"
}

@objc public
class _Bottle_image: NSManagedObject {

    // MARK: - Class methods

    public class func entityName () -> String {
        return "Bottle_image"
    }

    public class func entity(managedObjectContext: NSManagedObjectContext!) -> NSEntityDescription! {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext);
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    public convenience init(managedObjectContext: NSManagedObjectContext!) {
        let entity = _Bottle_image.entity(managedObjectContext)
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged public
    var image_name: String?

    // func validateImage_name(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    // MARK: - Relationships

    @NSManaged public
    var bottleimage_bottle: NSSet

}

extension _Bottle_image {

    func addBottleimage_bottle(objects: NSSet) {
        let mutable = self.bottleimage_bottle.mutableCopy() as! NSMutableSet
        mutable.unionSet(objects as Set<NSObject>)
        self.bottleimage_bottle = mutable.copy() as! NSSet
    }

    func removeBottleimage_bottle(objects: NSSet) {
        let mutable = self.bottleimage_bottle.mutableCopy() as! NSMutableSet
        mutable.minusSet(objects as Set<NSObject>)
        self.bottleimage_bottle = mutable.copy() as! NSSet
    }

    func addBottleimage_bottleObject(value: Bottle!) {
        let mutable = self.bottleimage_bottle.mutableCopy() as! NSMutableSet
        mutable.addObject(value)
        self.bottleimage_bottle = mutable.copy() as! NSSet
    }

    func removeBottleimage_bottleObject(value: Bottle!) {
        let mutable = self.bottleimage_bottle.mutableCopy() as! NSMutableSet
        mutable.removeObject(value)
        self.bottleimage_bottle = mutable.copy() as! NSSet
    }

}

