// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Shop.swift instead.

import CoreData

public enum ShopAttributes: String {
    case descript = "descript"
    case latitude = "latitude"
    case longitude = "longitude"
    case name = "name"
}

public enum ShopRelationships: String {
    case shop_image = "shop_image"
    case shop_opentime = "shop_opentime"
    case shop_rating = "shop_rating"
    case shop_rel = "shop_rel"
}

@objc public
class _Shop: NSManagedObject {

    // MARK: - Class methods

    public class func entityName () -> String {
        return "Shop"
    }

    public class func entity(managedObjectContext: NSManagedObjectContext!) -> NSEntityDescription! {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext);
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    public convenience init(managedObjectContext: NSManagedObjectContext!) {
        let entity = _Shop.entity(managedObjectContext)
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged public
    var descript: String?

    // func validateDescript(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var latitude: NSNumber?

    // func validateLatitude(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var longitude: NSNumber?

    // func validateLongitude(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var name: String?

    // func validateName(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    // MARK: - Relationships

    @NSManaged public
    var shop_image: NSSet

    @NSManaged public
    var shop_opentime: NSSet

    @NSManaged public
    var shop_rating: NSSet

    @NSManaged public
    var shop_rel: NSSet

}

extension _Shop {

    func addShop_image(objects: NSSet) {
        let mutable = self.shop_image.mutableCopy() as! NSMutableSet
        mutable.unionSet(objects as! Set<NSObject>)
        self.shop_image = mutable.copy() as! NSSet
    }

    func removeShop_image(objects: NSSet) {
        let mutable = self.shop_image.mutableCopy() as! NSMutableSet
        mutable.minusSet(objects as! Set<NSObject>)
        self.shop_image = mutable.copy() as! NSSet
    }

    func addShop_imageObject(value: Shop_image!) {
        let mutable = self.shop_image.mutableCopy() as! NSMutableSet
        mutable.addObject(value)
        self.shop_image = mutable.copy() as! NSSet
    }

    func removeShop_imageObject(value: Shop_image!) {
        let mutable = self.shop_image.mutableCopy() as! NSMutableSet
        mutable.removeObject(value)
        self.shop_image = mutable.copy() as! NSSet
    }

}

extension _Shop {

    func addShop_opentime(objects: NSSet) {
        let mutable = self.shop_opentime.mutableCopy() as! NSMutableSet
        mutable.unionSet(objects as! Set<NSObject>)
        self.shop_opentime = mutable.copy() as! NSSet
    }

    func removeShop_opentime(objects: NSSet) {
        let mutable = self.shop_opentime.mutableCopy() as! NSMutableSet
        mutable.minusSet(objects as! Set<NSObject>)
        self.shop_opentime = mutable.copy() as! NSSet
    }

    func addShop_opentimeObject(value: Open_time!) {
        let mutable = self.shop_opentime.mutableCopy() as! NSMutableSet
        mutable.addObject(value)
        self.shop_opentime = mutable.copy() as! NSSet
    }

    func removeShop_opentimeObject(value: Open_time!) {
        let mutable = self.shop_opentime.mutableCopy() as! NSMutableSet
        mutable.removeObject(value)
        self.shop_opentime = mutable.copy() as! NSSet
    }

}

extension _Shop {

    func addShop_rating(objects: NSSet) {
        let mutable = self.shop_rating.mutableCopy() as! NSMutableSet
        mutable.unionSet(objects as! Set<NSObject>)
        self.shop_rating = mutable.copy() as! NSSet
    }

    func removeShop_rating(objects: NSSet) {
        let mutable = self.shop_rating.mutableCopy() as! NSMutableSet
        mutable.minusSet(objects as! Set<NSObject>)
        self.shop_rating = mutable.copy() as! NSSet
    }

    func addShop_ratingObject(value: Rating!) {
        let mutable = self.shop_rating.mutableCopy() as! NSMutableSet
        mutable.addObject(value)
        self.shop_rating = mutable.copy() as! NSSet
    }

    func removeShop_ratingObject(value: Rating!) {
        let mutable = self.shop_rating.mutableCopy() as! NSMutableSet
        mutable.removeObject(value)
        self.shop_rating = mutable.copy() as! NSSet
    }

}

extension _Shop {

    func addShop_rel(objects: NSSet) {
        let mutable = self.shop_rel.mutableCopy() as! NSMutableSet
        mutable.unionSet(objects as! Set<NSObject>)
        self.shop_rel = mutable.copy() as! NSSet
    }

    func removeShop_rel(objects: NSSet) {
        let mutable = self.shop_rel.mutableCopy() as! NSMutableSet
        mutable.minusSet(objects as! Set<NSObject>)
        self.shop_rel = mutable.copy() as! NSSet
    }

    func addShop_relObject(value: Rel!) {
        let mutable = self.shop_rel.mutableCopy() as! NSMutableSet
        mutable.addObject(value)
        self.shop_rel = mutable.copy() as! NSSet
    }

    func removeShop_relObject(value: Rel!) {
        let mutable = self.shop_rel.mutableCopy() as! NSMutableSet
        mutable.removeObject(value)
        self.shop_rel = mutable.copy() as! NSSet
    }

}

