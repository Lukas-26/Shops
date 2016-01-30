//
//  NewShopController.swift
//  Asia shops
//
//  Created by Lukáš Pechač on 29.01.16.
//  Copyright © 2016 Lukáš Pechač. All rights reserved.
//

import UIKit
import SnapKit
import MapKit

class NewShopController: UIViewController,MKMapViewDelegate {
    
    var coordinates : CLLocationCoordinate2D?
    var shopAnnotation : MKPointAnnotation?
    weak var map : MKMapView!
    var mapcontroler = Map()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        let m = MKMapView()
        m.showsUserLocation=false
        m.mapType = MKMapType.Standard
        m.delegate = self
        self.view.addSubview(m)
        m.snp_makeConstraints { (make) -> Void in
            make.height.equalTo(self.view.snp_height).multipliedBy(0.4)
            make.width.equalTo(self.view.snp_width)
            make.bottomMargin.equalTo(0)
        }
        map = m
        
        let coord = coordinates
        let span = MKCoordinateSpanMake(0.004, 0.004)
        let region = MKCoordinateRegion(center: coord!, span: span)
        let pa = MKPointAnnotation()
        pa.coordinate = coordinates!
        self.shopAnnotation=pa
        
        map.setRegion(region, animated: false)
        map.addAnnotation(shopAnnotation!)
        
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation shopAnnotation: MKAnnotation) -> MKAnnotationView? {
        
        if(shopAnnotation is MKUserLocation) {
            return nil
        }
        var pin = mapView.dequeueReusableAnnotationViewWithIdentifier("myPin") as! MKPinAnnotationView?
        if (pin == nil) {
            pin = MKPinAnnotationView(annotation: shopAnnotation, reuseIdentifier: "myPin")
        }
        pin?.animatesDrop = false
        pin?.draggable = false
        pin?.canShowCallout = false

        return pin;
    }
    
    override func viewDidAppear(animated: Bool) {
    }
}