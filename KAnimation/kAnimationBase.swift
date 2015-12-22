//
//  AnimationBaseViewController.swift
//  KAnimation
//
//  Created by Ky Nguyen on 12/19/15.
//  Copyright © 2015 Ky Nguyen. All rights reserved.
//

import UIKit

class kAnimationBase: NSObject, UIViewControllerAnimatedTransitioning {

    var duration: Double = 1
  
    var containerView : UIView!
    
    var fromViewController: UIViewController!
    var toViewController: UIViewController!
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        
        return duration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
    }
    
    func getContainerView(transitionContext: UIViewControllerContextTransitioning) {
        
        containerView = transitionContext.containerView()!
    }
    
    func getFromViewController(transitionContext: UIViewControllerContextTransitioning) {
        
        fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
    }
    
    func getToViewController(transitionContext: UIViewControllerContextTransitioning) {
        
        toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
    }
    
    func prepareElements(transitionContext: UIViewControllerContextTransitioning) {

        getContainerView(transitionContext)
        getFromViewController(transitionContext)
        getToViewController(transitionContext)
    }

}
