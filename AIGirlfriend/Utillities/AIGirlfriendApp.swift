//
//  AIGirlfriendApp.swift
//  AIGirlfriend
//
//  Created by Netset on 13/06/24.
//

import SwiftUI

@main
struct AIGirlfriendApp: App {
    
    @State var isActive : Bool = false
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            if self.isActive {
                ContentView()
            } else {
                SplashView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            self.isActive = true
                        }
                    }
            }
        }
    }
}
