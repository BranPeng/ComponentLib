//
//  UIScrollView+Helper.swift
//  sng
//
//  Created by Matthew Loflin - Vendor on 6/22/18.
//  Copyright © 2018 Wal-mart Stores, Inc. All rights reserved.
//

import UIKit

extension UIScrollView {
    @objc func objcScrollToTop(animation animated: Bool) {
        scrollToTop(animated: animated)
    }
    
    func scrollToTop(animated: Bool = true) {
        var offset: CGPoint
        
        if #available(iOS 11.0, *) {
            offset = CGPoint(x: -adjustedContentInset.left, y: -adjustedContentInset.top)
        } else {
            offset = CGPoint(x: -contentInset.left, y: -contentInset.top)
        }
        
        setContentOffset(offset, animated: animated)
    }
}
