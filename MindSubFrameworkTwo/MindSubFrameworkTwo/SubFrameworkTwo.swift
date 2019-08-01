//
//  SubFrameworkTwo.swift
//  MindSubFrameworkTwo
//
//  Created by Jony on 31/07/19.
//  Copyright © 2019 Jony. All rights reserved.
//

import UIKit

open class SubFrameworkTwo: NSObject {

    open class func subtract( left:Int, right:Int ) -> Int
    {
        let total = left - right
        return total
    }
    
}
