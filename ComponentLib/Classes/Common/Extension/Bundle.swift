//
//  Bundle.swift
//  ScanAndGo
//
//  Created by Matthew Loflin - Vendor on 6/21/17.
//  Copyright © 2017 Walmart. All rights reserved.
//

import UIKit

extension Bundle {
    var version: String? {
        get { return infoDictionary?["CFBundleShortVersionString"] as? String }
    }
    
    var build: String? {
        get { return infoDictionary?["CFBundleVersion"] as? String }
    }
        
    var prefixFormattedVersionString: String? {
        get {
            guard let version = version, let build = build  else { return nil }
            return String.localizedStringWithFormat(.prefixVersionBuildNumberFormat, version, build)
        }
    }
}
