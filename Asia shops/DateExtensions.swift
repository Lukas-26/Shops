//
//  DateExtensions.swift
//  Asia shops
//
//  Created by Lukáš Pechač on 14.02.16.
//  Copyright © 2016 Lukáš Pechač. All rights reserved.
//

import Foundation

extension NSDate {
    func dayOfWeek() -> Int? {
        if
            let cal: NSCalendar = NSCalendar.currentCalendar(),
            let comp: NSDateComponents = cal.components(.Weekday, fromDate: self) {
            switch(comp.weekday){
            case 1:
                return 7
            default:
                return comp.weekday-1
            }
        } else {
            return nil
        }
    }
}