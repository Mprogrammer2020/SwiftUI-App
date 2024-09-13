//
//  CommonClasses.swift
//  AIGirlfriend
//
//  Created by Netset on 22/07/24.
//

import Foundation
import SwiftUI

class Tool {
    static func hiddenTabBar() {
        if let rootViewController = UIApplication.shared.windows.first?.rootViewController as? UITabBarController {
            rootViewController.tabBar.isHidden = true
        }
    }
    
    static func showTabBar() {
        if let rootViewController = UIApplication.shared.windows.first?.rootViewController as? UITabBarController {
            rootViewController.tabBar.isHidden = false
        }
    }
}

struct ShowTabBar: ViewModifier {
    func body(content: Content) -> some View {
        content.onAppear {
            Tool.showTabBar()
        }
    }
}

struct HiddenTabBar: ViewModifier {
    func body(content: Content) -> some View {
        content.onAppear {
            Tool.hiddenTabBar()
        }
    }
}

extension View {
    func showTabBar() -> some View {
        self.modifier(ShowTabBar())
    }
    
    func hideTabBar() -> some View {
        self.modifier(HiddenTabBar())
    }
}
