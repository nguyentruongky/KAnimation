//
//  kTransitionTableViewController.swift
//  KAnimation
//
//  Created by Ky Nguyen on 12/18/15.
//  Copyright © 2015 Ky Nguyen. All rights reserved.
//

import UIKit

enum kTransitionEnum {
    
    case kBox3DTransition
    case kDropTransition
    case kPopTransition
    case kCircleTransition
    case kSlidingTransition
    case Default
}

class kTransitionTableViewController: UITableViewController, UIViewControllerTransitioningDelegate, UINavigationControllerDelegate {

    var currentTransition: kTransitionEnum!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.delegate = self
    }
    
    // MARK: - Navigation

    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    
        return kBox3DTransition()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let toViewController = segue.destinationViewController
        toViewController.transitioningDelegate = self
        
        let index = tableView.indexPathForSelectedRow!.row
        storeCurrentTransition(index)
    }

    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
       return selectTransition()
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {

       return selectTransition()
    }
    
    func storeCurrentTransition(indexPath: Int) {
        
        switch indexPath {
            
        case 0:
            currentTransition = kTransitionEnum.kBox3DTransition
            
        case 1:
            currentTransition = kTransitionEnum.kDropTransition
            
        case 2:
            currentTransition = kTransitionEnum.kPopTransition
            
        case 3:
            currentTransition = kTransitionEnum.kCircleTransition
            
        case 4:
            currentTransition = kTransitionEnum.kSlidingTransition
            
        default:
            currentTransition = kTransitionEnum.Default
        }
    }

    func selectTransition() -> UIViewControllerAnimatedTransitioning? {
        
        switch currentTransition! {
            
        case kTransitionEnum.kBox3DTransition:
            return kBox3DTransition()
            
        case kTransitionEnum.kDropTransition:
            return kDropDownTransition()
            
        case kTransitionEnum.kPopTransition:
            
//            // Pop from the current position
//            let transition = kPopTransition()
//            let cell = tableView.cellForRowAtIndexPath(tableView.indexPathForSelectedRow!)!
//            transition.originFrame = (cell.superview?.convertRect(cell.frame, toView: nil))!
//            transition.presenting = true
//            return transition
            
        // pop from default position
            return kPopTransition()
            
        case .kCircleTransition:
            return kCircleTransition(startFrame: CGRectMake(300, 100, 100, 100))
            
        case .kSlidingTransition:
            return kSlidingTransition()
        default:
            return nil
        }
    }

}
