//
//  chatListView.swift
//  AIGirlfriend
//
//  Created by Netset on 04/07/24.
//

import SwiftUI

struct chatListView: View {
    let categories = ExpenseCategory.dummyExpenseData
    @State private var isShowTabbar: Bool = false

    var body: some View {
        NavigationStack {
            ZStack {
                Image("ic_AppBackground")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)

                
                GeometryReader { geometry in
                    VStack {
                        HStack {
                            Text("Messages")
                                .font(.custom(Fonts.michroma, size: geometry.size.width * 0.06))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            Image("ic_Navigation")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width * 0.1, height: geometry.size.width * 0.1)
                        }
                        .padding(.top, 40)
                        .padding(.horizontal, geometry.size.width * 0.05)
                        
                        List(categories) { category in
                            NavigationLink(destination: ChatView()) {
                                HStack {
                                    Image(category.image)
                                        .resizable()
                                        .frame(width: geometry.size.width * 0.15, height: geometry.size.width * 0.15)
                                        .clipShape(Circle())
                                    
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text(category.name)
                                            .font(.custom(Fonts.kanitLight, size: geometry.size.width * 0.04))
                                            .foregroundColor(.white)
                                        
                                        Text(category.description)
                                            .font(.custom(Fonts.kanitLight, size: geometry.size.width * 0.035))
                                            .foregroundColor(.gray)
                                            .lineLimit(nil)
                                    }
                                    .padding(.leading, 10)
                                    
                                    Spacer()
                                }
                                .padding(.vertical, 10)
                            }
                            .listRowBackground(Color.clear)
                            .listRowSeparatorTint(Color(white: 0.6), edges: .bottom)
                        }
                        .scrollIndicators(.hidden)
                        .listStyle(PlainListStyle())
                        .background(Color.clear)
                        .scrollContentBackground(.hidden)
                        .padding(.bottom)
                    }
                }
            }
        }
    }
}

struct ExpenseCategory: Identifiable {
    let id = UUID()
    let image: String
    let name: String
    let description: String
    
    static var dummyExpenseData: [ExpenseCategory] {
        return [
            ExpenseCategory(image: "ic_Offline_Girl", name: "Maria", description: "I got tickets to that concert we were talking about. I can't wait to go with you – it's going to be so much fun!"),
            ExpenseCategory(image: "ic_Online_Girl", name: "Sonia", description: "Hey love, how's your day going? I know you've got a lot on your plate, but I'm here if you need anything.❤️"),
            ExpenseCategory(image: "ic_Offline_Girl", name: "Sneha", description: "Hey love, how's your day going? I know you've got a lot on your plate, but I'm here if you need anything.❤️"),
            ExpenseCategory(image: "ic_Online_Girl", name: "Sofia", description: "I got tickets to that concert we were talking about. I can't wait to go with you – it's going to be so much fun!"),
            ExpenseCategory(image: "ic_Offline_Girl", name: "Maria", description: "I got tickets to that concert we were talking about. I can't wait to go with you – it's going to be so much fun!"),
            ExpenseCategory(image: "ic_Online_Girl", name: "Sonia", description: "Hey love, how's your day going? I know you've got a lot on your plate, but I'm here if you need anything.❤️"),
            ExpenseCategory(image: "ic_Offline_Girl", name: "Sneha", description: "Hey love, how's your day going? I know you've got a lot on your plate, but I'm here if you need anything.❤️"),
            ExpenseCategory(image: "ic_Online_Girl", name: "Sofia", description: "I got tickets to that concert we were talking about. I can't wait to go with you – it's going to be so much fun!")
        ]
    }
}



#Preview {
    chatListView()
}

