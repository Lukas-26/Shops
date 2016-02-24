//
//  Days.swift
//  
//
//  Created by Lukáš Pechač on 11.02.16.
//
//

import Foundation
import CoreData

@objc(Days)
class Days: NSManagedObject {

    func getTag() ->Int{
        if(shortcut=="PO"){
            return 1;
        }
        if(shortcut=="ÚT"){
            return 2;
        }
        if(shortcut=="ST"){
            return 3;
        }
        if(shortcut=="ČT"){
            return 4;
        }
        if(shortcut=="PÁ"){
            return 5;
        }
        if(shortcut=="SO"){
            return 6;
        }
        if(shortcut=="NE"){
            return 7;
        }
        return -1
    }

}
