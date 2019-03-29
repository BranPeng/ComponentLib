//
//  Date.swift
//  sng
//
//  Created by Matthew Loflin - Vendor on 9/13/17.
//  Copyright © 2017 Wal-mart Stores, Inc. All rights reserved.
//

import Foundation

extension Date {
    /**
     Convert today's date to a string using the Date.timestampDataFormatter.
     
     - Returns: A string represenation of today's date.
     */
    static var todayAsTimestampString: String {
        get { return Date().asString() }
    }
    
    /**
     Convert the date to a string using the passed in DateFormatter.
     
     - Parameter dateFormatter: The date formatter to be used when formatting the date.
     - Returns: A string represenation of the date.
     */
    func asString(dateFormatter: DateFormatter = timestampDateFormatter) -> String {
        return dateFormatter.string(from: self)
    }
    
    /**
     Static reference to reduce the creation of this common date formatter
     that will display the date in the following format:
     
     "yyyy-MM-dd'T'HH:mm:ssZ"
     
     - Returns: A shared date formatter
     */
    static let timestampDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatter
    } ()
    
    /**
     Static reference to reduce the creation of a date of birth formatter
     that will display the date in date of birth standard US format
     
     "MM/DD/YYYY"
     
     - Returns: A shared date formatter
     */
    static let dateOfBirthFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        return formatter
    } ()
    
    /**
     Convenience method to detect the format of the ISO date based on the value.
     Callers should not cache the formatter, and instead, should always call this
     method with the dateString to modify the internal singleton DateFormatter's
     format.
     
     - Param dateStringz: the date as an ISO 8601 formatted string
     - Return the date formatter to parse the string
     */
    static func isoDateFormatter(for dateString: String) -> DateFormatter {
        var format = "yyyy-MM-dd"
        
        if dateString.contains("T") {
            format = "\(format)'T'HH:mm:ss"
        }
        
        if dateString.contains(".") {
            format = "\(format).SSS"
        }
        
        if dateString.matches(for: ".*((Z?(\\+|-)\\d{4})|Z)$") {
            // Ends with a, + or -, four digit timezone and Z (e.g. "-0500Z").
            format = "\(format)Z"
        } else if dateString.matches(for: "(\\+|-)\\d{2}:\\d{2}$") {
            // End with a, + or -, two pairs of digits (hours delimited from minutes via a colon) timezone offset with no Z. (e.g. "-05:00").
            format = "\(format)ZZZZ"
        }
        
        isoDateFormatter.dateFormat = format
        return isoDateFormatter
    }
    
    /**
     Convert a UTC date as a string to a date for the given time zone, formatted
     in the optional string format.  Returned format will use a default of yyyy-MM-dd
     if a format is not provided.
     
     - Param utcDateString: a utc date string
     - Param timeZone: time zone abbreviation ("PST")
     - Param format: string format for the date.  defaults to yyyy-MM-dd
     - Return a formatted date string in the time zone specified
     */
    static func convert(utcDateString: String, timeZone: String, format: String = "yyyy-MM-dd") -> String? {
        guard let isoUTCDateFormatter = isoDateFormatter(for: utcDateString).copy() as? DateFormatter,
            let utcDate = isoUTCDateFormatter.date(from: utcDateString),
            let timeZone = TimeZone(abbreviation: timeZone) else {
                return nil
        }
        isoUTCDateFormatter.dateFormat = format
        isoUTCDateFormatter.timeZone = timeZone
        return isoUTCDateFormatter.string(from: utcDate)
    }
    
    private static let isoDateFormatter: DateFormatter = {
        return DateFormatter()
    } ()
    
    var ageInYears: Int {
        guard let ageInYears = Calendar.current.dateComponents([.year], from: self, to: Date()).year else {
            return 0
        }
        
        return ageInYears
    }
    func getCurYear() -> String?{
        let dataFormatter = DateFormatter();
        dataFormatter.dateFormat = "yyyy";
        return dataFormatter.string(from: self as Date);
    }
    func addCusYear(_ next:Int) -> String?{
        let calendar = NSCalendar(calendarIdentifier: .gregorian);
        let offsetCom = NSDateComponents();
        offsetCom.year = next;
        let minDate = calendar?.date(byAdding: offsetCom as DateComponents, to: self, options: NSCalendar.Options.init(rawValue: 0));
        return minDate?.getCurYear();
    }

    //MARK: - 获取日期各种值
    //MARK: 年
    func year() ->Int {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.year,.month,.day], from: self)
        return com.year!
    }
    //MARK: 月
    func month() ->Int {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.year,.month,.day], from: self)
        return com.month!
        
    }
    //MARK: 日
    func day() ->Int {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.year,.month,.day], from: self)
        return com.day!
        
    }
    //MARK: 星期几
    func weekDay()->Int{
        let interval = Int(self.timeIntervalSince1970)
        let days = Int(interval/86400) // 24*60*60
        let weekday = ((days + 4)%7+7)%7
        return weekday == 0 ? 7 : weekday
    }
    //MARK: 当月天数
    func countOfDaysInMonth() ->Int {
        let calendar = Calendar(identifier:Calendar.Identifier.gregorian)
        let range = (calendar as NSCalendar?)?.range(of: NSCalendar.Unit.day, in: NSCalendar.Unit.month, for: self)
        return (range?.length)!
        
    }
    //MARK: 当月第一天是星期几
    func firstWeekDay() ->Int {
        //1.Sun. 2.Mon. 3.Thes. 4.Wed. 5.Thur. 6.Fri. 7.Sat.
        let calendar = Calendar(identifier:Calendar.Identifier.gregorian)
        let firstWeekDay = (calendar as NSCalendar?)?.ordinality(of: NSCalendar.Unit.weekday, in: NSCalendar.Unit.weekOfMonth, for: self)
        return firstWeekDay! - 1
        
    }
    //MARK: - 日期的一些比较
    //是否是今天
    func isToday()->Bool {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.year,.month,.day], from: self)
        let comNow = calendar.dateComponents([.year,.month,.day], from: Date())
        return com.year == comNow.year && com.month == comNow.month && com.day == comNow.day
    }
    //是否是这个月
    func isThisMonth()->Bool {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.year,.month,.day], from: self)
        let comNow = calendar.dateComponents([.year,.month,.day], from: Date())
        return com.year == comNow.year && com.month == comNow.month
    }
    
//    -----------
    //MARK: date转日期字符串
    static func dateToDateString(_ date:Date, dateFormat:String) -> String {
        let timeZone = NSTimeZone.local
        let formatter = DateFormatter()
        formatter.timeZone = timeZone
        formatter.dateFormat = dateFormat
        
        let date = formatter.string(from: date)
        return date
    }
    
    
    
    //MARK: 日期字符串转date
    static func dateStringToDate(_ dateStr:String) ->Date {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date
            = dateFormatter.date(from: dateStr)
        return date!
    }
    //MARK: 时间字符串转date
    static func timeStringToDate(_ dateStr:String) ->Date {
        let dateFormatter = DateFormatter()
        //        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = "yyyy-MM-dd  HH:mm:ss"
        let date
            = dateFormatter.date(from: dateStr)
        return date!
    }
    
    //MARK: 计算天数差
    static func dateDifference(_ dateA:Date, from dateB:Date) -> Double {
        let interval = dateA.timeIntervalSince(dateB)
        return interval/86400
        
    }
}
