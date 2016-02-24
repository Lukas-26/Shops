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
    
    func isOpen() -> Bool{
        let dayInWeek=NSDate().dayOfWeek()
        if(dayInWeek==nil){
            return false
        }
        
        let opentimes:NSArray=(self.shop_opentime?.allObjects)!
        if(opentimes.count==0){
            return false
        }
        var today:Open_time?
        for row in 0..<opentimes.count{
            if((opentimes[row] as! Open_time).time_days?.getTag()==dayInWeek){
                today=(opentimes[row] as! Open_time)
                break
            }
        }
        if(today==nil){
            return false
        }
        if(today?.nonstop?.intValue==1){
            return true
        }
        let from=today?.from?.doubleValue
        let to=today?.to?.doubleValue

        let dateFormatter=NSDateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let currentTime = dateFormatter.stringFromDate(NSDate())
        let array = currentTime.componentsSeparatedByString(":")
        let currentTimeDouble=Double(Int(array[0])!)+Double(Int(array[1])!)*0.01
        if(from<currentTimeDouble && currentTimeDouble<to){
            return true
        }
        return false
    }

}
