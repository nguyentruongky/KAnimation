//
//  kCircleTransition.swift
//  KAnimation
//
//  Created by Ky Nguyen on 12/22/15.
//  Copyright © 2015 Ky Nguyen. All rights reserved.
//

import UIKit

class kCircleTransition: kAnimationBase {

    weak var transitionContext: UIViewControllerContextTransitioning?
    var originalFrame: CGRect?
    
    init(startFrame: CGRect) {
        
        originalFrame = startFrame
    }
    
    override func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        
        return 0.5
    }
    
    override func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        self.transitionContext = transitionContext

        prepareElements(transitionContext)
        
        containerView.addSubview(toViewController!.view)
        
        let circleMaskPathInitial = UIBezierPath(ovalInRect: originalFrame!)

        let center = CGPoint(x: (originalFrame!.origin.x + originalFrame!.size.width) / 2, y: (originalFrame!.origin.x + originalFrame!.size.width) / 2)
        
        let extremePoint = CGPoint(x: center.x + 300, y: center.y - CGRectGetHeight(toViewController!.view.bounds))
        let radius = sqrt((extremePoint.x * extremePoint.x) + (extremePoint.y * extremePoint.y))
        let circleMaskPathFinal = UIBezierPath(ovalInRect: CGRectInset(originalFrame!, -radius, -radius))

        let maskLayer = CAShapeLayer()
        maskLayer.path = circleMaskPathFinal.CGPath
        toViewController!.view.layer.mask = maskLayer

        let maskLayerAnimation = CABasicAnimation(keyPath: "path")
        maskLayerAnimation.fromValue = circleMaskPathInitial.CGPath
        maskLayerAnimation.toValue = circleMaskPathFinal.CGPath
        maskLayerAnimation.duration = self.transitionDuration(transitionContext)
        maskLayerAnimation.delegate = self
        maskLayer.addAnimation(maskLayerAnimation, forKey: "path")
    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        self.transitionContext?.completeTransition(!self.transitionContext!.transitionWasCancelled())
        self.transitionContext?.viewControllerForKey(UITransitionContextFromViewControllerKey)?.view.layer.mask = nil
    }
}
