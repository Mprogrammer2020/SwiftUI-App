//
//  TermsOfServices.swift
//  AIGirlfriend
//
//  Created by Netset on 28/06/24.
//

import SwiftUI

struct TermsOfServices: View {
    @State private var viewModel = TermsOfServicesVM()
    @State private var navigateToTabBar = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("ic_AppBackground")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
                VStack {
                    HStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image("ic_Back")
                                .resizable()
                                .frame(width: 30, height: 22)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        Spacer()
                        
                        Text("Terms of Use")
                            .font(.custom("Michroma", size: 24))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Image("ic_Navigation")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 44, height: 44)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top, 40)
                    
                    ScrollView(showsIndicators: false) {
                        Text("""
                              Posting rules you should be taking care of before you start interaction on our application:
                              
                              Assuring you carry the rights and eligibility to post any form  of content you are about to share. We never permit nudism on application. We won’t allow posting of sexually explicit content, sexually explicit text, images, or audio content depicting extreme sexual acts such as acts of posting Content that drives traffic to pornographic online services.
                              
                              Please note that we may make exceptions based on artistic, educational, historical, documentary, or scientific nature, or where there are other considerable benefits to the public at large.
                              
                              We don’t permit encouragement or applaud towards terrorism, formed crime scenes or hate association groups on our application. Attempting to sell sexual services or weapons and harmful drugs are also not permitted. We will remove reasonable threats of severity, hate arousing content/speech and the intentionally pointing of private individuals. We do not permit attacks/abuse based on skin colour, native, sex, gender, gender identity, sexual orientation, religion, disability or disease.
                              
                              Graphic violence is not allowed and we may remove videos or images of intense, graphic violence to make sure our application stays appropriate for everyone.
                              
                              If anyone or any account is spotted doing the above restricted activities they can be booked and arrested for the same. If viewers spot any violations of the above rules they have the right to report the content to us by using the report feature given in our application.
                              """)
                        .foregroundColor(.white)
                        .padding()
                        
                        CheckBoxField(title: "I understand that sharing of inappropriate content will not be tolerated.", isChecked: $viewModel.isContentInappropriate)
                            .padding(.horizontal)
                        
                        CheckBoxField(title: "I confirm that I'm 18 years old or above.", isChecked: $viewModel.isEighteenOrOlder)
                            .padding(.horizontal)
                        
                        
                        if viewModel.isContentInappropriate && viewModel.isEighteenOrOlder {
                            NavigationLink(destination: TabbarView(backgroundColor: .black), isActive: $navigateToTabBar) {
                                EmptyView()
                            }
                        }
                        
                        Button(action: {
                            if viewModel.isContentInappropriate && viewModel.isEighteenOrOlder {
                                navigateToTabBar = true
                            } else {
                                print("Please agree to terms")
                                navigateToTabBar = false
                            }
                        }) {
                            ZStack {
                                Image("ic_ButtonBackground")
                                    .resizable()
                                    .frame(width: 200, height: 60)
                                Text("Submit")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.horizontal)
                        .disabled(!(viewModel.isContentInappropriate && viewModel.isEighteenOrOlder))
                    }
                }
            }
            .padding(.bottom,30)
        }
        .navigationBarHidden(true)
    }
}

struct CheckBoxField: View {
    let title: String
    @Binding var isChecked: Bool
    var body: some View {
        Button(action: {
            isChecked.toggle()
        }) {
            HStack(alignment: .center, spacing: 5) {
                Image(systemName: isChecked ? "checkmark.circle.fill" : "circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .foregroundColor(.white)
                
                Text(title)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .font(.custom("Kanit-Light", size: 16))
            }
        }
    }
}

struct TermsOfServices_Previews: PreviewProvider {
    static var previews: some View {
        TermsOfServices()
    }
}
