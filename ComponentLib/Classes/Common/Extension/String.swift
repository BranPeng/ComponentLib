//
//  String.swift
//  ScanAndGo
//
//  Created by Matthew Loflin - Vendor on 6/19/17.
//  Copyright © 2017 Walmart. All rights reserved.
//

import UIKit

extension String {
    func contains(_ substring: String) -> Bool {
        return range(of: substring) != nil
    }
    
    func matches(for regex: String) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: self, range: NSRange(self.startIndex..., in: self))
            return results.count > 0
        } catch {
            return false
        }
    }
    
    func isEmail() -> Bool {
        return self.matches(for: ".+@.+\\..+")
    }
    
    func isUSPhoneFormat() -> Bool {
        let nonDigit = CharacterSet(charactersIn: "0123456789").inverted
        let rawDigits = self.trimmingCharacters(in: nonDigit)
        return rawDigits.count == 7
            || rawDigits.count == 10
            || rawDigits.count == 11
    }
    
    func substring(with range: NSRange) -> String? {
        guard let subRange = Range(range, in: self) else {
            return nil
        }
        return String(self[subRange])
    }
    
    var applyEmailMask: String? {
        let pattern = "(?<=^.).*(?=.@)"
        
        guard let regEx = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive) else {
            return nil
        }
        
        let range = regEx.rangeOfFirstMatch(in: self, options: [], range: NSMakeRange(0, count))
        let subString = String(repeating: "*", count: range.length)
        return regEx.stringByReplacingMatches(in: self, options: [], range: NSMakeRange(0, count), withTemplate: subString)
    }
    
    func zeroPad(to length: Int) -> String {
        guard self.count <= length else {
            return self
        }
        return "".padding(toLength: length - self.count, withPad: "0", startingAt: 0) + self
    }
}

extension NSString {
    @objc static func applyMask(to email: NSString?) -> NSString? {
        return ((email as String?)?.applyEmailMask as NSString?) ?? email
    }
}

extension String {
    static var versionBuildNumberFormat: String {
        get { return NSLocalizedString("version.build.number.format", value: "%@ (%@)", comment: "app version number (as string) and build number (as string)") }
    }
    
    static var prefixVersionBuildNumberFormat: String {
        get { return NSLocalizedString("prefix.version.build.number.format", value: "v%@ (%@)", comment: "app version number (as string) and build number (as string)") }
    }
    
    static var firstAndLastNameFormat: String {
        get { return NSLocalizedString("first.last.name.format", value: "%@ %@", comment: "the first name (as string) and last name (as string)") }
    }
}

// MARK: -  Validation

extension String {
    var isValidEmail: Bool {
        // Regex obtained from http://www.cocoawithlove.com/2009/06/verifying-that-string-is-email-address.html
        let emailRegexPattern = "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}" +
                                "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" +
                                "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-" +
                                "z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5" +
                                "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" +
                                "9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" +
                                "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        
        guard let emailRegex = try? NSRegularExpression(pattern: emailRegexPattern, options: .caseInsensitive) else {
            return false
        }
        
        let range = emailRegex.rangeOfFirstMatch(in: self, options: [], range: NSMakeRange(0, count))
        return !NSEqualRanges(range, NSMakeRange(NSNotFound, 0))
    }
    
    var isValidPassword: Bool {
        get {
            guard self.count >= 7 else {
                return false
            }
            
            var uniqueSets: Int = 0
            for characterSet in String.passwordCharacterSets {
                if let _ = self.rangeOfCharacter(from: characterSet) {
                    uniqueSets += 1
                    if uniqueSets > 1 {
                        return true
                    }
                }
            }
            
            return false
        }
    }
    
    private static let passwordCharacterSets: [CharacterSet] = {
        return [CharacterSet.lowercaseLetters, CharacterSet.uppercaseLetters, CharacterSet.decimalDigits, CharacterSet.symbols]
    } ()
    
    var isValidCVV: Bool {
        return count >= 3 && count <= 4
    }
}

// MARK: User name capitalization
extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
