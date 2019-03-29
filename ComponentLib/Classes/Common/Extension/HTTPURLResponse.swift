//
//  HTTPURLResponse.swift
//  sng
//
//  Created by Matthew Loflin - Vendor on 9/14/17.
//  Copyright © 2017 Wal-mart Stores, Inc. All rights reserved.
//

import Foundation

extension HTTPURLResponse {
    var isApplicationJson: Bool {
        get { return isContent(type: "application", subtype: "json") }
    }
    
    var isImagePng: Bool {
        get { return isContent(type: "image", subtype: "png") }
    }
    
    private func isContent(type: String, subtype: String) -> Bool {
        guard let contentTypeHeaderField = contentTypeHeaderField else {
            return false
        }
        
        return contentTypeHeaderField.components(separatedBy: ";").first == "\(type)/\(subtype)"
    }
    
    private var contentTypeHeaderField: String? {
        get { return allHeaderFields["Content-Type"] as? String }
    }
}
