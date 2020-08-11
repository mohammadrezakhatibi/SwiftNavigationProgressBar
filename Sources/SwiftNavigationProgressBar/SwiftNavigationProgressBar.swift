//
//  SwiftNavigationProgressBar.swift
//  SwiftNavigationProgressBar
//
//  Created by MohammadReza Khatibi on 10/12/19.
//  Copyright © 2019 MohammadReza Khatibi. All rights reserved.
//


import UIKit


public class SwiftNavigationProgressBar: UINavigationController, UINavigationControllerDelegate {

    private lazy var bar                                    = self.navigationBar
    private lazy var tabBarHeight                           = self.navigationBar.frame.size.height
    private var currentStep                                 : Int!
    private var container                                   = UIView()

    @IBInspectable public var showProgressBar               : Bool    = false
    @IBInspectable public var showProgressBarOnFirstPage    : Bool    = true
    @IBInspectable public var stepCount                     : Int     = 0
    @IBInspectable public var startColor                    : UIColor = .blue
    @IBInspectable public var endColor                      : UIColor = .green
    @IBInspectable public var stepBarHeight                 : CGFloat = 3.0
    @IBInspectable public var stepMargin                    : CGFloat = 4.0
    @IBInspectable public var sepratorColor                 : UIColor = .clear
    

    override public func viewDidLoad() {
        self.delegate = self
    }
    
    public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        if self.showProgressBar == true {
            self.currentStep                = showProgressBarOnFirstPage ? self.viewControllers.count :  self.viewControllers.count - 1
            let stepWidth                   = ((self.view.frame.width) / CGFloat(self.stepCount))
            
            self.container.frame.origin.x   = 0
            self.container.frame.origin.y   = CGFloat(self.tabBarHeight)
            
            UIView.animate(withDuration: 0.35, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
                
                self.container.frame.size.width = CGFloat(self.currentStep) * stepWidth
                self.container.frame.size.height = self.stepBarHeight
                
            }, completion: nil)

            self.addStepGradiant()
            self.addStepSeprators()

            self.bar.addSubview(self.container)
            
        }
    }
    
    public func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
        if self.showProgressBar == false {
            self.container.removeFromSuperview()
        }
    }
    
    // Add Gradinat to container view
    private func addStepGradiant() {
        
        self.container.clipsToBounds    = true
        
        let graindiant                  = CAGradientLayer()
        graindiant.frame                = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.container.frame.height)
        graindiant.startPoint           = CGPoint(x: 0, y: 0)
        graindiant.endPoint             = CGPoint(x: 1, y: 0)
        graindiant.colors               = [self.startColor.cgColor, self.endColor.cgColor]
        
        self.container.layer.insertSublayer(graindiant, at: 0)
    }

    // Add Seprator
    private func addStepSeprators() {
        
        for i in 0...self.stepCount - 1 {
            let stepWidth                   = self.view.frame.width / CGFloat((self.stepCount))
            let sepratorView                = UIView()
            sepratorView.backgroundColor    = sepratorColor
            
            if i != 0 {
                sepratorView.frame = CGRect(x: CGFloat(i) * stepWidth, y: 0, width: self.stepMargin, height: self.stepBarHeight)
            }
            self.container.addSubview(sepratorView)
        }
    }
    
}

