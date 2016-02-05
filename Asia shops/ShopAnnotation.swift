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

class ShopAnnotation:MKPointAnnotation{
    var name:String = ""
    var rating: Double = 0.0
    static var color=UIColor.purpleColor()
    
    init(name:String,coord:CLLocationCoordinate2D,rating:Double) {
        super.init()
        self.subtitle=String(rating)
        self.title=name
        self.coordinate.latitude=coord.latitude
        self.coordinate.longitude=coord.longitude
    }
}