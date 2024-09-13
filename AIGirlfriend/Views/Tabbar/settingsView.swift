//
//  settingsView.swift
//  AIGirlfriend
//
//  Created by Netset on 04/07/24.
//

import SwiftUI

struct settingsView: View {
    let settings = settingsList.dummySettingsData
    
    var body: some View {
        ZStack {
            Image("ic_AppBackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
            VStack {
                HStack {
                    Text("Settings")
                        .font(.custom(Fonts.michroma, size: 24))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Image("ic_Navigation")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 44, height: 44, alignment: .leading)
                }
                .padding(.top, 80)
                .padding([.leading, .trailing], 20)
                
                List(settings) { setting in
                    HStack {
                        VStack(alignment: .leading, spacing: 0) {
                            Text(setting.name)
                                .font(.custom(Fonts.kanitLight, size: 15))
                                .foregroundColor(.white)
                        }
                        .padding(.leading, 10)
                        
                        Spacer()
                        
                        if !setting.image.isEmpty {
                            Image(setting.image)
                                .frame(width: 30, height: 30)
                        }
                    }
                    .padding(.vertical, 10)
                    .listRowBackground(Color.clear)
                    .listRowSeparatorTint(Color(white: 0.6), edges: .bottom)
                }
                .scrollIndicators(.hidden)
                .padding(.vertical, 10)
            }
            .listStyle(PlainListStyle())
            .background(Color.clear)
            .scrollContentBackground(.hidden)
        }
    }
}


struct settingsList: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    
    static var dummySettingsData: [settingsList] {
        return [
            settingsList(name: "Share App", image: "ic_Share"),
            settingsList(name: "Rate App", image: "ic_Rate"),
            settingsList(name: "Privacy Policy", image: "ic_Privacy_Policy")
        ]
    }
}

#Preview {
    settingsView()
}
