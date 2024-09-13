//
//  PersonalityView.swift
//  AIGirlfriend
//
//  Created by Netset on 16/07/24.
//

import SwiftUI

struct PersonalityView: View {
    @State private var selectedPersonalities: [String] = []
    @State private var selectedInterests: [String] = []
    @State private var characterName: String = ""
    @State private var characterAge: String = ""
    @State private var updatePersonalityCount: Int = 0
    @State private var updateInterestCount: Int = 0
    @Environment(\.presentationMode) var presentationMode
    
    let personalities = ["Shy", "Dominant","Virgin","Submissive", "Supportive", "Caring", "Has a crush on you", "Talkative", "Arrogant"]
    let interests = ["Likes gaming", "Wants to confess her love to you", "MILF", "Childhood friend", "Likes dancing", "Likes reading", "Doesn't know how pretty she is"]
    
    private var rowConfigs: [[String]] {
        var rows: [[String]] = []
        var index = 0
        let rowSizes = [4, 3, 3]
        for size in rowSizes {
            if index >= personalities.count { break }
            let row = Array(personalities[index..<min(index + size, personalities.count)])
            rows.append(row)
            index += size
        }
        return rows
    }
    
    
    private var interestRowConfigs: [[String]] {
        var rows: [[String]] = []
        var index = 0
        let rowSizes = [2, 3,3,3]
        for size in rowSizes {
            if index >= interests.count { break }
            let row = Array(interests[index..<min(index + size, interests.count)])
            rows.append(row)
            index += size
        }
        return rows
    }
    
    
    var body: some View {
        ZStack {
            Image("ic_AppBackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
            VStack(spacing: 10) {
                HStack(alignment: .center){
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image("ic_Back")
                            .resizable()
                            .frame(width: 30, height: 22)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding(.leading,20)
                    
                    Text("Personality")
                        .font(.custom(Fonts.michroma, size: 24))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.leading,50)
                    
                    Spacer()
                }
                .padding(.top, 40)
                
                ScrollView {
                    Text("Kindly select the character of your choice. I sincerely hope you will enjoy.")
                        .font(.custom(Fonts.kanitBlack, size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                    
                    VStack(alignment:.leading, spacing: 10) {
                        // PERSONALITY SECTION
                        Spacer()
                        
                        HStack {
                            Text("PERSONALITY")
                                .font(.custom(Fonts.kanitBlack, size: 14))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.leading,10)
                            
                            Image("ic_NextArrow")
                                .frame(width: 80,height: .infinity,alignment: .leading)
                            
                            Spacer()
                            
                            Text("(\(updatePersonalityCount)/3)")
                                .foregroundColor(.gray)
                                .padding(.trailing,20)
                        }
                        
                        Spacer()
                        
                        ForEach(0..<rowConfigs.count, id: \.self) { rowIndex in
                            HStack(spacing: 10) {
                                ForEach(rowConfigs[rowIndex], id: \.self) { personality in
                                    Button(action: {
                                        if selectedPersonalities.contains(personality) {
                                            selectedPersonalities.removeAll(where: { $0 == personality })
                                            updatePersonalityCount -= 1
                                        } else if selectedPersonalities.count < 3 {
                                            selectedPersonalities.append(personality)
                                            updatePersonalityCount += 1
                                        }
                                    }) {
                                        Text(personality)
                                            .font(.custom(Fonts.kanitThin, size: 14))
                                            .fontWeight(.bold)
                                            .padding(.vertical, 5)
                                            .padding(.horizontal, 15)
                                            .background(selectedPersonalities.contains(personality) ? Color.red : Color.white.opacity(0.2))
                                            .foregroundColor(.white)
                                            .cornerRadius(10)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(selectedPersonalities.contains(personality) ? Color.red : Color.white.opacity(0.5), lineWidth: 1)
                                            )
                                    }
                                }
                            }
                            .padding(.horizontal, 20)
                        }
                        
                        Spacer()
                        
                        // INTERESTS SECTION
                        HStack {
                            Text("INTERESTS")
                                .font(.custom(Fonts.kanitBlack, size: 14))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.leading,10)
                            
                            Image("ic_NextArrow")
                                .frame(width: 80,height: .infinity,alignment: .leading)
                            
                            Spacer()
                            
                            Text("(\(updateInterestCount)/3)")
                                .foregroundColor(.gray)
                                .padding(.trailing,20)
                            
                        }
                        
                        ForEach(0..<interestRowConfigs.count, id: \.self) { rowIndex in
                            HStack(spacing: 10) {
                                ForEach(interestRowConfigs[rowIndex], id: \.self) { interest in
                                    Button(action: {
                                        if selectedInterests.contains(interest) {
                                            selectedInterests.removeAll(where: { $0 == interest })
                                            updateInterestCount -= 1
                                        } else if selectedInterests.count < 3 {
                                            selectedInterests.append(interest)
                                            updateInterestCount += 1
                                        }
                                    }) {
                                        Text(interest)
                                            .font(.custom(Fonts.kanitThin, size: 14))
                                            .fontWeight(.bold)
                                            .padding(.vertical, 5)
                                            .padding(.horizontal, 15)
                                            .background(selectedInterests.contains(interest) ? Color.red : Color.white.opacity(0.2))
                                            .foregroundColor(.white)
                                            .cornerRadius(10)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(selectedInterests.contains(interest) ? Color.red : Color.white.opacity(0.5), lineWidth: 1)
                                            )
                                            .scaledToFill()
                                    }
                                }
                            }
                            .padding(.horizontal, 20)
                        }
                        
                        Spacer()
                        
                        HStack {
                            Text("WOULD YOU LIKE TO CALL HER")
                                .font(.custom(Fonts.kanitBlack, size: 14))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.leading,10)
                            
                            Image("ic_NextArrow")
                                .frame(width: 80,height: .infinity,alignment: .leading)
                        }
                        TextField("", text: $characterName,prompt: Text("Enter Character Name...").font(.custom(Fonts.kanitBlack, size: 16)).foregroundColor(.white))
                            .font(.custom(Fonts.kanitBlack, size: 16))
                            .accentColor(Color.white)
                            .padding()
                            .background(Color.black.opacity(0.8))
                            .cornerRadius(15)
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                        
                        HStack(spacing: 10) {
                            Text("AGE")
                                .font(.custom(Fonts.kanitBlack, size: 14))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.leading,10)
                            
                            Image("ic_NextArrow")
                                .frame(width: 80,height: .infinity,alignment: .leading)
                        }
                        TextField("", text: $characterAge, prompt: Text("Enter Age...").font(.custom(Fonts.kanitBlack, size: 16)).foregroundColor(.white))
                            .font(.custom(Fonts.kanitBlack, size: 16))
                            .keyboardType(.numberPad)
                            .padding()
                            .background(Color.black.opacity(0.8))
                            .cornerRadius(15)
                            .foregroundColor(Color(white: 1))
                            .padding(.horizontal, 20)
                        Spacer()
                        Button(action: {
                            
                        }) {
                            ZStack {
                                Image("ic_ButtonDoneBC")
                                Text("Done")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding()
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
        .onAppear {
            Tool.hiddenTabBar()
        }
        .onDisappear {
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    PersonalityView()
}
