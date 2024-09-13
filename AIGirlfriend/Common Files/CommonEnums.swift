//
//  CommonEnums.swift
//  AIGirlfriend
//
//  Created by Netset on 28/06/24.
//

import Foundation


enum Fonts {
    static let michroma = "Michroma-Regular"
    static let kanitBlack = "Kanit-Black"
    static let kanitThin = "Kanit-Thin"
    static let kanitLight = "Kanit-Light"
    
}

enum Tab: String {
    case loveList = "Love List"
    case chat = "Chat List"
    case settings = "Settings List"
    
    var image: String {
        switch self {
        case .loveList: return "ic_Love"
        case .chat: return "ic_ChatList"
        case .settings: return "ic_Setting"
        }
    }
}


enum NetworkError: Error {
    case invalidURL
    case decodingError
    case serverError(String)
}

enum Param {
    static let accept = "Accept"
    static let contentType = "content-type"
    static let deviceId = "device-id"
    static let deviceType = "deviceType"
    static let appVersion = "app-version"
    static let auth = "AUTHORIZATION"
    static let appJson = "application/json"
    static let ios = "i"
    static let requestFrom = "requestFrom"
    static let appVersionPassenger = "appVersionPassenger"
    static let timeZone = "timeZone"
    static let passenger = "passenger"
}

enum TextAlign {
    static let center = "C"
    static let left = "L"
}

enum UserDefaultsKeys {
    static let userInfo = "UserInfo"
}

// MARK: - CoreData Name
enum coreDataName {
    static let aiModel = "AIModel"
}

enum coreDataEntityKeys {
    // MARK: - Entity CreateModel
    static let name = "name"
    static let age = "age"
    static let interest = "interest"
    static let personality = "personality"
    
    // MARK: - Entity Chat
    static let receiverName = "receiverName"
    static let receiverImage = "receiverImage"
    static let receiverMessage = "receiverMessage"
    static let senderMessage = "senderMessage"
    static let senderName = "senderName"
    static let senderImage = "senderImage"
}

// MARK: - Entity  Names
enum coreDataEntities {
    static let Models = "CreateModel"
    static let chat = "Chat"
    
}
