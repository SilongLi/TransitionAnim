//
//  LSLAlertTransitionAnim.swift
//  TransitionAnimDemo
//
//  Created by lisilong on 2017/11/27.
//  Copyright © 2017年 LongShaoDream. All rights reserved.
//

import UIKit

class LSLAlertTransitionAnim: NSObject {
    var duration = 0.1
    var width: CGFloat  = 0.0
    var height: CGFloat = 0.0
    
    init(width: CGFloat, height: CGFloat) {
        self.width  = width > 0 ? width : 300.0
        self.height = height > 0 ? height : 130.0
        super.init()
    }
}

extension LSLAlertTransitionAnim: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return self.duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let toVC: UIViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
        
        let contentFrame = transitionContext.containerView.bounds
        
        let maskView = UIView()
        maskView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        maskView.frame = contentFrame
        maskView.alpha = 0
        maskView.tag   = 999 // 方便在dismiss动画中查找到当前的maskView
        
        let toView: UIView = toVC.view
        toView.center = transitionContext.containerView.center
        toView.bounds.size = CGSize.init(width: self.width, height: self.height)
        toView.layer.cornerRadius  = 5
        toView.layer.masksToBounds = true
        toView.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
        
        transitionContext.containerView.addSubview(maskView)
        transitionContext.containerView.addSubview(toView)
        
        UIView.animate(withDuration: self.duration, animations: {
            toView.alpha   = 1
            maskView.alpha = 1
            toView.transform = CGAffineTransform.init(scaleX: 1.05, y: 1.05)
        }) { (Bool) in
            UIView.animate(withDuration: 0.15, animations: {
                toView.transform = CGAffineTransform.identity
            }, completion: { (_) in
                transitionContext.completeTransition(true)
            })
        }
    }
    
}
