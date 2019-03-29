//
//  UIDevice.swift
//  SamsNowiOS
//
//  Created by Binfeng Peng - Vendor on 2018/8/8.
//  Copyright © 2018 Binfeng Peng - Vendor. All rights reserved.
//

import Foundation
import SamsIosShared
//import SwiftKeychainWrapper

extension UIDevice {
    public func is_iPhoneX() -> Bool {
        if UIScreen.main.bounds.height == 812 {
            return true
        }
        
        return false
    }
    
    public static func safeBottomHeight() -> Int {
        if UIScreen.main.bounds.height == 812 {
            return 34
        }
        
        return 0
    }
}

extension UIDevice {
    /**
     Convenience method to retrieve a unique identifier that identifies this
     device for the duration of the application's life.
     
     - Parameter keychainServiceName: The keychain service name where the value is stored.
     - Returns: a uuid meant to identify the device, for the life of the device
     */
    func deviceId(keychainServiceName: String = KeychainServiceName.standard.rawValue) -> String {
        if let deviceId = getDeviceId(keychainServiceName: keychainServiceName) {
            return deviceId
        }
        
        let freshDeviceId = UUID().uuidString
        setKeychain(string: freshDeviceId, forKey: .deviceIdKey, serviceName: keychainServiceName)
        return freshDeviceId
    }
    
    /**
     Conveniece method to clear out the device id so that the next
     call to `deviceId()` will return a new device id.  Typically this
     should never be called.
     
     - Parameter keychainServiceName: The keychain service name where the value is stored.
     */
    func clearDeviceId(keychainServiceName: String = KeychainServiceName.standard.rawValue) {
        setDeviceId(deviceId: nil, keychainServiceName: keychainServiceName)
    }
}

// MARK: - Device Id stored in Keychain
extension UIDevice {
    private enum KeychainServiceName: String {
        case standard = "sng.membership.service"
    }
    
    private enum KeychainKey: String {
        case deviceIdKey = "kSNGThreatMatrixDeviceIdentifierKey"
    }
    
    private func getDeviceId(keychainServiceName: String = KeychainServiceName.standard.rawValue) -> String? {
        return stringFromKeychain(forKey: .deviceIdKey, serviceName: keychainServiceName)
    }
    
    private func setDeviceId(deviceId: String?, keychainServiceName: String = KeychainServiceName.standard.rawValue) {
        setKeychain(string: deviceId, forKey: .deviceIdKey, serviceName: keychainServiceName)
    }
    
    private func stringFromKeychain(forKey key: KeychainKey,
                                    serviceName: String = KeychainServiceName.standard.rawValue,
                                    synchronizeViaiCloud: Bool = false,
                                    accessGroup: String? = nil) -> String? {
        return SDKeychain.string(forKey: key.rawValue,
                                 serviceName: serviceName,
                                 synchronizeViaiCloud: synchronizeViaiCloud,
                                 accessGroup: accessGroup)
    }
    
    private func setKeychain(string value: String?,
                             forKey key: KeychainKey,
                             serviceName: String = KeychainServiceName.standard.rawValue,
                             synchronizeViaiCloud: Bool = false,
                             accessGroup: String? = nil) {
        SDKeychain.setString(value,
                             forKey: key.rawValue,
                             serviceName: serviceName,
                             synchronizeViaiCloud: synchronizeViaiCloud,
                             accessGroup: accessGroup)
    }
}

