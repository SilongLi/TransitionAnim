//
//  AlertViewController.swift
//  TransitionAnimDemo
//
//  Created by lisilong on 2017/11/27.
//  Copyright © 2017年 LongShaoDream. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // actions
    @IBAction func cancelBtnClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
     
    @IBAction func sureBtnClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension AlertViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return LSLAlertTransitionAnim.init(width: 300, height: 150)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return LSLAlertDismissTransitionAnim()
    }
}
