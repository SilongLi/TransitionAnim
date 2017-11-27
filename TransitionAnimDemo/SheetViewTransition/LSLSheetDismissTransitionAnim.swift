//
//  LSLSheetDismissTransitionAnim.swift
//  TransitionAnimDemo
//
//  Created by lisilong on 2017/11/27.
//  Copyright © 2017年 LongShaoDream. All rights reserved.
//

import UIKit

class LSLSheetDismissTransitionAnim: NSObject {
    var duration = 0.25

}

extension LSLSheetDismissTransitionAnim: UIViewControllerAnimatedTransitioning {
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
        
        let contentFrame = transitionContext.containerView.bounds
        
        let frame = CGRect.init(x: 0,
                                   y: contentFrame.size.height * 2,
                                   width: contentFrame.size.width,
                                   height: contentFrame.size.height)
        
        UIView.animate(withDuration: self.duration, animations: {
            fromView?.frame = frame
            fromView?.alpha = 0
            maskView?.alpha = 0
        }) { (Bool) in
            transitionContext.completeTransition(true)
        }
    }
}
