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
import ActionSheetPicker_3_0

class NewShopController: UIViewController,MKMapViewDelegate,UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate,UIPickerViewDelegate, UIPickerViewDataSource{
    
    var coordinates : CLLocationCoordinate2D?
    var shopAnnotation : MKPointAnnotation?
    weak var map : MKMapView!
    weak var img : UIImage!
    weak var imgDetail : UIImageView!
    weak var addDays:UIButton!
    weak var cameraIcon:UIButton!
    weak var deletePhoto:UIButton!
    weak var labelPhoto:UILabel!
    let picker = UIImagePickerController()
    weak var textName:UITextField!
    var unusedDays=[Days]()
    var usedDays=[Days]()
    var times = [Days: [Double]]()
    var isImage:Bool=false
    var timeFromDay=0
    var timeToDay=0
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
        
        let labelPhoto=UILabel()
        labelPhoto.text="Fotografie vybrána"
        labelPhoto.textColor=UIColor.grayColor()
        labelPhoto.font=labelPhoto.font.fontWithSize(14)
        labelPhoto.hidden=true
        
        let textNm=UITextField()
        textNm.placeholder="Název obchodu"
        textNm.delegate=self
        textNm.addTarget(self, action: "nameEditing:", forControlEvents: .EditingChanged)
        
        let imageViewObject=UIImageView()
        imageViewObject.image = UIImage(named:"shopName")
    
        let cameraIc=UIButton()
        cameraIc.setBackgroundImage(UIImage(named:"cameraIcon"), forState: .Normal)
        cameraIc.addTarget(self, action: "cameraPicker:", forControlEvents: .TouchUpInside)
        
        let timeIcon=UIButton()
        timeIcon.setBackgroundImage(UIImage(named:"plus"), forState: .Normal)
        timeIcon.addTarget(self, action: "timePicker:", forControlEvents: .TouchUpInside)
        
        let deletePhot=UIButton()
        deletePhot.setBackgroundImage(UIImage(named:"trash"), forState: .Normal)
        deletePhot.addTarget(self, action: "deletePhoto:", forControlEvents: .TouchUpInside)
        deletePhot.hidden=true
        
        let photoDetail=UIImageView()
        photoDetail.image = UIImage(named: "imageDetail")
        photoDetail.hidden=true
        photoDetail.userInteractionEnabled = true
        let gesturerecognizer=UITapGestureRecognizer(target: self, action: "showImageDetail:")
        photoDetail.addGestureRecognizer(gesturerecognizer)
        
        let sv=UIScrollView()
        //sv.backgroundColor=UIColor.redColor()
        sv.showsVerticalScrollIndicator=false
        sv.showsHorizontalScrollIndicator=false
        sv.contentInset=UIEdgeInsets(top: 0,left: 10,bottom: 0,right: 0)
        sv.contentSize=CGSizeMake(0,140)
        
