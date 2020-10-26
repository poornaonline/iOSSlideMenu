//
//  SlideInTransition.swift
//  SideMenuiOS
//
//  Created by Poorna Jayasinghe on 2020-10-27.
//

import UIKit

class SlideInTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    var isPresenting = false
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let toViewController = transitionContext.viewController(forKey: .to)!
        let fromViewController = transitionContext.viewController(forKey: .from)!
        
        let containerView = transitionContext.containerView
        
        let finalWidth = toViewController.view.bounds.width * 1
        let finalHeight = toViewController.view.bounds.height
        
        if isPresenting {
            containerView.addSubview(toViewController.view)
            toViewController.view.frame = CGRect(x: -finalWidth, y: 0, width: finalWidth, height: finalHeight)
        }
        
        let transform = {
            toViewController.view.transform = CGAffineTransform(translationX: finalWidth, y: 0)
        }
        
        let identity = {
            fromViewController.view.transform = .identity
        }
        
        let duration = transitionDuration(using: transitionContext)
        let isCancelled = transitionContext.transitionWasCancelled
        UIView.animate(withDuration: duration) {
            self.isPresenting ? transform() : identity()
        } completion: { (_) in
            transitionContext.completeTransition(!isCancelled)
        }

    }

}
