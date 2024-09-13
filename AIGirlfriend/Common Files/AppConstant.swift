//
//  AppConstant.swift
//  AIGirlfriend
//
//  Created by Netset on 22/07/24.
//

import Foundation
import UIKit


final class Constants {
    
    private init() {}
    static let shared = Constants()
    let jsonDecoder = JSONDecoder()
    let jsonEncoder = JSONEncoder()
    
    enum AppInfo {
        static let DeviceType = "I"
        static let DeviceId = UIDevice.current.identifierForVendor?.uuidString ?? "unknown"
        static let appBundleID = Bundle.main.bundleIdentifier ?? "com.netset.AIGirlfriend"
        static let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0"
    }
}
