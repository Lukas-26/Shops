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

class ShopController: UIViewController,UIScrollViewDelegate{
    
    var shop:NSManagedObject?
    weak var shopImage:UIImageView?
    weak var textView:UIView?
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor=UIColor.whiteColor()
        self.title=(shop!.valueForKey("name") as? String)!
        let img=UIImageView()
        //img.backgroundColor=UIColor.grayColor()
        self.view.addSubview(img)
        img.snp_makeConstraints { (make) in
            make.width.equalTo(self.view.snp_width)
            make.height.equalTo(self.view.snp_height).multipliedBy(0.3)
            make.topMargin.equalTo(70)
        }
        self.shopImage=img
        
        let images=(shop!.valueForKey("shop_image") as? NSSet)!
        let arr:NSArray=NSArray(objects: images)
        print(" Obrazku u obchodu: \(arr.count)")
        if(arr.count>0){
            let object=arr.objectAtIndex(0)
            //self.shopImage?.image=UIImage(data: (object.valueForKey("image_name") as? NSData)!)
        }
        
        let tv=UIView()
        tv.backgroundColor=UIColor.redColor()
        self.view.addSubview(tv)
        tv.snp_makeConstraints { (make) in
            make.left.bottom.right.equalTo(0)
            make.height.equalTo(self.view.snp_height).multipliedBy(0.5)
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
    }
    func enterToShop(button:UIButton){
        print("stisknuto")
    }
    func calculateRating() -> Double {
        return 0;
    }
}