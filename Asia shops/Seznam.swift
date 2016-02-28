//
//  Seznam.swift
//  Asia shops
//
//  Created by Lukáš Pechač on 09.12.15.
//  Copyright © 2015 Lukáš Pechač. All rights reserved.
//

import UIKit
import SnapKit
import MagicalRecord
import MapKit
import Foundation

class Seznam: UIViewController,UITableViewDelegate,UITableViewDataSource,CLLocationManagerDelegate, NSFetchedResultsControllerDelegate {
    
    @IBOutlet var Open: UIBarButtonItem!
    var shops=[Shop]()
    let manager = CLLocationManager()
    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        Open.target=self.revealViewController()
        Open.action=Selector("revealToggle:")
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.navigationController?.navigationBar.translucent=false
        
        let tV = UITableView()
        tV.delegate = self
        tV.dataSource = self
        view.addSubview(tV)
        tV.snp_makeConstraints { (make) in
            make.top.left.bottom.right.equalTo(0)
        }
        self.tableView=tV
        
        switch CLLocationManager.authorizationStatus() {
        case .NotDetermined:
            self.manager.requestWhenInUseAuthorization()
        default: break
        }
        self.manager.delegate = self
        self.manager.distanceFilter = kCLDistanceFilterNone
        self.manager.desiredAccuracy = kCLLocationAccuracyBest
        self.manager.startUpdatingLocation()
        
        loadShops()
        shops.sortInPlace(sortByDistance)
    }
    func sortByDistance(this:Shop, that:Shop) -> Bool {
        let distance1=getDistanceTo((this.latitude)!.doubleValue, longitude: (this.longitude)!.doubleValue, manager: self.manager)
        let distance2=getDistanceTo((that.latitude)!.doubleValue, longitude: (that.longitude)!.doubleValue, manager: self.manager)
        if(distance1>distance2){
            return false
        }
        else{
            return true
        }
    }
    func loadShops() {
        let sh=Shop.MR_findAll()
        let nrRow=sh.count
        for row in 0..<nrRow{
            self.shops.append((sh[row] as! Shop))
        }
    }
    func getDistanceTo(latitude: Double, longitude: Double, manager:CLLocationManager) -> Int{
        let shopCoordinates=CLLocation(latitude: latitude,longitude: longitude)
        let distance=Double((manager.location?.distanceFromLocation(shopCoordinates))!)
        return Int(round(distance))
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 85
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shops.count
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("detail obchodu na radce \(indexPath.row+1)#")
        let sc=ShopController()
        sc.shop = (self.tableView.cellForRowAtIndexPath(indexPath) as! ShopViewCell).shop
        self.navigationItem.title="Seznam"
        self.navigationController?.pushViewController(sc, animated: true)
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = ShopViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "ShopCell")
        cell.shop=shops[indexPath.row]
        cell.nameLabel.text=shops[indexPath.row].name
        cell.distance.text = Shop.printDistance(getDistanceTo(shops[indexPath.row].latitude as! Double, longitude: shops[indexPath.row].longitude as! Double, manager: self.manager))
        return cell
    }
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        print (newLocation)
    }
    //zmena manageru
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
    func pressedBrowser(sender: UIButton) {
        print("pressedBrowser")
    }
    func pressedTelephone(sender: UIButton) {
        print("pressedTelephone")
    }
}
