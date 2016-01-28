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
    var annotation : MKPointAnnotation?
    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        Open.target=self.revealViewController()
        Open.action=Selector("revealToggle:")
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        self.view = UIView()
        
        let m = MKMapView()
        m.showsUserLocation = true
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
        default: print("Mapa již dostala povoleni.")
        }
        
        
        self.manager.delegate = self
        self.manager.distanceFilter = kCLDistanceFilterNone
        self.manager.desiredAccuracy = kCLLocationAccuracyBest
        self.manager.startUpdatingLocation()
        
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "+", style: UIBarButtonItemStyle.Plain, target: self, action: "addNew:")
    }
    
    func addNew(sender : UIBarButtonItem) {
        print("pridej novy obchod")
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
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        if(annotation is MKUserLocation) {
            return nil
        }
        
        var pin = mapView.dequeueReusableAnnotationViewWithIdentifier("myPin") as! MKPinAnnotationView?
        
        if (pin == nil) {
            pin = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "myPin")
        }
        
        pin?.image = UIImage(named: "bageta")
        
        pin?.animatesDrop = true
        pin?.draggable = true
        pin?.canShowCallout = true
        pin?.leftCalloutAccessoryView = UISwitch()
        
        
        return pin;
    }
    
    
    
    
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        print("ahoj")
    }
    
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
    
    override func viewDidAppear(animated: Bool) {
        if annotation == nil {
            self.annotation = MKPointAnnotation()
        }
        annotation?.coordinate = self.map.centerCoordinate
        annotation?.title = "Drag me!"
        map.addAnnotation(annotation!)
    }

}