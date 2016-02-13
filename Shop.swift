//
//  Shop.swift
//  
//
//  Created by Lukáš Pechač on 11.02.16.
//
//

import Foundation
import CoreData

@objc(Shop)
class Shop: NSManagedObject {

    func getAvgRating()->Double{
        let array:NSArray=(self.shop_rating?.allObjects)!
        let nrRow=array.count
        if(nrRow==0){
            return 0
        }
        var sum=Double(0.0)
        for row in 0..<nrRow{
            sum+=(array.objectAtIndex(row) as! Rating).star!.doubleValue
        }
        let value=sum/Double(nrRow)
        return Double(round(10*value)/10) //10 = zaokrouhleni na 1 desetinne misto, 100 = 2 des. mista...
    }

}
