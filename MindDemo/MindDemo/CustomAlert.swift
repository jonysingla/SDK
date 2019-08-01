//
//  CustomAlert.swift
//  FrameworkIntegratedDemo
//
//  Created by Jony on 17/07/19.
//  Copyright © 2019 Jony. All rights reserved.
//

import UIKit

class CustomAlert: NSObject {
    static let sharedInstance = CustomAlert()
    
    //Show alert
    func alert(view: UIViewController, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: { action in
        })
        alert.addAction(defaultAction)
        DispatchQueue.main.async(execute: {
            view.present(alert, animated: true)
        })
    }
    
//    private override init() {
//    }
}
