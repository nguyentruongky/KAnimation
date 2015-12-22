//
//  kDropDownTransitionController.swift
//  KAnimation
//
//  Created by Ky Nguyen on 12/18/15.
//  Copyright © 2015 Ky Nguyen. All rights reserved.
//

import UIKit

class kDropDownTransition: kAnimationBase, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        
        return duration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let finalFrameForVC = transitionContext.finalFrameForViewController(toViewController)
        let containerView = transitionContext.containerView()
        let bounds = UIScreen.mainScreen().bounds
        toViewController.view.frame = CGRectOffset(finalFrameForVC, 0, -bounds.size.height)
        containerView?.addSubview(toViewController.view)
        
        UIView.animateWithDuration(transitionDuration(transitionContext), delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: UIViewAnimationOptions.CurveLinear, animations: {
            
            fromViewController.view.alpha = 0.5
            toViewController.view.frame = finalFrameForVC
            }) {
                
                finished in
                transitionContext.completeTransition(true)
                fromViewController.view.alpha = 1.0
        }
    }

}
