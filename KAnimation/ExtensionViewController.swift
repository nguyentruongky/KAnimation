//
//  kDropDownDestinationViewController.swift
//  KAnimation
//
//  Created by Ky Nguyen on 12/19/15.
//  Copyright © 2015 Ky Nguyen. All rights reserved.
//

import UIKit

extension UIViewController {
    
    @IBAction func dismiss(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
}
