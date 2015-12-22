//
//  TransitionManager.swift
//  KAnimation
//
//  Created by Ky Nguyen on 12/22/15.
//  Copyright © 2015 Ky Nguyen. All rights reserved.
//

import UIKit

class kSlidingTransition: kAnimationBase {

    override func animateTransition(transitionContext: UIViewControllerContextTransitioning) {

        let container = transitionContext.containerView()!
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        
        let offScreenRight = CGAffineTransformMakeTranslation(container.frame.width, 0)
        let offScreenLeft = CGAffineTransformMakeTranslation(-container.frame.width, 0)
        
        toView.transform = offScreenRight
        
        container.addSubview(toView)
        container.addSubview(fromView)
        
        let duration = 1.0

        UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.2, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            
            fromView.transform = offScreenLeft
            toView.transform = CGAffineTransformIdentity

            }) { _ in
                
                transitionContext.completeTransition(true)
        }
    }
}
