//
//  Payments.swift
//  MINDPayments
//
//  Created by Jony on 31/07/19.
//  Copyright © 2019 Jony. All rights reserved.
// https://medium.com/@bittudavis/how-to-create-an-umbrella-framework-in-swift-ca964d0a2345

import UIKit
import MINDSubFramework
import MindSubFrameworkTwo

open class Payments: NSObject {
    
    open class func add( left:Int, right:Int ) -> Int
    {
        let sum = SubFrameworkHome.add(left: left, right: right)
        return sum
    }
    
    open class func transInfo(transInfo: Dictionary<String, Any>) -> Dictionary<String, Any>
    {
        print("Payment Beofre jony \(transInfo)")
        var dict: Dictionary =  SubFrameworkHome.transInfo(transInfo: transInfo)
        print("Payment after jony \(transInfo)")
        return dict
    }
    
    open class func subtract( left:Int, right:Int ) -> Int
    {
        let total = SubFrameworkTwo.subtract(left: left, right: right)
        return total
    }
}
