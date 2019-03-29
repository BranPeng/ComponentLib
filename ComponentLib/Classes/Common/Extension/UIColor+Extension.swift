//
//  UIColor.swift
//  CommonUI
//
//  Created by Matthew Loflin - Vendor on 4/12/18.
//  Copyright © 2018 SamsClub. All rights reserved.
//

import UIKit

@objc public extension UIColor {
    
    class var samsClubBlue: UIColor {
        return UIColor(red: 25.0/255.0, green: 119.0/255.0, blue: 211.0/255.0, alpha: 1.0)
    }
    
    class var samsClubGreenLight: UIColor {
        return UIColor(red: 128.0/255.0, green: 201.0/255.0, blue: 76.0/255.0, alpha: 1.0)
    }
    
    class var samsClubSngGreen: UIColor {
        return UIColor(red: 76.0/255.0, green: 169.0/255.0, blue: 12.0/255.0, alpha: 1.0)
    }
    
    class var samsClubOrange: UIColor {
        get { return UIColor(red: 234.0/255.0, green: 114.0/255.0, blue: 29.0/255.0, alpha: 1.0) }
    }
    
    class var samsClubLightYellow: UIColor {
        return UIColor(red: 255.0/255.0, green: 246.0/255.0, blue: 222.0/255.0, alpha: 1.0)
    }
    
    class var samsClubLightRed: UIColor {
        return UIColor(red: 253.0/255.0, green: 229.0/255.0, blue: 235.0/255.0, alpha: 1.0)
    }
    
    class var samsClubRed: UIColor {
        return UIColor(red: 236.0/255.0, green: 4/255.0, blue: 57.0/255.0, alpha: 1.0)
    }
    
    class var samsClubBackgroundGrey: UIColor {
        get { return UIColor(white: 232.0/255.0, alpha: 1.0) }
    }
    /**
     A light grey same as `samsClubVeryDarkGrey` with a 60% alpha.
     
     Note, this should be used in place of using samsClubVeryDarkGrey with an alpha of 60%
     unless the intention really is to give the object some transparency.
     */
    class var samsClubLightGrey: UIColor {
        get { return UIColor(white: 142/255.0, alpha: 1.0) }
    }
    
    class var samsClubDarkGrey: UIColor {
        return UIColor(white: 84.0/255.0, alpha: 1.0)
    }
    
    /**
     A dark grey same as `samsClubDarkGrey` with a 50% alpha.
     
     Note, this should be used in place of using samsClubDarkGrey with an alpha of 50%
     unless the intention really is to give the object some transparency.
     */
    class var samsClubDarkGreyAt50Percent: UIColor {
        get { return UIColor(white: 170/255.0, alpha: 1.0) }
    }
    
    /**
     A dark grey same as `samsClubDarkGrey` with a 20% alpha.
     
     Note, this should be used in place of using samsClubDarkGrey with an alpha of 20%
     unless the intention really is to give the object some transparency.
     */
    class var samsClubDarkGreyAt20Percent: UIColor {
        get { return UIColor(white: 217/255.0, alpha: 1.0) }
    }
    
    class var samsClubVeryDarkGrey: UIColor {
        return UIColor(white: 66.0/255.0, alpha: 1.0)
    }
    
    /**
     A dark grey same as `samsClubVeryDarkGrey` with a 10% alpha.
     
     Note, this should be used in place of using samsClubVeryDarkGrey with an alpha of 10%
     unless the intention really is to give the object some transparency.
     */
    class var samsClubDarkGreyAt10Percent: UIColor {
        return UIColor(white: 236.0/255.0, alpha: 1.0)
    }
    
    class var samsClubButtonBlue: UIColor {
        return UIColor(red: 0, green:122/255.0, blue: 1.0, alpha: 1.0)
    }
    
    class var samsClubButtonBlueHighlight: UIColor {
        return UIColor(red: 76.0/255.0, green: 162/255.0, blue: 1.0, alpha: 1.0)
    }
    
    class var samsNavigationHighlight: UIColor {
        return UIColor(white: 169.0/255.0, alpha: 1.0)
    }
    
    class var samsViewBackgroundLightGray: UIColor {
        return UIColor(red: 248/255.0, green: 248/255.0, blue: 248/255.0, alpha: 1.0)
    }
    class var samsErrorRedBackground: UIColor {
        return UIColor(red: 235/255.0, green: 13/255.0, blue: 0/255.0, alpha: 0.1)
    }
    class var samsWaringYellowBackground: UIColor {
        return UIColor(red: 255/255.0, green: 246/255.0, blue: 222/255.0, alpha: 1.0)
    }
}


extension UIColor {
    //返回随机颜色
    class var randomColor: UIColor {
        get {
            let red = CGFloat(arc4random()%256)/255.0
            let green = CGFloat(arc4random()%256)/255.0
            let blue = CGFloat(arc4random()%256)/255.0
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
    }
}
