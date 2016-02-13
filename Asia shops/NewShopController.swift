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
import MagicalRecord
import Foundation
import CoreData

class NewShopController: UIViewController,MKMapViewDelegate,UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate,UIPickerViewDelegate, UIPickerViewDataSource{
    
    var coordinates : CLLocationCoordinate2D?
    var shopAnnotation : MKPointAnnotation?
    weak var map : MKMapView!
    weak var img : UIImageView!
    weak var addDays:UIButton!
    let picker = UIImagePickerController()
    weak var textName:UITextField!
    var unusedDays=[NSManagedObject]()
    var usedDays=[NSManagedObject]()
    var opentime = [NSManagedObject: Double]()
    var closetime = [NSManagedObject: Double]()
    var isImage:Bool=false
    weak var timesView:UIScrollView?
    var actionView: UIView = UIView()
    var pickerDays = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate=self
        picker.allowsEditing=false
        view.backgroundColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.translucent=false
        let saveImage:UIImage = UIImage(named:"saveShop")!
        
        let saveButton:UIButton = UIButton()
        saveButton.addTarget(self, action: "saveShop:", forControlEvents: .TouchUpInside)
        saveButton.setImage(saveImage, forState: .Normal)
        saveButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0)
        saveButton.frame = CGRectMake(0, 0, 22, 23)
        
        let rightBarButton = UIBarButtonItem()
        rightBarButton.customView = saveButton
        self.navigationItem.rightBarButtonItem = rightBarButton

        let coord = coordinates
        let span = MKCoordinateSpanMake(0.004, 0.004)
        let region = MKCoordinateRegion(center: coord!, span: span)
        let pa = MKPointAnnotation()
        pa.coordinate = coordinates!
        
        let m = MKMapView()
        m.showsUserLocation=false
        m.mapType = MKMapType.Standard
        m.delegate = self
        m.setRegion(region, animated: false)
        m.addAnnotation(pa)
        
        let label=UILabel()
        label.text="Otevírací doba:"
        
        let textNm=UITextField()
        textNm.placeholder="Název obchodu"
        textNm.delegate=self
        textNm.addTarget(self, action: "nameEditing:", forControlEvents: .EditingChanged)
        
        let imageViewObject=UIImageView()
        imageViewObject.image = UIImage(named:"shopName")
    
        let cameraIcon=UIButton()
        cameraIcon.setBackgroundImage(UIImage(named:"cameraIcon"), forState: .Normal)
        cameraIcon.addTarget(self, action: "cameraPicker:", forControlEvents: .TouchUpInside)
        
        let timeIcon=UIButton()
        timeIcon.setBackgroundImage(UIImage(named:"plus"), forState: .Normal)
        timeIcon.addTarget(self, action: "timePicker:", forControlEvents: .TouchUpInside)
        
        let photoView=UIImageView()
        photoView.image = UIImage()
        photoView.userInteractionEnabled = true
        
        let sv=UIScrollView()
        sv.backgroundColor=UIColor.redColor()
        sv.showsVerticalScrollIndicator=false
        sv.contentSize=CGSizeMake(0,80)
        
        self.view.addSubview(sv)
        self.view.addSubview(m)
        self.view.addSubview(label)
        self.view.addSubview(textNm)
        self.view.addSubview(imageViewObject)
        self.view.addSubview(cameraIcon)
        self.view.addSubview(timeIcon)
        self.view.addSubview(photoView)
        
        m.snp_makeConstraints { (make) -> Void in
            make.height.equalTo(self.view.snp_height).multipliedBy(0.4)
            make.width.equalTo(self.view.snp_width)
            make.bottomMargin.equalTo(0)
        }
        textNm.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(15)
            make.left.equalTo(view).offset(55)
            make.right.equalTo(view).offset(-15)
        }
        imageViewObject.snp_makeConstraints { (make) -> Void in
            make.top.left.equalTo(15)
            make.width.height.equalTo(20)
        }
        cameraIcon.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(50)
            make.left.equalTo(15)
            make.width.equalTo(27)
            make.height.equalTo(20)
        }
        timeIcon.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(79)
            make.left.equalTo(145)
            make.width.height.equalTo(25)
        }
        photoView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(50)
            make.left.equalTo(60)
            make.width.height.equalTo(50)
        }
        label.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(80)
            make.left.equalTo(0).offset(15)
        }
        sv.snp_makeConstraints { (make) in
            make.width.equalTo(self.view.snp_width)
            make.height.equalTo(100)
            make.top.equalTo(120)
        }
        
        self.shopAnnotation=pa
        self.timesView=sv
        self.img=photoView
        self.addDays=timeIcon
        self.textName=textNm
        self.map = m
        
        actionView.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height/2)
        
        loadDays()
    }
    func loadDays() {
        let days=Days.MR_findAll()
        let nrRow=days.count
        for row in 0..<nrRow{
            self.unusedDays.append((days[row] as! NSManagedObject))
        }
    }
    func cameraPicker(img: UIImageView)
    {
        let optionMenu = UIAlertController(title: nil, message: "Vyberte možnost", preferredStyle: .ActionSheet)
        let deleteAction = UIAlertAction(title: "Vyfotit fotku", style: .Default, handler: {
            UIAlertAction in self.takePhoto()
        })
        let saveAction = UIAlertAction(title: "Vybrat z galerie", style: .Default, handler: {
            UIAlertAction in self.selectFromGallery()
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            print("Cancelled")
        })
        optionMenu.addAction(deleteAction)
        optionMenu.addAction(saveAction)
        optionMenu.addAction(cancelAction)
        self.presentViewController(optionMenu, animated: true, completion: nil)
    }
    func timePicker(img: UIImageView)
    {
        pickerDays.frame = CGRectMake(0.0, 0.0,self.view.frame.size.width, self.view.frame.size.height/2)
        pickerDays.dataSource = self
        pickerDays.delegate = self
        pickerDays.showsSelectionIndicator = true;
        pickerDays.backgroundColor = UIColor.whiteColor()
        
        let pickerTimeToolbar = UIToolbar(frame: CGRectMake(0, 0, self.view.frame.size.width, 44))
        pickerTimeToolbar.barStyle = UIBarStyle.Default
        pickerTimeToolbar.barTintColor = UIColor(colorLiteralRed: 0.235, green: 0.38, blue: 0.847, alpha: 1)
        pickerTimeToolbar.translucent = true
        pickerTimeToolbar.backgroundColor=UIColor(colorLiteralRed: 0.235, green: 0.38, blue: 0.847, alpha: 1)
        
        var barItems = [UIBarButtonItem]()
        
        let cancelBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action:"cancelPickerSelectionButtonClicked:")
        cancelBtn.tintColor=UIColor.whiteColor()
        barItems.append(cancelBtn)
            
        var flexSpace: UIBarButtonItem
        flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: self, action: nil)
        barItems.append(flexSpace)
        
        pickerDays.selectRow(0, inComponent: 0, animated: false)
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action:"daysPickerDoneClicked:")
        doneBtn.tintColor=UIColor.whiteColor()
        barItems.append(doneBtn)
            
        pickerTimeToolbar.setItems(barItems, animated: true)
        actionView.addSubview(pickerDays)
        actionView.addSubview(pickerTimeToolbar)
        self.view.addSubview(actionView)
            
        UIView.animateWithDuration(0.2, animations: {
        self.actionView.frame = CGRectMake(0, self.view.frame.height/2, UIScreen.mainScreen().bounds.size.width, self.view.frame.height/2)
        })
    }
    func daysPickerDoneClicked(from:UIBarButtonItem) {
        let myRow = pickerDays.selectedRowInComponent(0)
        ShowAlert((unusedDays[myRow].valueForKey("name") as? String)!, string: "")
        usedDays.append(unusedDays[myRow])
        unusedDays.removeAtIndex(myRow)
        if(pickerDays.numberOfRowsInComponent(0)<=1){
            self.addDays.enabled=false
        }
        hidePicker()
    }
    func cancelPickerSelectionButtonClicked(from:UIBarButtonItem) {
        hidePicker()
    }
    func hidePicker(){
        UIView.animateWithDuration(0.2, animations: {
            self.actionView.frame = CGRectMake(0, self.view.frame.height, self.view.frame.width, self.view.frame.height/2)
            }, completion: { _ in
                for obj: AnyObject in self.actionView.subviews {
                    if let view = obj as? UIView
                    {
                        view.removeFromSuperview()
                    }
                }
        })
    }
    func selectFromGallery(){
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary){
            print("select from gallery")
            picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary;
            self.presentViewController(picker, animated: true, completion: nil)
        }
    }
    func takePhoto(){
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
            print("take photo")
            picker.sourceType = UIImagePickerControllerSourceType.Camera;
            picker.cameraCaptureMode = .Photo
            picker.modalPresentationStyle = .FullScreen
            self.presentViewController(picker, animated: true, completion: nil)
        }
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let tempImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.dismissViewControllerAnimated(true, completion: nil)
        img.image=nil
        img.image=tempImage
        self.isImage=true
        img.setNeedsDisplay()
    }
    //uzivatel zrusi pridavani fotky
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        print("cancel vyberu fotky")
        dismissViewControllerAnimated(true,completion: nil)
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
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    func nameEditing(source: UITextField){
        if(source.text?.characters.count<=15){
           self.title=source.text
        }
        else{
            self.title=source.text!.substringToIndex(source.text!.startIndex.advancedBy(14))+"..."
        }
    }
    func saveShop(source: UIBarButtonItem){
        if(!(textName.text=="")){
            UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        let localContext:NSManagedObjectContext = NSManagedObjectContext.MR_contextForCurrentThread()
        let entity = NSEntityDescription.entityForName("Shop", inManagedObjectContext: localContext)
        let record = Shop(entity: entity!, insertIntoManagedObjectContext: localContext)
        record.name=self.textName.text
        record.latitude=NSNumber(double: (coordinates?.latitude)!)
        record.longitude=NSNumber(double: (coordinates?.longitude)!)
        if(self.isImage){
            let entity2 = NSEntityDescription.entityForName("ShopImage", inManagedObjectContext: localContext)
            let record2 = Shop_image(entity: entity2!, insertIntoManagedObjectContext: localContext)
            let imageData = NSData(data: UIImageJPEGRepresentation(self.img.image!, 0.5)!)
            record2.imageData=imageData
            record2.shopimage_shop=record
        }
        
        localContext.MR_saveToPersistentStoreWithCompletion { (Status:Bool, error:NSError!) in
            if (Status) {
                print("Vložen obchod \(self.textName.text) na souřadicích latitude: \(self.coordinates?.latitude) longitude:\(self.coordinates?.longitude).")
            } else if ((error) != nil) {
                print("-> ERROR!!!! : \(error.description)")
            }
        }
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            navigationController?.popViewControllerAnimated(true)
        }
        else{
            ShowAlert("Nelze uložit", string: "Nový obchod se nepodařilo uložit. Jméno obchodu nesmí být prázdné.")
        }
    }
    func ShowAlert(title:String,string:String){
        let message=string
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let ok = UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in })
        alert.addAction(ok)
        presentViewController(alert, animated: true, completion: nil)
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.unusedDays.count
    }
    func pickerView(_pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return (unusedDays[row].valueForKey("name") as? String)!
    }
    override func viewDidAppear(animated: Bool) {
    }
}