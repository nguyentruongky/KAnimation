//
//  kDropDownTransitionController.swift
//  KAnimation
//
//  Created by Ky Nguyen on 12/18/15.
//  Copyright © 2015 Ky Nguyen. All rights reserved.
//

import UIKit

class kDropDownTransition: kAnimationBase {
      
    override func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        prepareElements(transitionContext)
        let finalFrameForVC = transitionContext.finalFrameForViewController(toViewController)
        let containerView = transitionContext.containerView()
        let bounds = UIScreen.mainScreen().bounds
        toViewController.view.frame = CGRectOffset(finalFrameForVC, 0, -bounds.size.height)
        containerView?.addSubview(toViewController.view)
        
        UIView.animateWithDuration(transitionDuration(transitionContext), delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: UIViewAnimationOptions.CurveLinear, animations: {
            
            self.fromViewController.view.alpha = 0.5
            self.toViewController.view.frame = finalFrameForVC
            }) {
                
                finished in
                transitionContext.completeTransition(true)
                self.fromViewController.view.alpha = 1.0
        }
    }

}
