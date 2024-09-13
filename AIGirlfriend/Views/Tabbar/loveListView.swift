//
//  loveListView.swift
//  AIGirlfriend
//
//  Created by Netset on 04/07/24.
//
import SwiftUI

struct LoveListView: View {
    
    //MARK: - Variable Declarations
    let columns = [
        GridItem(.flexible())
    ]
    let images = ["ic_HatGirl", "ic_Girl","ic_HatGirl", "ic_Girl","ic_HatGirl", "ic_Girl" ]
    @State private var currentIndex: Int = 0
    
    // MARK: View
    var body: some View {
        NavigationView {
            ZStack {
                Image("ic_AppBackground")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                
                VStack {
                    HStack(alignment: .top, spacing: 20) {
                        Text("AI Girlfriend")
                            .font(.custom(Fonts.michroma, size: 24))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Image("ic_AIgirlfriend")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 44, height: 44, alignment: .center)
                        
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(0..<images.count, id: \.self) { index in
                                ZStack(alignment: .bottomTrailing) {
                                    Image(images[index])
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: UIScreen.main.bounds.width - 130, height: UIScreen.main.bounds.height / 2.3)
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                        .shadow(radius: 5, x: 5, y: 5)
                                        .scrollTransition { content, phase in
                                            content
                                                .opacity(phase.isIdentity ? 1 : 0.5)
                                                .scaleEffect(y: phase.isIdentity ? 1 : 0.7)
                                        }
                                    
                                    Text("Maria")
                                        .font(.custom("Michroma", size: 16))
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding(10)
                                        .background(
                                            Image("ic_CharacterName")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 100, height: 38)
                                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                        )
                                        .padding([.bottom, .trailing], -5)
                                }
                                .tag(index)
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    .contentMargins(20, for: .scrollContent)
                    .scrollTargetBehavior(.viewAligned)
                    
                    VStack(spacing: 15) {
                        HStack {
                            Button(action: {
                                debugPrint("Previous")
                                withAnimation{
                                    if currentIndex > 0 {
                                        currentIndex -= 1
                                    } else {
                                        currentIndex = images.count - 1
                                    }
                                }
                            }) {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.black.opacity(0.7))
                                    .clipShape(Circle())
                            }
                            
                            Button(action: {
                                debugPrint("Next")
                                withAnimation {
                                    if currentIndex < images.count - 1 {
                                        currentIndex += 1
                                    } else {
                                        currentIndex = 0
                                    }
                                }
                            }) {
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.black.opacity(0.7))
                                    .clipShape(Circle())
                            }
                        }
                        .padding(.horizontal, 80)
                        
                        NavigationLink(destination: ChatView().hideTabBar()) {
                            HStack {
                                Text("Start Chat")
                                    .font(.custom(Fonts.michroma, size: 18))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                                Image("ic_Heart")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(
                                Image("ic_ButtonStartChat")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            )
                        }
                        .padding(.horizontal, 80)
                        
                        NavigationLink(destination: PersonalityView().hideTabBar()) {
                            HStack {
                                Text("Create Character")
                                    .font(.custom(Fonts.michroma, size: 12))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(
                                Image("ic_Frame")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            )
                        }
                        .padding(.horizontal, 100)
                        .padding(.bottom)
                    }
                }
            }
        }
    }
}

#Preview {
    LoveListView()
}
