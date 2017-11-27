//
//  LSLSheetTransitionAnim.swift
//  TransitionAnimDemo
//
//  Created by lisilong on 2017/11/27.
//  Copyright © 2017年 LongShaoDream. All rights reserved.
//

import UIKit

class LSLSheetTransitionAnim: NSObject {
    var duration = 0.5
}

extension LSLSheetTransitionAnim: UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return self.duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let toVC: UIViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
        
        let contentFrame = transitionContext.containerView.bounds
        
        let maskView = UIView()
        maskView.backgroundColor = UIColor.darkGray.withAlphaComponent(0.2)
        maskView.frame = contentFrame
        maskView.alpha = 0
        maskView.tag   = 999 // 方便在dismiss动画中查找到当前的maskView
        
        let toView: UIView = toVC.view
        toView.frame = CGRect.init(x: 0,
                                   y: contentFrame.size.height * 2,
                                   width: contentFrame.size.width,
                                   height: contentFrame.size.height)
        
        transitionContext.containerView.addSubview(maskView)
        transitionContext.containerView.addSubview(toView)
        
        UIView.animate(withDuration: self.duration, animations: {
            toView.frame   = contentFrame
            toView.alpha   = 1
            maskView.alpha = 1
        }) { (Bool) in
             transitionContext.completeTransition(true)
        }
    }
}
