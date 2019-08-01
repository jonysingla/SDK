//
//  SubFrameworkHome.swift
//  MINDSubFramework
//
//  Created by Jony on 31/07/19.
//  Copyright © 2019 Jony. All rights reserved.
//

import UIKit

open class SubFrameworkHome: NSObject {
    
    open class func add( left:Int, right:Int ) -> Int
    {
        let sum = left + right
        return sum
    }
    
    open class func transInfo(transInfo: Dictionary<String, Any>) -> Dictionary<String, Any>
    {
        print("Framework Beofre jony \(transInfo)")
        var dict : Dictionary = transInfo
        print("Framework After jony \(dict)")
        return dict
    }
}
