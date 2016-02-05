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

class NewShopController: UIViewController,MKMapViewDelegate,UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    var coordinates : CLLocationCoordinate2D?
    var shopAnnotation : MKPointAnnotation?
    weak var map : MKMapView!
    weak var img:UIImageView!=nil
    let picker = UIImagePickerController()
    
    weak var name:UILabel!
    weak var textName:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view=UIView()
        picker.delegate=self
        picker.allowsEditing=false
        view.backgroundColor = UIColor.whiteColor()
        let saveImage:UIImage = UIImage(named:"saveNavBarIcon")!
        let saveButton:UIButton = UIButton()
        saveButton.addTarget(self, action: "saveShop:", forControlEvents: .TouchUpInside)
        saveButton.setTitle("Uložit", forState: .Normal)
        saveButton.setImage(saveImage, forState: .Normal)
        saveButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0)
        saveButton.titleEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0)
        saveButton.transform = CGAffineTransformMakeScale(-1.0, 1.0);
        saveButton.titleLabel!.transform = CGAffineTransformMakeScale(-1.0, 1.0);
        saveButton.imageView!.transform = CGAffineTransformMakeScale(-1.0, 1.0);
        saveButton.frame = CGRectMake(0, 0, 80, 25)
        let rightBarButton = UIBarButtonItem()
        rightBarButton.customView = saveButton
        self.navigationItem.rightBarButtonItem = rightBarButton
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
        
        let label=UILabel()
        label.text="Otevírací doba:"
        let textNm=UITextField()
        textNm.placeholder="Název obchodu"
        textNm.delegate=self
        textNm.addTarget(self, action: "nameEditing:", forControlEvents: .EditingChanged)
        
        self.view.addSubview(label)
        self.view.addSubview(textNm)
        textNm.snp_makeConstraints { (make) -> Void in
            make.topMargin.equalTo(90)
            make.left.equalTo(view).offset(50)
            make.right.equalTo(view).offset(-15)
            
        }
        label.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(200)
            make.left.equalTo(view).offset(15)
            make.right.equalTo(view).offset(-15)
            
        }
        self.textName=textNm
        self.name=label
        
        let imageViewObject=UIImageView()
        imageViewObject.image = UIImage(named:"shopName")
        imageViewObject.tintColor=UIColor.redColor()
        self.view.addSubview(imageViewObject)
        imageViewObject.snp_makeConstraints { (make) -> Void in
            make.topMargin.equalTo(90)
            make.leftMargin.equalTo(10)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        let cameraIcon=UIImageView()
        cameraIcon.image = UIImage(named:"cameraIcon")
        cameraIcon.tintColor=UIColor.redColor()
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:Selector("cameraPicker:"))
        cameraIcon.userInteractionEnabled = true
        cameraIcon.addGestureRecognizer(tapGestureRecognizer)
        self.view.addSubview(cameraIcon)
        cameraIcon.snp_makeConstraints { (make) -> Void in
            make.topMargin.equalTo(130)
            make.leftMargin.equalTo(10)
            make.width.equalTo(27)
            make.height.equalTo(20)
        }
        let photoView=UIImageView()
        photoView.image = UIImage()
        photoView.userInteractionEnabled = true
        self.view.addSubview(photoView)
        photoView.snp_makeConstraints { (make) -> Void in
            make.topMargin.equalTo(130)
            make.leftMargin.equalTo(60)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
        self.img=photoView
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
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
    override func viewDidAppear(animated: Bool) {
    }
}