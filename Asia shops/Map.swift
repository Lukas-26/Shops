//
//  Map.swift
//  Asia shops
//
//  Created by Lukáš Pechač on 08.12.15.
//  Copyright © 2015 Lukáš Pechač. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import MapKit


class Map: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet var Open: UIBarButtonItem!
    weak var map : MKMapView!
    var addAnnotation : MKPointAnnotation?
    let manager = CLLocationManager()
    weak var topAddButton : UIBarButtonItem!
    weak var topCancelButton : UIBarButtonItem!
    
    override func viewDidLoad() {
        Open.target=self.revealViewController()
        Open.action=Selector("revealToggle:")
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view = UIView()
        let m = MKMapView()
        
        m.showsUserLocation=true
        m.userTrackingMode=MKUserTrackingMode.None
        m.mapType = MKMapType.Standard
        m.delegate = self
        self.view.addSubview(m)
        m.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(view)
        }
        map = m
        
        switch CLLocationManager.authorizationStatus() {
        case .NotDetermined:
            self.manager.requestWhenInUseAuthorization()
        default: print("Zjišťování polohy již bylo v minulosti autorizováno.")
        }
        self.manager.delegate = self
        self.manager.distanceFilter = kCLDistanceFilterNone
        self.manager.desiredAccuracy = kCLLocationAccuracyBest
        self.manager.startUpdatingLocation()
        
        
        let cb=UIBarButtonItem(barButtonSystemItem: .Stop, target: self, action: "cancelAdding:")
        self.topCancelButton=cb
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "addNew:")
    }
    
    func addNew(sender : UIBarButtonItem) {
        print("pridej novy obchod")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Trash, target: self, action: "cancelAdding:")

        if addAnnotation == nil {
            self.addAnnotation = MKPointAnnotation()
        }
        let loc : CLLocation=self.manager.location!
        addAnnotation?.coordinate = loc.coordinate
        addAnnotation?.title = "Nový obchod"
        map.addAnnotation(addAnnotation!)
    }
    func cancelAdding(sender : UIBarButtonItem) {
        print("zrus pridavani")
        
        self.map.removeAnnotation(addAnnotation!)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "addNew:")
    }
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        print (newLocation)
    }
    
    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let location = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation addAnnotation: MKAnnotation) -> MKAnnotationView? {
        
        if(addAnnotation is MKUserLocation) {
            return nil
        }
        var pin = mapView.dequeueReusableAnnotationViewWithIdentifier("myPin") as! MKPinAnnotationView?
        if (pin == nil) {
            pin = MKPinAnnotationView(annotation: addAnnotation, reuseIdentifier: "myPin")
        }
        
        pin?.animatesDrop = true
        pin?.draggable = true
        pin?.canShowCallout = true
        pin?.image = UIImage(named: "MapPin")
        
        pin?.rightCalloutAccessoryView = UIButton(type: .ContactAdd) as UIButton
        return pin;
    }
    
    //funkce stisknuti tlacitka v popisku pinu
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let ns=NewShopController()
        ns.coordinates=self.addAnnotation?.coordinate
        self.navigationController?.pushViewController(ns, animated: true)
        print("novy obchod")
    }
    //pozice pri presunuti pinu
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, didChangeDragState newState: MKAnnotationViewDragState, fromOldState oldState: MKAnnotationViewDragState) {
        if newState == MKAnnotationViewDragState.Ending {
            let droppedAt = view.annotation!.coordinate
            print("Pin dropped at \(droppedAt.latitude), \(droppedAt.longitude) ")
            let geo = CLGeocoder()
            let loc = CLLocation(latitude: droppedAt.latitude, longitude: droppedAt.longitude)
            geo.reverseGeocodeLocation(loc, completionHandler: { ( marks : [CLPlacemark]?, err: NSError?) -> Void in
                if let placemarks = marks {
                    let mark = placemarks.first!
                    self.title = mark.locality
                }
            })
        }
    }
    
    //funkce probihajici v dobe, kdy se LocationManager zmeni
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    }
    
    override func viewDidAppear(animated: Bool) {
    }
}