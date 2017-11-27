//
//  SheetViewController.swift
//  TransitionAnimDemo
//
//  Created by lisilong on 2017/11/27.
//  Copyright © 2017年 LongShaoDream. All rights reserved.
//

import UIKit

class SheetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true, completion: nil)
    }
}


extension SheetViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return LSLSheetTransitionAnim()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return LSLSheetDismissTransitionAnim()
    }
}

