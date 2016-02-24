//
//  ShopController.swift
//  Asia shops
//
//  Created by Lukáš Pechač on 06.02.16.
//  Copyright © 2016 Lukáš Pechač. All rights reserved.
//

import Foundation
import UIKit
import MagicalRecord
import SnapKit
import Cosmos

class ShopController: UIViewController,UIScrollViewDelegate{
    
    var shop: Shop?
    weak var shopImage:UIImageView?
    weak var textView:UIView?
    weak var rating:CosmosView?
    var ohodnoceno=false
    weak var ohodnocenoLabel:UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor=UIColor.whiteColor()
        self.navigationController?.navigationBar.translucent=false
        self.title=(shop!.valueForKey("name") as? String)!
        let img=UIImageView()
        let arr:NSArray=(shop?.shop_image?.allObjects)!
        print("Obrazku u obchodu: \(arr.count)")
        if(arr.count>0){
            let object=arr.objectAtIndex(0)
            img.image=UIImage(data: (object.valueForKey("imageData") as? NSData)!)
        }
        print("Počet otevřených dní: \((self.shop?.shop_opentime?.allObjects.count)!)")
        img.contentMode=UIViewContentMode.ScaleAspectFit
        self.view.addSubview(img)
        img.snp_makeConstraints { (make) in
            make.width.equalTo(self.view.snp_width)
            make.height.equalTo(self.view.snp_height).multipliedBy(0.45)
            make.top.left.right.equalTo(0)
        }
        self.shopImage=img
        
        let tv=UIView()
        //tv.backgroundColor=UIColor.redColor()
        self.view.addSubview(tv)
        tv.snp_makeConstraints { (make) in
            make.left.bottom.right.equalTo(0)
            make.height.equalTo(self.view.snp_height).multipliedBy(0.55)
            make.width.equalTo(self.view.snp_width)
        }
        let name=UILabel()
        name.textColor=UIColor.blueColor()
        name.font = UIFont.boldSystemFontOfSize(20)
        name.text=(shop!.valueForKey("name") as? String)!
        tv.addSubview(name)
        name.snp_makeConstraints { (make) in
            make.topMargin.equalTo(10)
            make.centerX.equalTo(tv.center)
            make.width.equalTo(self.view.snp_width).multipliedBy(0.95)
        }
        let stars=CosmosView()
        stars.settings.fillMode = .Precise
        stars.settings.starSize = 25
        stars.settings.starMargin = 5
        stars.settings.colorFilled = UIColor(colorLiteralRed: 0.235, green: 0.38, blue: 0.847, alpha: 1)
        stars.settings.borderColorEmpty = UIColor(colorLiteralRed: 0.235, green: 0.38, blue: 0.847, alpha: 1)
        stars.settings.updateOnTouch = true
        stars.rating=self.shop!.getAvgRating()
        stars.didFinishTouchingCosmos = { rating in
            if(!(self.ohodnoceno)){
                self.saveRating(Double(round(10*rating)/10))
                self.ohodnoceno=true
                stars.settings.updateOnTouch=false
                self.showAlert("Hodnocení uloženo", text: "Děkujeme za ohodnocení tohoto obchodu")
                self.ohodnocenoLabel?.hidden=false
            }
        }
        tv.addSubview(stars)
        stars.snp_makeConstraints { (make) in
            make.topMargin.equalTo(40)
            make.width.equalTo(tv.snp_width).multipliedBy(0.49)
            make.left.equalTo(10)
        }
        self.rating=stars
        
        let button=UIButton()
        button.setTitle("Sortiment obchodu", forState: .Normal)
        button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        button.backgroundColor=UIColor(colorLiteralRed: 0.235, green: 0.38, blue: 0.847, alpha: 1)
        button.addTarget(self, action: "enterToShop:", forControlEvents: .TouchUpInside)
        tv.addSubview(button)
        button.snp_makeConstraints { (make) in
            make.height.equalTo(50)
            make.bottomMargin.equalTo(-15)
            make.centerX.equalTo(tv.center)
            make.width.equalTo(tv.snp_width).multipliedBy(0.9)
        }
        self.textView=tv
        
        let ratingplaced=UILabel()
        ratingplaced.textColor=UIColor.grayColor()
        ratingplaced.font = ratingplaced.font.fontWithSize(14)
        ratingplaced.text="Hodnocení uděleno"
        ratingplaced.hidden=true
        tv.addSubview(ratingplaced)
        ratingplaced.snp_makeConstraints { (make) in
            make.topMargin.equalTo(40)
            make.width.equalTo(tv.snp_width).multipliedBy(0.49)
            make.height.equalTo(25)
            make.right.equalTo(10)
        }
        self.ohodnocenoLabel=ratingplaced
    }
    func saveRating(rating: Double){
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        let localContext:NSManagedObjectContext = NSManagedObjectContext.MR_contextForCurrentThread()
        let entity = NSEntityDescription.entityForName("Rating", inManagedObjectContext: localContext)
        let record = Rating(entity: entity!, insertIntoManagedObjectContext: localContext)
        record.star=NSNumber(double: rating)
        record.date=NSDate()
        record.rating_shop=self.shop
        localContext.MR_saveToPersistentStoreWithCompletion { (Status:Bool, error:NSError!) in
            if (Status) {
                print("Ulozeno hodnocení: \(rating)")
            } else if ((error) != nil) {
                print("-> ERROR!!!! : \(error.description)")
            }
        }
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        
    }
    func showAlert(title: String,text:String){
        let message=text
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let ok = UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in })
        alert.addAction(ok)
        presentViewController(alert, animated: true, completion: nil)
    }
    func enterToShop(button:UIButton){
        print("sortiment obchodu")
        let sc=SortimentController()
        //Bottle.MR_findAllWithPredicate(rel)
        self.navigationItem.title=self.shop?.name
        self.navigationController?.pushViewController(sc, animated: true)
    }
}