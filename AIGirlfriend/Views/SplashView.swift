//
//  SplashView.swift
//  AIGirlfriend
//
//  Created by Netset on 11/07/24.
//

import SwiftUI

struct SplashView: View {
    
    var body: some View {
        ZStack {
            Image("ic_Background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .blur(radius: 50)
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
            VStack {
                Spacer()
                VStack(alignment: .leading, spacing: 10) {
                    Text("AI Girlfriend")
                        .font(.custom(Fonts.michroma, size: 38))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)
                    Text("Try this amazing AI Chat app in which you can find various AI----------- anime girlfriends to chat with like newer before.Start your conversation and make them more interesting by sharing all your emotions.")
                        .font(.custom(Fonts.kanitThin, size: 14))
                        .foregroundColor(.init(white: 100))
                        .lineLimit(nil)
                        .minimumScaleFactor(0.5)
                }
                .padding(.leading, 25)
                .padding(.trailing, 20)
            }
            .safeAreaPadding(EdgeInsets(top: 0, leading: 0, bottom: 80, trailing: 0))
        }
    }
}

#Preview {
    SplashView()
}
