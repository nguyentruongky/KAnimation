//
//  kDismissAnimation.swift
//  KAnimation
//
//  Created by Ky Nguyen on 12/19/15.
//  Copyright © 2015 Ky Nguyen. All rights reserved.
//

import UIKit

class kZoomTransition: kAnimationBase {
    
    override func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        prepareElements(transitionContext)

        let finalFrameForVC = transitionContext.finalFrameForViewController(toViewController)
        toViewController.view.frame = finalFrameForVC
        toViewController.view.alpha = 0.25
        containerView?.addSubview(toViewController.view)
        containerView?.sendSubviewToBack(toViewController.view)
        
        let snapshotView = fromViewController.view.snapshotViewAfterScreenUpdates(false)
        snapshotView.frame = fromViewController.view.frame
        snapshotView.alpha = 1
        containerView?.addSubview(snapshotView)
        
        fromViewController.view.removeFromSuperview()
        
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
            snapshotView.frame = CGRectInset(self.fromViewController.view.frame, self.fromViewController.view.frame.size.width / 2, self.fromViewController.view.frame.size.height / 2)
            self.toViewController.view.alpha = 1.0
            snapshotView.alpha = 0
            }, completion: {
                finished in
                snapshotView.removeFromSuperview()
                transitionContext.completeTransition(true)
        })
    }
}
