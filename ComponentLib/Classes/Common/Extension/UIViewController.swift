//
//  UIViewController.swift
//  sng
//
//  Created by Matthew Loflin - Vendor on 7/24/17.
//  Copyright © 2017 Wal-mart Stores, Inc. All rights reserved.
//

import UIKit

extension UIViewController {
    var topMostPresentedViewController: UIViewController {
        get {
            return presentedViewController?.topMostPresentedViewController ?? self
        }
    }
    
    /**
     Determine the previous view controller that was visible, based on the
     presenting view controller or the navigation controller's stack.  If the
     presenting view controller is itself a navigation controller, then the
     controller at the top of the stack will be returned
     
     - Return the previous view controller, if any
     */
    @objc var previousViewController: UIViewController? {
        get {
            // if modal
            guard presentingViewController == nil else {
                if let presentingNav = presentingViewController as? UINavigationController {
                   return presentingNav.topViewController
                } else {
                    return presentingViewController
                }
            }
            // if part of navigation stack
            guard let navigation = navigationController, navigation.viewControllers.count >= 2 else {
                return nil
            }
            
            let count = navigation.viewControllers.count
            return self.navigationController?.viewControllers[count - 2];
        }
    }
}
