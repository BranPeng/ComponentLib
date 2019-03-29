//
//  UIFontE.swift
//  SamsNowiOS
//
//  Created by Haitao Chen on 2018/7/29.
//  Copyright © 2018年 Binfeng Peng - Vendor. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
//    class var samsClubSystemFontSizeWith14: UIColor {
//        return UIColor(red: 25.0/255.0, green: 119.0/255.0, blue: 211.0/255.0, alpha: 1.0)
//    }
    
    class func samsClubFont(ofSize:CGFloat)-> UIFont {
        return UIFont.systemFont(ofSize: ofSize)
    }
    class func samsClubBoldFont(ofSize:CGFloat)-> UIFont {
        return UIFont.boldSystemFont(ofSize:ofSize)
    }
    
    
}
