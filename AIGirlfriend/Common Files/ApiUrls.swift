//
//  ApiUrls.swift
//  AIGirlfriend
//
//  Created by Netset on 22/07/24.
//

import Foundation


struct ServerLink {
    static let baseUrlApi = "http://3.104.95.55/"
    static let imagesBaseUrlApi = "http://3.104.95.55/media/"
}

struct ApiUrl {
    static let saveDeviceID = ServerLink.baseUrlApi + "store-device-id/"
    static  let createCharacter = ServerLink.baseUrlApi + "create-character/"
    static let getCharatcers = ServerLink.baseUrlApi + "characters/"
    static let chat = ServerLink.baseUrlApi + "chat/"
    static let createPersonality = ServerLink.baseUrlApi + "create-personality/"
    static let createImage = ServerLink.baseUrlApi + "create-image/"
}

struct AppKeys {
    
    enum GoogleInfo {
        static let googleKey = ""
        static let clientKey = ""
    }
    
    enum stripeApikey {
        static let stripePublishKey = ""
    }
    
}
struct WebPageUrl {
    static let privacyPolicy = ""
    static let termsAndCondition = ""
    static let aboutUs = ""
    static let homeScreenLink = ""
}
