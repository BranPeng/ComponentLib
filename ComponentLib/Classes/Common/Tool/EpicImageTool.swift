//
//  EpicImageTool.swift
//  SamsNowiOS
//
//  Created by Sijun Pan - Vendor on 2018/9/12.
//  Copyright © 2018年 Binfeng Peng - Vendor. All rights reserved.
//

import UIKit

import SamsModule

class EpicImageTool: NSObject {
    
    @objc class func getLocationImage(savePrice:Double) -> UIImage? {
        let isInClub = SamsContainer.shared.clubDetectionService.isInClub()
        return EpicImageTool.getLocationImageWith(savePrice: savePrice, isInClub: isInClub)
    }
    
    class func getLocationImageWith(savePrice:Double , isInClub:Bool) -> UIImage? {
        var locationImageViewName = "combinedShape"// default
        let isSavings = savePrice == 0.0 ? false : true
        locationImageViewName = isInClub ? (isSavings ? "combinedRedShape" : "combinedShape") : "combined"
        return UIImage(named: locationImageViewName)
    }

}
