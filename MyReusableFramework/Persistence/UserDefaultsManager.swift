//
//  UserDefaultsManager.swift
//  MyReusableFramework
//
//  Created by Peter Xu on 11/21/18.
//  Copyright © 2018 We Sense Inc. All rights reserved.
//

import Foundation

extension UserDefaults {
    subscript<T>(key: String) -> T? {
        get {
            return value(forKey: key) as? T
        }
        set {
            set(newValue, forKey: key)
        }
    }
    
    subscript<T: RawRepresentable>(key: String) -> T? {
        get {
            if let rawValue = value(forKey: key) as? T.RawValue {
                return T(rawValue: rawValue)
            }
            return nil
        }
        set {
            set(newValue?.rawValue, forKey: key)
        }
    }
}

enum AppTheme: Int {
    case light
    case dark
}

class SettingsService {
    
    var appTheme: AppTheme {
        get {
            return UserDefaults.standard[#function] ?? .light
        }
        set {
            UserDefaults.standard[#function] = newValue
        }
    }
}
