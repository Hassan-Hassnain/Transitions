//
//  Transition.swift
//  Transitions
//
//  Created by Usama Sadiq on 12/19/19.
//  Copyright © 2019 Usama Sadiq. All rights reserved.
//

import UIKit

class Transition: UIStoryboardSegue {

    override func perform() {
        destination.transitioningDelegate = self
        super.perform()
    }
}

extension Transition: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
      
        return TransitionPresenter()
    }
}

class TransitionPresenter: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 2.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let toViewController = (transitionContext.viewController(forKey: .to))!
        let toView = transitionContext.view(forKey: .to)
        
        if let this = toView {
            transitionContext.containerView.addSubview(this)
        }
        
        let fromViewController = transitionContext.viewController(forKey: .from)
        let fromView = transitionContext.view(forKey: .from )
        
        var startFrame = CGRect.zero
        if let fromViewController = fromViewController as? Scaleable {
            startFrame = fromViewController.imageFrame.frame
        }
        else{
            print("Error")
        }
        
        toView?.frame  = startFrame
        toView?.layoutIfNeeded()
        
        let duration = transitionDuration(using: transitionContext)
        let finalFrame = transitionContext.finalFrame(for: toViewController)
        
        UIView.animate(withDuration: duration, animations: {
            
            toView?.frame = finalFrame
            toView?.layoutIfNeeded()
            
        }) { (finished) in
            transitionContext.completeTransition(true)
        }
        
    }
    
    
}
