//
//  ShopAnnotation.swift
//  Asia shops
//
//  Created by Lukáš Pechač on 05.02.16.
//  Copyright © 2016 Lukáš Pechač. All rights reserved.
//

import UIKit
import SnapKit
import MapKit
import CoreData

class ShopAnnotation:MKPointAnnotation, NSCopying{
    var name:String = ""
    var rating: Double = 0.0
    static var color=UIColor.purpleColor()
    var shop:NSManagedObject?
    
    init(name:String,coord:CLLocationCoordinate2D,rating:Double,shop:NSManagedObject?=nil) {
        super.init()
        self.subtitle=String(rating)
        self.title=name
        self.coordinate.latitude=coord.latitude
        self.coordinate.longitude=coord.longitude
        self.shop=shop
    }
    func copyWithZone(zone: NSZone) -> AnyObject {
        let annotation=ShopAnnotation(name: self.name, coord: CLLocationCoordinate2DMake(self.coordinate.latitude, self.coordinate.longitude), rating: self.rating,shop: self.shop)
        return annotation
    }
}