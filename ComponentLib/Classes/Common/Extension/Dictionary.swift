//
//  Dictionary.swift
//  sng
//
//  Created by Jimmy Lu on 8/7/17.
//  Copyright © 2017 Wal-mart Stores, Inc. All rights reserved.
//

import Foundation

extension Dictionary where Key == String, Value == Any {
    /**
     Convenience method to combine the current dictionary with a separate
     dictionary instance's objects
     
     - Parameter objects: a dictionary of [String : Any] pairs
     */
    @discardableResult
    mutating func combine(with objects: [String : Any]?) -> [String : Any] {
        guard let dict = objects else {
            return self
        }
        for (key, value) in dict {
            self[key] = value
        }
        return self
    }
    
    /**
     Require that the dictionary contains the key, with the specified type as
     it's value.  If the key does not exist, or the value is not as expected,
     then a DecodingError is thrown
     
     - Parameter codingKey: key to check
     - Parameter type: the type of the value
     */
    public func require<T>(codingKey: CodingKey, is type: T.Type) throws -> T {
        guard let value = self[codingKey.stringValue] as? T else {
            let debugMessage = "\(codingKey.stringValue) is required"
            let context = DecodingError.Context(codingPath: [codingKey],
                                                debugDescription: debugMessage)
            throw DecodingError.keyNotFound(codingKey, context)
        }
        return value
    }
    
    /*
     If possible, convert the Dictionary object into a well formated string representation of the JSON object.
     
     Note: Might come in handy for debugging.
     */
    var prettyPrint: String? {
        var options = JSONSerialization.WritingOptions.prettyPrinted
        if #available(iOS 11.0, *) {
            options = options.union(.sortedKeys)
        }
        
        guard let data = try? JSONSerialization.data(withJSONObject: self, options: options) else {
            return nil
        }
        
        return String(data: data, encoding: .utf8)
    }
    
    func convertToJSONString() -> String {
        var result:String = ""
        do {
            //如果设置options为JSONSerialization.WritingOptions.prettyPrinted，则打印格式更好阅读
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions.init(rawValue: 0))
            
            if let JSONString = String(data: jsonData, encoding: String.Encoding.utf8) {
                result = JSONString
            }
            
        } catch {
            result = ""
        }
        return result
    }
}

