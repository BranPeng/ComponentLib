//
//  Encodable.swift
//  sng
//
//  Created by Matthew Loflin - Vendor on 5/24/18.
//  Copyright © 2018 Wal-mart Stores, Inc. All rights reserved.
//

import UIKit

extension Encodable {
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else {
            return nil
        }
        
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
    
    /*
     If possible, convert the Encodable object into a well formated string representation of the JSON object.
     
     Note: Might come in handy for debugging.
     */
    var prettyPrint: String? {
        let encoder = JSONEncoder()
        if #available(iOS 11.0, *) {
            encoder.outputFormatting = JSONEncoder.OutputFormatting.prettyPrinted.union(.sortedKeys)
        } else {
            encoder.outputFormatting = .prettyPrinted
        }
        
        guard let data = try? encoder.encode(self) else {
            return nil
        }
        
        return String(data: data, encoding: .utf8)
    }
}
