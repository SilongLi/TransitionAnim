//
//  LSLAlertDismissTransitionAnim.swift
//  TransitionAnimDemo
//
//  Created by lisilong on 2017/11/27.
//  Copyright © 2017年 LongShaoDream. All rights reserved.
//

import UIKit

class LSLAlertDismissTransitionAnim: NSObject {
    var duration = 0.25
    
}

extension LSLAlertDismissTransitionAnim: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return self.duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let fromView = transitionContext.view(forKey: .from)
        
        var maskView: UIView?
        for view in transitionContext.containerView.subviews {
            if view.tag == 999 {
                maskView = view
            }
        }
        
        UIView.animate(withDuration: self.duration, animations: { 
            fromView?.alpha = 0
            maskView?.alpha = 0
            fromView?.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
        }) { (Bool) in
            transitionContext.completeTransition(true)
        }
    }
    
}
