//
//  TabbarView.swift
//  AIGirlfriend
//
//  Created by Netset on 04/07/24.
//

import SwiftUI

struct TabbarView: View {
    @State private var selectedTab: Int = 0
    var backgroundColor: UIColor
    
    var body: some View {
        GeometryReader { geometry in
            CustomTabView(backgroundColor: backgroundColor, selectedTab: $selectedTab) {
                LoveListView()
                    .tabItem {
                        if selectedTab == 0 {
                            Image(uiImage: UIImage(named: "ic_Love_Selected") ?? UIImage())
                        } else {
                            Image(uiImage: UIImage(named: "ic_Love") ?? UIImage())
                        }
                        Text("Love List")
                    }
                    .tag(0)
                
                chatListView()
                    .tabItem {
                        if selectedTab == 1 {
                            Image(uiImage: UIImage(named: "ic_ChatList_Selected") ?? UIImage())
                        } else {
                            Image(uiImage: UIImage(named: "ic_ChatList") ?? UIImage())
                        }
                        Text("Chat List")
                    }
                    .tag(1)
                
                settingsView()
                    .tabItem {
                        if selectedTab == 2 {
                            Image(uiImage: UIImage(named: "ic_Setting_Selected") ?? UIImage())
                        } else {
                            Image(uiImage: UIImage(named: "ic_Setting") ?? UIImage())
                        }
                        Text("Settings")
                    }
                    .tag(2)
            }            
            .edgesIgnoringSafeArea(.all)
            .navigationBarHidden(true)
        }
    }
}

struct CustomTabView<Content: View>: UIViewControllerRepresentable {
    var backgroundColor: UIColor
    @Binding var selectedTab: Int
    var content: Content
    
    init(backgroundColor: UIColor, selectedTab: Binding<Int>, @ViewBuilder content: () -> Content) {
        self.backgroundColor = backgroundColor
        self._selectedTab = selectedTab
        self.content = content()
    }
    
    func makeUIViewController(context: Context) -> UITabBarController {
        let tabBarController = UITabBarController()
        let loveListVC = UIHostingController(rootView: LoveListView().edgesIgnoringSafeArea(.all).showTabBar())
        let chatListVC = UIHostingController(rootView: chatListView().edgesIgnoringSafeArea(.all).showTabBar())
        let settingsVC = UIHostingController(rootView: settingsView().edgesIgnoringSafeArea(.all).showTabBar())
        
        loveListVC.tabBarItem = UITabBarItem(title: "Love List", image: UIImage(named: "ic_Love"), selectedImage: UIImage(named: "ic_Love_Selected"))
        chatListVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "ic_ChatList"), selectedImage: UIImage(named: "ic_ChatList_Selected"))
        settingsVC.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(named: "ic_Setting"), selectedImage: UIImage(named: "ic_Setting_Selected"))
        
        tabBarController.viewControllers = [loveListVC, chatListVC, settingsVC]
        
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = backgroundColor
        tabBarController.tabBar.standardAppearance = appearance
        tabBarController.tabBar.scrollEdgeAppearance = appearance
        tabBarController.tabBar.tintColor = .clear
        tabBarController.tabBar.unselectedItemTintColor = .clear
        
        let selectedAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(Color(hex: 0xE9194B))
        ]
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = selectedAttributes
        
        if #available(iOS 15.0, *) {
            tabBarController.tabBar.scrollEdgeAppearance = appearance
        }
        tabBarController.tabBar.standardAppearance = appearance
        
        return tabBarController
    }
    
    func updateUIViewController(_ uiViewController: UITabBarController, context: Context) {
        uiViewController.selectedIndex = selectedTab
    }
}

#Preview {
    TabbarView(backgroundColor: .black)
}
