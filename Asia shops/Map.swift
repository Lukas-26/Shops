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
import MagicalRecord

class Map: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet var Open: UIBarButtonItem!
    weak var map : MKMapView!
    var addAnnotation : MKPointAnnotation?=nil
    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        Open.target=self.revealViewController()
        Open.action=Selector("revealToggle:")
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view = UIView()
        
        let longPress = UILongPressGestureRecognizer(target: self, action: "longPressed:")
        
        switch CLLocationManager.authorizationStatus() {
        case .NotDetermined:
            self.manager.requestWhenInUseAuthorization()
        default: print("Zjišťování polohy již bylo v minulosti autorizováno.")
        }
        self.manager.delegate = self
        self.manager.distanceFilter = kCLDistanceFilterNone
        self.manager.desiredAccuracy = kCLLocationAccuracyBest
        self.manager.startUpdatingLocation()
        
        let m = MKMapView()
        m.showsUserLocation=true
        m.userTrackingMode=MKUserTrackingMode.None
        m.mapType = MKMapType.Standard
        m.delegate = self
        self.view.addSubview(m)
        m.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(view)
        }
        m.addGestureRecognizer(longPress)
        map = m
        
        if(CLLocationManager.authorizationStatus()==CLAuthorizationStatus.AuthorizedWhenInUse || CLLocationManager.authorizationStatus()==CLAuthorizationStatus.AuthorizedAlways){
            let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
            let location = CLLocationCoordinate2D(latitude: (manager.location?.coordinate.latitude)!, longitude: (manager.location?.coordinate.longitude)!)
            let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
            map.setRegion(region, animated: true)
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "topBarItemAdd:")
        }
        else{
            ShowDismisLocationAlert();
        }
        showShops()
    }
    
    func ShowDismisLocationAlert(){
        let message="Určování polohy není povoleno. Nebudete mít zpřístupněné některé funkce aplikace jako například určení vaší aktuální polohy. Pro změnu povolte určování polohy aplikace v Nastavení vašeho telefonu"
        let alert = UIAlertController(title: "Určování polohy není povoleno", message: message, preferredStyle: .Alert)
        let ok = UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in })
        alert.addAction(ok)
        presentViewController(alert, animated: true, completion: nil)
    }
    func longPressed(sender:UILongPressGestureRecognizer){
        if (sender.state != UIGestureRecognizerState.Began) {return}
        print("dlouhy stisk")
        let touchLocation = sender.locationInView(map)
        let locationCoordinate = map.convertPoint(touchLocation, toCoordinateFromView: map)
        addNew(locationCoordinate)
    }
    func topBarItemAdd(sender: UIBarButtonItem) {
        addNew(self.manager.location!.coordinate)
    }
    func topBarItemCancel(sender: UIBarButtonItem) {
        cancelAdding()
    }
    func addNew(coord: CLLocationCoordinate2D) {
        print("pridej novy obchod")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Trash, target: self, action: "topBarItemCancel:")
        if addAnnotation == nil {
            self.addAnnotation = MKPointAnnotation()
        }
        addAnnotation?.coordinate = coord
        addAnnotation?.title = "Nový obchod"
        map.addAnnotation(addAnnotation!)
    }
    func cancelAdding() {
        print("zrus pridavani")
        self.map.removeAnnotation(addAnnotation!)
        if(CLLocationManager.authorizationStatus()==CLAuthorizationStatus.AuthorizedWhenInUse || CLLocationManager.authorizationStatus()==CLAuthorizationStatus.AuthorizedAlways){
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "topBarItemAdd:")
        }
        else{
            self.navigationItem.rightBarButtonItem = nil
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        print (newLocation)
    }
    
    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
     
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation addAnnotation: MKAnnotation) -> MKAnnotationView? {
        
        if(addAnnotation is MKUserLocation) {
            return nil
        }
        var pin = mapView.dequeueReusableAnnotationViewWithIdentifier("shopPin") as! MKPinAnnotationView?
        if(addAnnotation.isKindOfClass(ShopAnnotation)){
            if(pin==nil){
                pin = MKPinAnnotationView(annotation: addAnnotation, reuseIdentifier: "shopPin")
                pin?.animatesDrop = false
                pin?.draggable = false
                pin?.canShowCallout = true
                pin?.pinTintColor=UIColor.purpleColor()
                pin?.leftCalloutAccessoryView = UIButton(type: .DetailDisclosure) as UIButton
            }
        }
        else{
            pin = mapView.dequeueReusableAnnotationViewWithIdentifier("myPin") as! MKPinAnnotationView?
            if (pin == nil) {
                pin = MKPinAnnotationView(annotation: addAnnotation, reuseIdentifier: "myPin")
                pin?.animatesDrop = true
                pin?.draggable = true
                pin?.canShowCallout = true
                pin?.rightCalloutAccessoryView = UIButton(type: .ContactAdd) as UIButton
            }
        }
        return pin;
    }
    
    //funkce stisknuti tlacitka v popisku pinu
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let ns=NewShopController()
        ns.coordinates=self.addAnnotation?.coordinate
        self.navigationItem.title="Mapa"
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
    
    func showShops(){
        let shops=Shop.MR_findAll()
        let nrRow=shops.count
        for row in 0..<nrRow{
            let data: NSManagedObject = shops[row] as! NSManagedObject
            
            let latNumb = (data.valueForKey("latitude") as? Double)!
            let longNumb = (data.valueForKey("longitude") as? Double)!
            let name = (data.valueForKey("name") as? String)!
            
            let shopAnnotation:ShopAnnotation=ShopAnnotation(name: name,coord: CLLocationCoordinate2DMake(latNumb,longNumb), rating: 1)
            
            self.map.addAnnotation(shopAnnotation)
        }
    }
    
    //funkce probihajici v dobe, kdy se LocationManager zmeni
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    }
    
    override func viewDidAppear(animated: Bool) {
    }
}