//
//  ViewController.swift
//  TransitionAnimDemo
//
//  Created by lisilong on 2017/11/27.
//  Copyright © 2017年 LongShaoDream. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Mian"
    }
    
    // actions
    
    @IBAction func sheetViewBtnClicked(_ sender: Any) {
        self.sheetInfoView()
    }
    
    @IBAction func alertViewBtnClicked(_ sender: Any) {
        self.alertInfoView()
    }
    
    func sheetInfoView() -> () {
        let sheetVeiwController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SheetViewController")
        guard let sheetVC = sheetVeiwController as? SheetViewController else {
            print("加载SheetViewController控制器失败！")
             return
        }
        
        sheetVC.modalPresentationStyle = .overCurrentContext
        sheetVC.transitioningDelegate  = sheetVC as UIViewControllerTransitioningDelegate
        present(sheetVC, animated: true, completion: nil)
    }
    
    
    func alertInfoView() -> () {
        let alertVeiwController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AlertViewController")
        guard let alertVC = alertVeiwController as? AlertViewController else {
            print("加载AlertViewController控制器失败！")
            return
        }
        
        alertVC.modalPresentationStyle = .overCurrentContext
        alertVC.transitioningDelegate  = alertVC as UIViewControllerTransitioningDelegate
        present(alertVC, animated: true, completion: nil)
    }
}
