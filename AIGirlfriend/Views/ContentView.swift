//
//  ContentView.swift
//  AIGirlfriend
//
//  Created by Netset on 13/06/24.
//


import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
                ZStack {
                    Image("ic_SuperCute")
                        .resizable()
//                        .blur(radius: 50)
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
                    
                    
                    VStack {
                        Spacer()
                        VStack(alignment: .leading, spacing: 10) {
                            Text("AI Girlfriend")
                                .font(.custom("Michroma", size: 38))
                                .fontWeight(.bold)
                                .foregroundColor(.pink)
                                .minimumScaleFactor(0.5)
                                .lineLimit(1)
                            
                            Text("Try this amazing AI Chat app in which you can find various AI anime girlfriends to chat with like never before. Start your conversation and make them more interesting by sharing all your emotions.")
                                .font(.custom("Kanit-Bold", size: 14))
                                .foregroundColor(.pink)
                                .lineLimit(nil)
                                .minimumScaleFactor(0.5)
                        }
                        .padding(.horizontal, 25)
                        
                        NavigationLink(destination: TermsOfServices()) {
                            ZStack {
                                Image("ic_GetStarted")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: .infinity, maxHeight: 60)
                                    .padding(.horizontal, 40)
                                
                                Text("Get Started")
                                    .font(.custom("Michroma", size: 16))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.leading, 20)
                            }
                            .padding(.trailing,-195)
                            
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    .padding(.bottom)
                }
            }
        .navigationBarHidden(true)
    }
}


#Preview {
    ContentView()
}
