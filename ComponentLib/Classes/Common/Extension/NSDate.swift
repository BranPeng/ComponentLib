//
//  NSDate.swift
//  sng
//
//  Created by Jimmy Lu on 9/11/17.
//  Copyright © 2017 Wal-mart Stores, Inc. All rights reserved.
//

import Foundation

extension NSDate {
    /**
     Static reference to reduce the creation of this common date formatter
     that will display the date in the following format:
     
         January 1, 2017
     
     - Returns: A shared date formatter.
     */
    @objc static let longDisplayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    /**
     Convert today's date to a string using the Date.timestampDataFormatter.
     
     - Returns: A string represenation of today's date.
     */
    @objc static var todayAsTimestampString: String {
        get { return Date.todayAsTimestampString }
    }
    
  
}
