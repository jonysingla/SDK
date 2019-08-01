//
//  Payments.swift
//  MINDPayments
//
//  Created by Jony on 31/07/19.
//  Copyright © 2019 Jony. All rights reserved.
//

import UIKit
import MINDSubFramework
import MindSubFrameworkTwo

open class Payments: NSObject {
    
    open class func add( left:Int, right:Int ) -> Int
    {
        let sum = SubFrameworkHome.add(left: left, right: right)
        return sum
    }
    
    open class func subtract( left:Int, right:Int ) -> Int
    {
        let total = SubFrameworkTwo.subtract(left: left, right: right)
        return total
    }
}
