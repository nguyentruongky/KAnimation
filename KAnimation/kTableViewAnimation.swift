//
//  kTableViewAnimation.swift
//  KAnimation
//
//  Created by Ky Nguyen on 12/22/15.
//  Copyright © 2015 Ky Nguyen. All rights reserved.
//

import UIKit

extension UITableViewController {
    
    override public func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        
        animateTable()
    }
    
    func animateTable() {
        
        tableView.reloadData()
        
        let cells = tableView.visibleCells
        let tableHeight = tableView.bounds.size.height
        
        for i in cells {
            
            let cell = i as UITableViewCell
            cell.transform = CGAffineTransformMakeTranslation(0, tableHeight)
        }
        
        var index = 0
        
        for a in cells {
            
            let cell = a as UITableViewCell
            UIView.animateWithDuration(1.25, delay: 0.05 * Double(index), usingSpringWithDamping: 0.65, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                
                cell.transform = CGAffineTransformMakeTranslation(0, 0)
                }, completion: nil)
            
            index++
        }
    }

}