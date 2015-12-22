//
//  kBox3DTransition.swift
//  KAnimation
//
//  Created by Ky Nguyen on 12/19/15.
//  Copyright © 2015 Ky Nguyen. All rights reserved.
//

import UIKit

class kBox3DTransition: kAnimationBase {
    
    var reverse : Bool = false
    
    override func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        prepareElements(transitionContext)
        
        let toView = toViewController.view
        let fromView = fromViewController.view
        let direction : CGFloat = reverse ? -1 : 1
        let const: CGFloat = -0.005
        
        toView.layer.anchorPoint = CGPointMake(direction == 1 ? 0 : 1, 0.5)
        fromView.layer.anchorPoint = CGPointMake(direction == 1 ? 1 : 0, 0.5)
        
        var viewFromTransform: CATransform3D = CATransform3DMakeRotation(direction * CGFloat(M_PI_2), 0.0, 1.0, 0.0)
        var viewToTransform: CATransform3D = CATransform3DMakeRotation(-direction * CGFloat(M_PI_2), 0.0, 1.0, 0.0)
        viewFromTransform.m34 = const
        viewToTransform.m34 = const
        
        containerView.transform = CGAffineTransformMakeTranslation(direction * containerView.frame.size.width / 2.0, 0)
        toView.layer.transform = viewToTransform
        containerView.addSubview(toView)
        
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
            self.containerView.transform = CGAffineTransformMakeTranslation(-direction * self.containerView.frame.size.width / 2.0, 0)
            fromView.layer.transform = viewFromTransform
            toView.layer.transform = CATransform3DIdentity
            }, completion: {
                finished in
                self.containerView.transform = CGAffineTransformIdentity
                fromView.layer.transform = CATransform3DIdentity
                toView.layer.transform = CATransform3DIdentity
                fromView.layer.anchorPoint = CGPointMake(0.5, 0.5)
                toView.layer.anchorPoint = CGPointMake(0.5, 0.5)
                
                if (transitionContext.transitionWasCancelled()) {
                    toView.removeFromSuperview()
                } else {
                    fromView.removeFromSuperview()
                }
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        })
    }
}