        self.view.addSubview(sv)
        self.view.addSubview(m)
        self.view.addSubview(label)
        self.view.addSubview(textNm)
        self.view.addSubview(imageViewObject)
        self.view.addSubview(cameraIc)
        self.view.addSubview(timeIcon)
        self.view.addSubview(photoDetail)
        self.view.addSubview(labelPhoto)
        self.view.addSubview(deletePhot)
            
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
        cameraIc.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(50)
            make.left.equalTo(15)
            make.width.equalTo(23)
            make.height.equalTo(20)
        }
        timeIcon.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(85)
            make.left.equalTo(143)
            make.width.height.equalTo(22)
        }
        photoDetail.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(50)
            make.left.equalTo(200)
            make.height.equalTo(20)
            make.width.equalTo(19)
        }
        deletePhot.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(50)
            make.left.equalTo(230)
            make.height.equalTo(20)
            make.width.equalTo(15)
        }
        labelPhoto.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(51)
            make.left.equalTo(55)
        }
        label.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(85)
            make.left.equalTo(0).offset(15)
        }
        sv.snp_makeConstraints { (make) in
            make.width.equalTo(self.view.snp_width)
            make.height.equalTo(145)
            make.top.equalTo(120)
        }
        self.cameraIcon=cameraIc
        self.shopAnnotation=pa
        self.timesView=sv
        self.addDays=timeIcon
        self.textName=textNm
        self.map = m
        self.imgDetail=photoDetail
        self.labelPhoto=labelPhoto
        self.deletePhoto=deletePhot
        actionView.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height/2)
        
        loadDays()
    }
    func deletePhoto(sender: UIButton){
        self.labelPhoto.hidden=true
        self.imgDetail.hidden=true
        self.deletePhoto.hidden=true
        self.img=nil
        self.isImage=false
        self.cameraIcon.setBackgroundImage(UIImage(named: "cameraIcon"), forState: .Normal)
    }
    func showImageDetail(gesture: UITapGestureRecognizer){
        print("detail fotky")
    }
    func loadDays() {
        let days=Days.MR_findAll()
        let nrRow=days.count
        for row in 0..<nrRow{
            self.unusedDays.append((days[row] as! Days))
        }
    }
    func showTimePickerFrom(sender: UIButton){
        let datePicker = ActionSheetDatePicker(title: "Od:", datePickerMode: UIDatePickerMode.Time, selectedDate: NSDate(), target: self, action: "datePickedFrom:", origin: sender.superview!.superview)
        datePicker.minuteInterval = 1
        datePicker.timeZone=NSTimeZone.localTimeZone()
        self.timeFromDay=sender.tag
        datePicker.showActionSheetPicker()
    }
    func showTimePickerTo(sender: UIButton){
        let datePicker = ActionSheetDatePicker(title: "Do:", datePickerMode: UIDatePickerMode.Time, selectedDate: NSDate(), target: self, action: "datePickedTo:", origin: sender.superview!.superview)
        datePicker.minuteInterval = 1
        datePicker.timeZone=NSTimeZone.localTimeZone()
        self.timeToDay=sender.tag
        datePicker.showActionSheetPicker()
    }
    func datePickedFrom(time: NSDate) {
        if(self.timeFromDay>0&&self.timeFromDay<8){
            let calendar = NSCalendar.currentCalendar()
            let components = calendar.components([.Hour , .Minute], fromDate: time)
            let doubleTime=Double(components.hour) + Double(components.minute)*0.01
            var row=0
            for rw in 0..<usedDays.count{
                if(usedDays[rw].getTag()==self.timeFromDay){
                    row=rw
                    break
                }
            }
            if times[usedDays[row]]==nil{
                times[usedDays[row]]=Array([doubleTime,-1.0])
            }
            else{
                if(times[usedDays[row]]![1]<=doubleTime && !(times[usedDays[row]]![1]==(-1.0))){
                    ShowAlert("Nesprávný čas", string: "Čas otevření musí být menší než čas zavření!")
                    return
                }
                times[usedDays[row]]![0]=doubleTime
            }
            //zobrazeni casu do labelu
            let viewToEdit = self.timesView?.viewWithTag(self.timeFromDay) as! AddDayTimeView
            viewToEdit.FromTimeLabel?.text="\(components.hour):\(String(format: "%02d", components.minute))"
        }
        self.timeFromDay=0
    }
    func datePickedTo(time: NSDate) {
        if(self.timeToDay>0&&self.timeToDay<8){
            let calendar = NSCalendar.currentCalendar()
            let components = calendar.components([.Hour , .Minute], fromDate: time)
            let doubleTime=Double(components.hour) + Double(components.minute)*0.01
            var row=0
            for rw in 0..<usedDays.count{
                if(usedDays[rw].getTag()==self.timeToDay){
                    row=rw
                    break
                }
            }
            if times[usedDays[row]]==nil{
                times[usedDays[row]]=Array([-1.0,doubleTime])
            }
            else{
                if(times[usedDays[row]]![0]>=doubleTime && !(times[usedDays[row]]![0]==(-1.0))){
                    ShowAlert("Nesprávný čas", string: "Čas zavření musí být větší než čas otevření!")
                    return
                }
                times[usedDays[row]]![1]=doubleTime
            }
            //zobrazeni casu do labelu
            let viewToEdit = self.timesView?.viewWithTag(self.timeToDay) as! AddDayTimeView
            viewToEdit.ToTimeLabel?.text="\(components.hour):\(String(format: "%02d", components.minute))"
        }
        self.timeToDay=0
    }
    func cameraPicker(img: UIImageView)
    {
        if(isImage==true){
            ShowAlert("Nelze vložit další foto obchodu", string: "Pro pořízení nové fotografie, nejdříve smažte tu stávající")
            return
        }
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
        let tag=unusedDays[myRow].getTag()
        let dayView=AddDayTimeView()
        dayView.tag=tag
        dayView.AddFromTime?.tag=tag
        dayView.AddToTime?.tag=tag
        dayView.Day!.text=unusedDays[myRow].name
        dayView.AddFromTime!.addTarget(self, action: "showTimePickerFrom:", forControlEvents: .TouchUpInside)
        dayView.AddToTime!.addTarget(self, action: "showTimePickerTo:", forControlEvents: .TouchUpInside)
        dayView.DeleteDay!.addTarget(self, action: "deleteTime:", forControlEvents: .TouchUpInside)
        dayView.DeleteDay!.object=unusedDays[myRow]
        dayView.DeleteDay!.tag=tag
        self.timesView?.snp_updateConstraints(closure: { (make) in
            make.left.right.equalTo(0)
        })
        self.timesView?.contentSize=CGSizeMake(CGFloat(self.usedDays.count*110+110),140)
        self.timesView?.addSubview(dayView)
        dayView.snp_makeConstraints { (make) in
            make.left.equalTo(self.usedDays.count*110)
            make.top.equalTo(0)
            make.width.equalTo(100)
            make.height.equalTo(140)
        }
        usedDays.append(unusedDays[myRow])
        unusedDays.removeAtIndex(myRow)
        if(pickerDays.numberOfRowsInComponent(0)<=1){
            self.addDays.enabled=false
        }
        hidePicker()
    }
    func deleteTime(sender:ButtonWithNSObject){
        let viewToRemove = self.timesView?.viewWithTag(sender.tag)
        unusedDays.append(sender.object as! Days)
        viewToRemove?.removeFromSuperview()
        for nr in 0..<self.usedDays.count{
            if(usedDays[nr].getTag()==sender.tag){
                usedDays.removeAtIndex(nr)
                break
            }
        }
        times[(sender.object as! Days)]=nil
        self.timesView?.snp_updateConstraints(closure: { (make) in
            make.left.right.equalTo(0)
        })
        self.timesView?.contentSize=CGSize(width: self.usedDays.count*110,height: 140)
        let subviews=self.timesView!.subviews
        for view in 0..<subviews.count{
            subviews[view].snp_updateConstraints(closure: { (make) in
                make.left.equalTo(view*110)
            })
        }
        if(self.addDays.enabled==false && unusedDays.count>0){
            self.addDays.enabled=true
        }
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
        img=tempImage
        self.isImage=true
        self.cameraIcon.setBackgroundImage(UIImage(named: "cameraIconAdded"), forState: .Normal)
        self.imgDetail.hidden=false
        self.labelPhoto.hidden=false
        self.deletePhoto.hidden=false
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
            for (day,values) in times {
                if(!(values[0]==(-1.0)) && !(values[1]==(-1.0))){
                    let entityTime = NSEntityDescription.entityForName("OpenTime", inManagedObjectContext: localContext)
                    let recordTime = Open_time(entity: entityTime!, insertIntoManagedObjectContext: localContext)
                    recordTime.from? = NSNumber(double: values[0])
                    recordTime.to? = NSNumber(double: values[1])
                    recordTime.time_days=day
                    if(values[0]==0.0 && values[1]==23.59){
                        recordTime.nonstop=1
                    }
                    recordTime.time_shop=record
                }
            }
        record.name=self.textName.text
        record.latitude=NSNumber(double: (coordinates?.latitude)!)
        record.longitude=NSNumber(double: (coordinates?.longitude)!)
        if(self.isImage){
            let entity2 = NSEntityDescription.entityForName("ShopImage", inManagedObjectContext: localContext)
            let record2 = Shop_image(entity: entity2!, insertIntoManagedObjectContext: localContext)
            let imageData = NSData(data: UIImageJPEGRepresentation(self.img!, 0.5)!)
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
        
        return (unusedDays[row].name)!
    }
    override func viewDidAppear(animated: Bool) {
    }
}