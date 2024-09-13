//
//  ChatView.swift
//  AIGirlfriend
//
//  Created by Netset on 10/07/24.
//

import Combine
import SwiftUI

struct ChatView: View {
    @StateObject var viewModel = ChatVM()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Image("ic_AppBackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
            VStack {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image("ic_Back")
                            .resizable()
                            .frame(width: 25, height: 13, alignment: .leading)
                            .aspectRatio(contentMode: .fill)
                    }
                    .padding(.leading, 20)
                    .frame(width: 60, height: 30, alignment: .leading)
                    
                    HStack {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .cornerRadius(20)
                            .padding(.leading, 10)
                        
                        Text("Ruby")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding(.leading, 10)
                    }
                    Spacer()
                }
                .padding(.top, 20) // Adjust padding to ensure it fits well on all screens
                
                ScrollViewReader { proxy in
                    ScrollView {
                        LazyVStack {
                            ForEach(viewModel.messages, id: \.self) { message in
                                MessageCellView(currentMessage: message)
                                    .id(message.id)
                            }
                        }
                        .onChange(of: viewModel.messages) { _ in
                            withAnimation {
                                proxy.scrollTo(viewModel.messages.last?.id, anchor: .bottom)
                            }
                        }
                        .onAppear {
                            withAnimation {
                                proxy.scrollTo(viewModel.messages.last?.id, anchor: .bottom)
                            }
                        }
                    }
                    
                    HStack {
                        ZStack(alignment: .leading) {
                            if viewModel.newMessage.isEmpty {
                                Text("Typing something...")
                                    .foregroundColor(Color(white: 0.8))
                                    .padding(.leading, 10)
                            }
                            TextField("", text: $viewModel.newMessage)
                                .padding()
                                .keyboardType(.default)
                                .background(Color.black.opacity(0.2))
                                .cornerRadius(20)
                                .foregroundColor(Color.white)
                        }
                        
                        Button(action: {
                            viewModel.sendMessage()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                withAnimation {
                                    if let lastMessage = viewModel.messages.last {
                                        proxy.scrollTo(lastMessage.id, anchor: .bottom)
                                    }
                                }
                            }
                        }) {
                            Image(systemName: "paperplane.fill")
                                .foregroundColor(.white)
                                .padding(10)
                                .background(Color.red)
                                .clipShape(Circle())
                        }
                        .disabled(viewModel.newMessage.isEmpty)
                    }
                    .padding()
                    .background(Color.black.opacity(0.8))
                    .cornerRadius(20)
                    .padding(.bottom, 20)
                    .padding(.horizontal)
                }
                .scrollIndicators(.hidden)
            }
            .padding(.top, 20)
            .padding(.horizontal, 10)
        }
        .hideTabBar()
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ChatView()
}
